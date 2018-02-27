using Quiz.Web.APIModel;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.QueryServices.Quiz;
using System.Collections.Generic;
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
        public IHttpActionResult GetQuizes()
        {
            var response =  _quizQueryServices.GetQuizesAsync();

            return Ok(response);
        }
        [HttpGet]
        [Route("api/Quiz/Quize/{id}")]
        public IHttpActionResult GetQuizById(int Id)
        {
            var response =  _quizQueryServices.GetQuizById(Id);

            return Ok(response);
        }

        [HttpPost]
        [Route("api/Quiz/AddQuiz")]
        public Task CreateQuiz([FromBody]QuizApiModel Quiz)
        {
            var response = _quizQueryServices.CreateQuiz(Quiz);

            return Task.FromResult(0);
        }

        [HttpPost]
        [Route("api/Quiz/UpdateQuiz")]
        public Task UpdateQuiz([FromBody]QuizApiModel Quiz)
        {
            var response = _quizQueryServices.CreateQuiz(Quiz);

            return Task.FromResult(0);
        }

        [HttpDelete]
        [Route("api/Quiz/RemoveQuiz")]
        public Task DeleteQuiz(int Id)
        {
            var response = _quizQueryServices.DeleteQuiz(Id);

            return Task.FromResult(0);
        }
    }
}
