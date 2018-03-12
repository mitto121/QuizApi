using Quiz.Web.APIModel;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.QueryServices
{
    public class ParticipantQueryService
    {

        private readonly QuizMasterDBEntities _context;
        public ParticipantQueryService()
        {
            _context = new QuizMasterDBEntities();
        }

        public IEnumerable<QuizParticipantModel> GetQuizParticipants(int id)
        {
            var participant=  _context.Participants
                .Join(_context.QuizAttemptDetails, p => p.Id, q => q.ParticipantId, (p, q) => new{ p,q})
                .Where(f=>f.q.QuizId==id && f.p.IsActive)
                .OrderByDescending(o=>o.q.AttemptDate)
                .ThenBy(t=>t.p.Name)
                .Select(x=> new QuizParticipantModel
                {
                    Id=x.p.Id,
                    Name=x.p.Name,
                    DateOfBirth=x.p.DateOfBirth,
                    Email=x.p.Email,
                    QuizId = x.q.QuizId.Value,
                    AttemptId=x.q.Id,
                    AttemptDate = x.q.AttemptDate                   
                }).ToList();

            return participant.Select(x => { x.Result = getResult(x.AttemptId, x.QuizId);return x;});
            

        }
        public ApiResponse<ParticipantApiModel> CreateParticipant(ParticipantApiModel participantApiModel)
        {
            var response = new ApiResponse<ParticipantApiModel>();
            var participantData = _context.Participants
                .Where(x => x.Email.ToLower() == participantApiModel.Email.ToLower() && x.IsActive).FirstOrDefault();
            if (participantData != null)
            {
                response.IsSucceeded = true;
                response.Result = participantData.ToParticipantApiModel();
            }
            else
            {

                var participant = new Participant
                {
                    Name = participantApiModel.Name,
                    DateOfBirth = participantApiModel.DateOfBirth,
                    Email = participantApiModel.Email,
                    IsActive = true
                };
                _context.Participants.Add(participant);
                int rowAffective = _context.SaveChanges();

                response.IsSucceeded = rowAffective > 0;
                response.Result = response.IsSucceeded ? participant.ToParticipantApiModel() : null;
            }
            return response;
        }

        private string getResult(int attemptId,int quizId)
        {
            int passingPercentage = _context.Quizes.FirstOrDefault(x => x.Id == quizId).PassingPercentage;

            var quizResult = _context.QuizAttemptDetails
                .Join(_context.QuizResults, q => q.Id, a => a.AttemptId, (q, a) => new { q, a })
                .Where(x => x.q.QuizId == quizId && x.a.AttemptId == attemptId)
                .Select(x => x.a);

            int  totalCorrectAnswer = 0;
            foreach (var resultItem in quizResult)
            {
                totalCorrectAnswer += (resultItem.ActualAnswer.HasValue && resultItem.SelectedAnswer.HasValue 
                    && resultItem.ActualAnswer == resultItem.SelectedAnswer ) ? 1 : 0;
            }
            int totalQuestion = quizResult.Count();          
            decimal percentageMarks = getMarksInPercentage(totalCorrectAnswer, totalQuestion);
            decimal percentageMark = Math.Round(percentageMarks, 2);
            return  Math.Round(percentageMark) >= passingPercentage ? "Pass" : "Fail";

        }
        private decimal getMarksInPercentage(decimal totalCorrectAnswer, decimal totalQuestions)
        {
            return (totalCorrectAnswer / totalQuestions) * 100;
        }
    }
}
