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
        public IHttpActionResult CreateQuiz([FromBody]QuizApiModel Quiz)
        {
            var response = _quizQueryServices.CreateQuiz(Quiz);

            return Ok(response);
        }
        [HttpDelete]
        [Route("api/Quiz/RemoveQuiz")]
        public IHttpActionResult DeleteQuiz(int Id)
        {
            var response = _quizQueryServices.DeleteQuiz(Id);

            return Ok(response);
        }

        [HttpPut]
        [Route("api/Quiz/UpdateQuiz")]
        public IHttpActionResult UpdateQuiz([FromBody]QuizApiModel Quiz)
        {
            var response = _quizQueryServices.UpdateQuiz(Quiz);

            return Ok(response);
        }

        [HttpGet]
        [Route("api/Quiz/CheckQuizHasAttempted/{quizId}/{userId}")]
        public IHttpActionResult CheckQuizHasAttempted(int quizId,int userId)
        {
            var response = _quizQueryServices.CheckQuizHasAttempted(quizId,userId);            
            return Ok(response);
        }

        [HttpPost]
        [Route("api/Quiz/SubmitQuiz/{userId}")]
        public IHttpActionResult SubmitQuiz(int userId, [FromBody]QuizApiModel Quiz)
        {
            var response = _quizQueryServices.SubmitQuiz(userId,Quiz);

            return Ok(response);
        }

        [HttpGet]
        [Route("api/Quiz/QuizResult/{quizId}/{userId}")]
        public IHttpActionResult GetQuizResult(int quizId, int userId)
        {
            var response = _quizQueryServices.GetQuizResults(quizId, userId);
            return Ok(response);
        }

        [HttpGet]
        [Route("api/Quiz/QuizParticipants/{quizId}")]
        public IHttpActionResult GetQuizParticipants(int quizId)
        {
            var response = _quizQueryServices.GetQuizParticipants(quizId);

            return Ok(response);
        }

    }
}
