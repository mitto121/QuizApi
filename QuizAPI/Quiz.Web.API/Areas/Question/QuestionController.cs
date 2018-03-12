using Quiz.Web.APIModel.Quiz;
using Quiz.Web.QueryServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Quiz.Web.API.Areas.Question
{
    [Route("api/Question")]
   
    public class QuestionController : ApiController
    {
        private readonly QuestionQueryServices _questionQueryServices;

        public QuestionController()
        {
            _questionQueryServices = new QuestionQueryServices();
        }


        [HttpGet]
        [Route("api/Question/Questions")]
        public IHttpActionResult GetQuestions()
        {
            var response = _questionQueryServices.GetQuestions();

            return Ok(response);
        }

        [HttpGet]
        [Route("api/Question/GetQuestion/{id}")]
        public IHttpActionResult GetQuestionById(int id)
        {
            var response = _questionQueryServices.GetQuestionById(id);

            return Ok(response);
        }
        [HttpGet]
        [Route("api/Question/GetQuestionsByQuizId/{id}")]
        public IHttpActionResult GetQuestionsByQuizId(int id)
        {
            var response = _questionQueryServices.GetQuestionsByQuizId(id);

            return Ok(response);
        }

        [HttpPost]
        [Route("api/Question/CreateQuestion")]
        public IHttpActionResult CreateQuestion([FromBody]QuestionApiModel question)
        {
            var response = _questionQueryServices.CreateQuestion(question);
            return Ok(response);
        }
        [HttpPut]
        [Route("api/Question/UpdateQuestion")]
        public IHttpActionResult UpdateQuestion([FromBody]QuestionApiModel question)
        {
            var response = _questionQueryServices.UpdateQuestion(question);
            return Ok(response);
        }

        [HttpDelete]
        [Route("api/Question/RemoveQuestion/{questionId}")]
        public IHttpActionResult RemoveQuestion(int questionId)
        {
            var response = _questionQueryServices.RemoveQuestion(questionId);
            return Ok(response);
        }
        [HttpPut]
        [Route("api/Question/ActivateQuestion/{questionId}")]
        public IHttpActionResult ActivateQuestion(int questionId)
        {
            var response = _questionQueryServices.ActivateQuestion(questionId);
            return Ok(response);
        }

        [HttpPost]
        [Route("api/Question/AddQuestionsToQuiz")]
        public IHttpActionResult AddQuestionsToQuiz([FromBody] PostQuizQuestionRequestModel quizQuestionRequest)
        {
            var response = _questionQueryServices.AddQuestionsToQuiz(quizQuestionRequest);
            return Ok(response);
        }

        
    }
}
