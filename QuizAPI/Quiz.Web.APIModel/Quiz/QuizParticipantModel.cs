using Quiz.Web.APIModel.UserAccount;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.Quiz
{
    public class QuizParticipantModel: ParticipantApiModel
    {

        public int QuizId { get; set; }

        public DateTime AttemptDate { get; set; }

        public string Date
        {
            get
            {
                return AttemptDate.ToString("MM/dd/yyyy");
            }
        }
        public string Time
        {
            get
            {
                return AttemptDate.ToShortTimeString();
            }
        }

        
    }
}
