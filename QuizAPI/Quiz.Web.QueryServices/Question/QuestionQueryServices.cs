using Quiz.Web.APIModel.Quiz;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.QueryServices.Questions
{
    public class QuestionQueryServices
    {
        private readonly QuizMasterDBEntities _context;

        public QuestionQueryServices()
        {
            _context = new QuizMasterDBEntities();
        }

        public IEnumerable<QuestionApiModel> GetQuestionsByQuizId(int Id)
        {
            var quizdata = (_context.Quizes.Where(x => x.Id == Id)).FirstOrDefault();

            return quizdata.Questions?.Select(x => x.ToQuestionApiModel());
        }
        public bool CreateQuestion(QuestionApiModel question)
        {
            Question dataModel = question.ToQuestion();
            _context.Questions.Add(dataModel);
            int rowAffected = _context.SaveChanges();
            return rowAffected > 0;
        }

    }
}
