using Quiz.Web.API.Shared;
using Quiz.Web.APIModel;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Threading.Tasks;

namespace Quiz.Web.QueryServices.Quiz
{
    public class QuizQueryServices
    {
        private readonly QuizMasterDBEntities _context;

        public QuizQueryServices()
        {
            _context = new QuizMasterDBEntities();

        }

        public ApiResponse<IEnumerable<QuizApiModel>> GetQuizesAsync()
        {
            var quizes = new ApiResponse<IEnumerable<QuizApiModel>>();

            var quizesData = _context.Quizes.ToList();

            quizes.TotalRecordCount = quizesData.Count();

            if (quizes.TotalRecordCount.HasValue)
            {
                quizes.Result = quizesData.Select(quize => new QuizApiModel
                {
                    Id = quize.Id,
                    Name = quize.Name,
                    Description = quize.Description,
                    Duration = quize.Duration,
                    PassingPercentage = quize.PassingPercentage,
                    IsActive = quize.IsActive,
                    CreatedDate = quize.CreatedDate,
                    QuizLinkId = Utility.EncryptData(Convert.ToString(quize.Id)),
                    TotalParticipated = _context.QuizAttemptDetails.Where(x => x.QuizId == quize.Id).Count(),
                    Questions = quize.Questions.Where(a => a.IsActive)?.Select(s => s.ToQuestionApiModel())
                });
            }

            return quizes;
        }
        public QuizApiModel GetQuizById(int Id)
        {
            var quizdata = _context.Quizes.Where(x => x.Id == Id && x.IsActive).FirstOrDefault();
            quizdata.Questions = quizdata.Questions.Where(x => x.IsActive).ToList();

            var quizResult = quizdata.ToQuizApiModel();

            return quizResult;
        }
        public ApiResponse<QuizApiModel> CreateQuiz(QuizApiModel quizApiModel)
        {
            var response = new ApiResponse<QuizApiModel>();

            var quiz = quizApiModel.ToQuize();
            quiz.CreatedDate = DateTime.Now;

            _context.Quizes.Add(quiz);
            int rowAffected = _context.SaveChanges();

            response.IsSucceeded = rowAffected > 0;
            quizApiModel.Id = quiz.Id;
            response.Result = quizApiModel;

            return response;
        }
        public ApiResponse<QuizApiModel> UpdateQuiz(QuizApiModel quizApiModel)
        {

            var response = new ApiResponse<QuizApiModel>();

            var quiz = _context.Quizes.FirstOrDefault(x => x.Id == quizApiModel.Id);
            quiz.Description = quizApiModel.Description;
            quiz.Duration = quizApiModel.Duration;
            quiz.PassingPercentage = quizApiModel.PassingPercentage;

            _context.Entry(quiz).State = EntityState.Modified;
            int rowAffected = _context.SaveChanges();

            response.IsSucceeded = rowAffected > 0;
            response.Result = quizApiModel;

            return response;
        }
        public bool DeleteQuiz(int Id)
        {
            var quiz = _context.Quizes.Where(x => x.Id == Id).FirstOrDefault();
            quiz.IsActive = false;
            _context.Entry(quiz).State = EntityState.Modified;
            int rowAffected = _context.SaveChanges();
            return rowAffected > 0;
        }
        public bool ActivateQuiz(int Id)
        {
            var question = (_context.Quizes.Where(x => x.Id == Id)).FirstOrDefault();
            question.IsActive = true;
            _context.Entry(question).State = System.Data.Entity.EntityState.Modified;
            int rowAffected = _context.SaveChanges();

            return rowAffected > 0;
        }
        public bool CheckQuizHasAttempted(int quizId, int participantId)
        {
            var date = DateTime.Now.AddDays(-30);
            var quiz = _context.QuizAttemptDetails
                .Where(x => x.QuizId == quizId &&
                            x.ParticipantId == participantId &&
                            x.AttemptDate > date).ToList();

            return (quiz != null && quiz.Count() > 0);

        }
        public Task SubmitQuiz(int participantId, QuizApiModel quizApiModel)
        {
            using (DbContextTransaction dbTran = _context.Database.BeginTransaction())
            {
                try
                {
                    var QuizAttemptModel = new QuizAttemptDetail
                    {
                        AttemptDate = DateTime.Now,
                        QuizId = quizApiModel.Id,
                        ParticipantId = participantId
                    };
                    _context.QuizAttemptDetails.Add(QuizAttemptModel);
                    _context.SaveChanges();


                    var quizResultModel = quizApiModel.Questions?.Select(x => new QuizResult
                    {
                        AttemptId = QuizAttemptModel.Id,
                        QuestionId = x.Id,
                        SelectedAnswer = x.Options.Where(o => o.IsSelected).Count()>0?
                        x.Options.Where(o => o.IsSelected).Select(s=>s.Id.ToString())?.Aggregate((a, b) => $"{a},{b}"):null,
                        ActualAnswer = x.Options.Where(o => o.IsAnswer)?.Select(s => s.Id.ToString())?.Aggregate((a, b) => $"{a},{b}"),
                    });

                    _context.QuizResults.AddRange(quizResultModel);
                    _context.SaveChanges();
                    dbTran.Commit();
                }
                catch (DbEntityValidationException ex)
                {
                    dbTran.Rollback();
                    throw;
                }

            }
            return Task.FromResult(0);
        }

        public QuizResultApiModel GetQuizResults(int attemptId)
        {
            var quizResult = _context.Quizes.Join(_context.QuizAttemptDetails,
                q => q.Id, a => a.QuizId, (q, a) => new { q, a }
                ).Where(x => x.a.Id == attemptId)
                .Select(
                  o => new QuizResultApiModel
                  {
                      Id = o.q.Id,
                      Name = o.q.Name,
                      Description = o.q.Description,
                      Duration = o.q.Duration,
                      PassingPercentage = o.q.PassingPercentage,
                      AttemptId = o.a.Id,
                      AttemptDate = o.a.AttemptDate,
                      Questions = o.q.Questions
                      .Join(o.a.QuizResults.Where(x => x.AttemptId == o.a.Id), n => n.Id, m => m.QuestionId, (n, m) => new { n, m })
                      .Select(x => new QuestionApiModel
                      {
                          Id = x.n.Id,
                          Name = x.n.Name,
                          IsActive = x.n.IsActive,
                          Options = x.n.Options.Select(r => new OptionApiModel
                          {
                              Id = r.Id,
                              Code = r.Code,
                              Name = r.Name,
                              IsAnswer = r.IsAnswer,
                              SetSelectedOptions = x.m.SelectedAnswer
                          })
                      })
                  }
                ).FirstOrDefault();

            GetResults(quizResult);

            return quizResult;

        }

        private void GetResults(QuizResultApiModel quizResult)
        {
            int totalAttemptedQuestion;
            int totalCorrectAnswer;
            GetAttemptedAndCorrectAnswer(quizResult.AttemptId, quizResult.Id, out totalAttemptedQuestion, out totalCorrectAnswer);

            quizResult.TotalQuestions = quizResult.Questions.Count();
            quizResult.TotalQuestionsAttempt = totalAttemptedQuestion;
            quizResult.TotalCorrectAnswer = totalCorrectAnswer;
            quizResult.TotalWrongAnswer = quizResult.TotalQuestions - totalCorrectAnswer;

            decimal percentageMarks = getMarksInPercentage(totalCorrectAnswer, quizResult.TotalQuestions);
            quizResult.MarksInPercentage = Math.Round(percentageMarks, 2);
            quizResult.ResultStatus = Math.Round(quizResult.MarksInPercentage) >= quizResult.PassingPercentage ? "Pass" : "Fail";
        }

        private void GetAttemptedAndCorrectAnswer(int attemptId, int quizId,out int totalAttemptedQuestion,out int totalCorrectAnswer)
        {
           
            var quizResult = _context.QuizAttemptDetails
                .Join(_context.QuizResults, q => q.Id, a => a.AttemptId, (q, a) => new { q, a })
                .Where(x => x.q.QuizId == quizId && x.a.AttemptId == attemptId)?
                .Select(x => x.a).ToList();

             totalCorrectAnswer = 0;
            totalAttemptedQuestion = 0;
             totalAttemptedQuestion = quizResult.Where(x => !string.IsNullOrEmpty(x.SelectedAnswer)).Count();

            foreach (var resultItem in quizResult)
            {

                totalCorrectAnswer += (!string.IsNullOrEmpty(resultItem.ActualAnswer) && !string.IsNullOrEmpty(resultItem.SelectedAnswer)
                    && resultItem.ActualAnswer == resultItem.SelectedAnswer) ? 1 : 0;
            }   
        }   
        private decimal getMarksInPercentage(decimal totalCorrectAnswer, decimal totalQuestions)
        {
            return (totalCorrectAnswer / totalQuestions) * 100;
        }

    }
}
