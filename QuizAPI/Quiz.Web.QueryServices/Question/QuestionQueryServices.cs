using Quiz.Web.APIModel.Quiz;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
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
        public bool CreateQuestion(QuestionApiModel question)
        {
            Question questionModel = question.ToQuestion();
            _context.Questions.Add(questionModel);
            _context.SaveChanges();

            var options = question.Options?.Select(x => x.ToOption(questionModel.Id));
            _context.Options.AddRange(options);
            _context.SaveChanges();

            return true;
        }

        public bool RemoveQuestion(int Id)
        {
            var question = (_context.Questions.Where(x => x.Id == Id)).FirstOrDefault();
            question.IsActive = false;
            _context.Entry(question).State = System.Data.Entity.EntityState.Modified;
            _context.SaveChanges();

            return true;
        }
        public bool ActivateQuestion(int Id)
        {
            var question = (_context.Questions.Where(x => x.Id == Id)).FirstOrDefault();
            question.IsActive = true;
            _context.Entry(question).State = System.Data.Entity.EntityState.Modified;
            _context.SaveChanges();

            return true;
        }

    }
}
