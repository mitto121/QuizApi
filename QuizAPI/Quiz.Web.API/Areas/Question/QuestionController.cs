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
        [Route("api/Question/GetQuestionsByQuizId/{id}")]
        public IHttpActionResult GetQuestionsByQuizId(int Id)
        {
            var response = _questionQueryServices.GetQuestionsByQuizId(Id);

            return Ok(response);
        }

        [HttpPost]
        [Route("api/Question/CreateQuestion")]
        public IHttpActionResult CreateQuestion([FromBody]QuestionApiModel question)
        {
            var response = _questionQueryServices.CreateQuestion(question);
            return Ok(response);
        }

        [HttpDelete]
        [Route("api/Question/RemoveQuestion")]
        public IHttpActionResult RemoveQuestion(int questionId)
        {
            var response = _questionQueryServices.RemoveQuestion(questionId);
            return Ok(response);
        }
    }
}
