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

        public  ApiResponse<IEnumerable<QuizApiModel>> GetQuizesAsync()
        {
            var quizes = new ApiResponse<IEnumerable<QuizApiModel>>();

            var quizesData =  (_context.Quizes).ToList();

            quizes.TotalRecordCount = quizesData.Count();
            quizes.Result = quizesData?.Select(x=>x.ToQuizApiModel());

            return quizes;
        }
        public  QuizApiModel GetQuizById(int Id)
        {
            var quizdata = (_context.Quizes.Where(x => x.Id == Id)).FirstOrDefault();

            var quizResult = quizdata.ToQuizApiModel();

            return quizResult;
        }
        public Task CreateQuiz(QuizApiModel quizApiModel)
        {

            var quiz = quizApiModel.ToQuize();
            quiz.IsActive = true;
            quiz.CreatedDate = DateTime.Now;

            
            _context.Quizes.Add(quiz);
            _context.SaveChanges();
          

            return Task.FromResult(0);
        }
        public Task UpdateQuiz(QuizApiModel quiz)
        {

            //save to db
            return Task.FromResult(0);
        }
        public Task DeleteQuiz(int Id)
        {
            var response = new QuizApiModel();
            //use db to get response
            return Task.FromResult(0);
        }

    }
}
