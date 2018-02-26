using Quiz.Web.APIModel;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.QueryServices.Quiz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Quiz.Web.API.Areas.Quiz.Controllers
{
    
    [Route("api/Quiz")]
    public class QuizController : ApiController
    {
        private readonly QuizQueryServices _quizQueryServices;
        public QuizController()
        {
            _quizQueryServices = new QuizQueryServices();
        }      

        [HttpGet]   
        [Route("api/Quiz/Quizes")]
        public  ApiResponse<IEnumerable<QuizApiModel>> GetQuizes()
        {
            var response =  _quizQueryServices.GetQuizesAsync();

            return response;
        }
        [HttpGet]
        [Route("api/Quiz/Quize/{id}")]
        public  Task<QuizApiModel> GetQuizById(int Id)
        {
            var response =  _quizQueryServices.GetQuizById(Id);

            return response;
        }

        [HttpPost]
        [Route("AddQuiz")]
        public Task CreateQuiz([FromBody]QuizApiModel Quiz)
        {
            var response = _quizQueryServices.CreateQuiz(Quiz);

            return Task.FromResult(0);
        }

        [HttpPost]
        [Route("UpdateQuiz")]
        public Task UpdateQuiz([FromBody]QuizApiModel Quiz)
        {
            var response = _quizQueryServices.CreateQuiz(Quiz);

            return Task.FromResult(0);
        }

        [HttpDelete]
        [Route("RemoveQuiz")]
        public Task DeleteQuiz(int Id)
        {
            var response = _quizQueryServices.DeleteQuiz(Id);

            return Task.FromResult(0);
        }
    }
}
