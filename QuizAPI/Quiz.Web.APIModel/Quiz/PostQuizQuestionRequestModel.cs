using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.Quiz
{
    public class PostQuizQuestionRequestModel
    {
        public int QuizId { get; set; }
        public List<int> QuestionIds { get; set; }
    }
}
