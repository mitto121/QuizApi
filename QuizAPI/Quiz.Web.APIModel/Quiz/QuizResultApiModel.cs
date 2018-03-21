using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.Quiz
{
    public class QuizResultApiModel:QuizApiModel
    {
        public int TotalQuestions { get; set; }

        public int AttemptId { get; set; }
        public DateTime AttemptDate { get; set; }

        public int TotalQuestionsAttempt { get; set; }

        public int TotalCorrectAnswer { get; set; }

        public int TotalWrongAnswer { get; set; }

        public string ResultStatus { get; set; }

        public decimal MarksInPercentage { get; set; }
    }
}
