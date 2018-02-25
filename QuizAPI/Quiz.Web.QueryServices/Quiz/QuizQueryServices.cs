using Quiz.Web.APIModel;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.DataServices.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.QueryServices.Quiz
{
    public class QuizQueryServices
    {
        private readonly QuizDataContext _context;

        public QuizQueryServices()
        {
            _context = new QuizDataContext();

        }

        public  Task<ApiResponse<IEnumerable<QuizApiModel>>> GetQuizes()
        {
            var response = new ApiResponse<IEnumerable<QuizApiModel>>();
            //use db to get response
            return  Task.FromResult(response);
        }
        public Task<QuizApiModel> GetQuizById(int Id)
        {
            var response = new QuizApiModel();
            //use db to get response
            return Task.FromResult(response);
        }
        public Task CreateQuiz(QuizApiModel quiz)
        {
         
            //save to db
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
