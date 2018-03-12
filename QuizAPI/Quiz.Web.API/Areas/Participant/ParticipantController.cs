using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.QueryServices;
using System.Web.Http;

namespace Quiz.Web.API.Areas.Participant
{
    [Route("api/Participant")]
    public class ParticipantController : ApiController
    {
        private readonly ParticipantQueryService _participantQueryService;

        public ParticipantController()
        {
            _participantQueryService = new ParticipantQueryService();
        }

        [HttpGet]
        [Route("api/Participant/QuizParticipants/{id}")]
        public IHttpActionResult GetQuizParticipantsByQuizId(int id)
        {
            var apiResponse = _participantQueryService.GetQuizParticipants(id);
            return Ok(apiResponse);
        }

        [HttpPost]
        [Route("api/Participant/CreateParticipant")]
        public IHttpActionResult CreateParticipant([FromBody] ParticipantApiModel participant)
        {

            var apiResponse = _participantQueryService.CreateParticipant(participant);

            return Ok(apiResponse);
        }
    }
}