using Quiz.Web.APIModel;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

            var quizesData = _context.Quizes.Where(x => x.IsActive).ToList();

            quizes.TotalRecordCount = quizesData.Count();
            quizes.Result = quizesData?.Select(x => x.ToQuizApiModel());

            return quizes;
        }
        public QuizApiModel GetQuizById(int Id)
        {
            var quizdata = _context.Quizes.Where(x => x.Id == Id && x.IsActive).FirstOrDefault();

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
        public Task UpdateQuiz(QuizApiModel quiz)
        {

            //save to db
            return Task.FromResult(0);
        }
        public bool DeleteQuiz(int Id)
        {
            var quiz = _context.Quizes.Where(x => x.Id == Id).FirstOrDefault();
            quiz.IsActive = false;
            _context.Entry(quiz).State = EntityState.Modified;
            int rowAffected = _context.SaveChanges();
            return rowAffected > 0;
        }

        public bool CheckQuizHasAttempted(int quizId, int userId)
        {
            var quiz= _context.QuizAttemptDetails.Where(x => x.QuizId == quizId && x.UserId == userId).ToList();
            return (quiz!=null && quiz.Count()>0);
           
        }
        public bool SubmitQuiz(int userId, QuizApiModel quizApiModel)
        {
           
            var QuizAttemptModel = new QuizAttemptDetail
            {
                AttemptDate = DateTime.Now,
                QuizId = quizApiModel.Id,
                UserId = userId
            };
            _context.QuizAttemptDetails.Add(QuizAttemptModel);
            _context.SaveChanges();


            var quizResultModel = quizApiModel.Questions?.Select(x => new QuizResult
            {
                AttemptId = QuizAttemptModel.Id,
                QuestionId = x.Id,
                SelectedAnswer = x.Options.Where(o=>o.SelectedOptionId.HasValue).FirstOrDefault()?.Id
            });

            _context.QuizResults.AddRange(quizResultModel);
            int r= _context.SaveChanges();

           
            return r>0;
        }

        public QuizApiModel GetQuizResults(int quizId, int userId)
        {
            var data = _context.Quizes.Join(_context.QuizAttemptDetails,
                q => q.Id, a => a.QuizId, (q, a) => new { q, a }
                ).Where(x => x.q.Id == quizId && x.a.UserId == userId)
                .Select(
                  o=>new QuizApiModel {
                      Id=o.q.Id,
                      Name=o.q.Name,
                      Description=o.q.Description,
                      Duration=o.q.Duration,
                      PassingPercentage=o.q.PassingPercentage ,                   
                      Questions=o.q.Questions.Join(o.a.QuizResults,n=>n.Id,m=>m.QuestionId,(n,m)=>new{ n,m})
                      .Select(x=>new QuestionApiModel {
                          Id=x.n.Id,
                          Name= x.n.Name,
                          IsActive= x.n.IsActive,
                          Options= x.n.Options.Select(r=>new OptionApiModel {
                              Id=r.Id,
                              Code=r.Code,
                              Name=r.Name,
                              SelectedOptionId=x.m.SelectedAnswer,
                              IsAnswer=r.IsAnswer                              
                          })
                      })
                  }
                ).FirstOrDefault();              
                
            

            return data;
            

        }
    }
}
