using Quiz.Web.APIModel.Quiz;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.QueryServices
{
    public class QuestionQueryServices
    {
        private readonly QuizMasterDBEntities _context;

        public QuestionQueryServices()
        {
            _context = new QuizMasterDBEntities();
        }

        public IEnumerable<QuestionApiModel> GetQuestions()
        {
            var questions = _context.Questions.Where(x => x.IsActive).ToList();
            return questions.Select(x => x.ToQuestionApiModel());

        }

        public QuestionApiModel GetQuestionById(int Id)
        {
            var question = _context.Questions.FirstOrDefault(x => x.Id == Id);

            return question?.ToQuestionApiModel();
        }

        public IEnumerable<QuestionApiModel> GetQuestionsByQuizId(int Id)
        {
            var quizdata = (_context.Quizes.Where(x => x.Id == Id && x.IsActive)).FirstOrDefault();

            return quizdata.Questions?.Select(x => x.ToQuestionApiModel());
        }
        public Task CreateQuestion(QuestionApiModel question)
        {
            Question questionModel = question.ToQuestion();
            using (DbContextTransaction dbTran = _context.Database.BeginTransaction())
            {
                try
                {
                    _context.Questions.Add(questionModel);
                    _context.SaveChanges();

                    var options = question.Options?.Select(x => x.ToOption(questionModel.Id));
                    _context.Options.AddRange(options);
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
        public Task UpdateQuestion(QuestionApiModel questionApiModel)
        {

            var question = _context.Questions.FirstOrDefault(x => x.Id == questionApiModel.Id);

            using (DbContextTransaction dbTran = _context.Database.BeginTransaction())
            {
                try
                {
                    question.Name = questionApiModel.Name;
                    _context.Entry(question).State = EntityState.Modified;

                    List<Option> options = new List<Option>();
                    questionApiModel.Options.ToList().ForEach(
                       x => options.Add(question.Options
                       .Where(o => o.Code == x.Code)
                       .Select(s => { s.Name = x.Name; return s; })
                       .FirstOrDefault()));


                    foreach (var option in options)
                    {
                        _context.Entry(option).State = EntityState.Modified;
                    }

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

        public bool RemoveQuestion(int Id)
        {
            var question = (_context.Questions.Where(x => x.Id == Id)).FirstOrDefault();
            question.IsActive = false;
            _context.Entry(question).State = System.Data.Entity.EntityState.Modified;
            int rowAffected = _context.SaveChanges();

            return rowAffected > 0;
        }
        public bool ActivateQuestion(int Id)
        {
            var question = (_context.Questions.Where(x => x.Id == Id)).FirstOrDefault();
            question.IsActive = true;
            _context.Entry(question).State = System.Data.Entity.EntityState.Modified;
            int rowAffected = _context.SaveChanges();

            return rowAffected > 0;
        }
        public Task AddQuestionsToQuiz(PostQuizQuestionRequestModel quizQuestionRequest)
        {
            var questions= _context.Questions.Where(x => quizQuestionRequest.QuestionIds.Contains(x.Id));
          
            
            using (DbContextTransaction dbTran = _context.Database.BeginTransaction())
            {
                try
                {
                    foreach (var question in questions)
                    {
                        var optionsData = _context.Questions.FirstOrDefault(x => x.Id == question.Id)?.Options;

                        var quest = new Question {
                            Name=question.Name,
                            QuizId= quizQuestionRequest.QuizId,
                            IsActive =question.IsActive
                        };
                        
                        _context.Questions.Add(quest);
                        _context.SaveChanges();

                        var options = optionsData.ToList()?.Select(x => { x.QuestionId = quest.Id; return x; });

                        _context.Options.AddRange(options);
                        _context.SaveChanges();
                    }
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

    }
}
