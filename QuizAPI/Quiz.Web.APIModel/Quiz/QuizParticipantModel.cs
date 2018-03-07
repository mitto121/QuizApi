using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.Quiz
{
    public class QuizParticipantModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Name
        {
            get
            {
                return $"{FirstName} {LastName}";
            }
        }

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
        public int QuizId { get; set; }
    }
}
