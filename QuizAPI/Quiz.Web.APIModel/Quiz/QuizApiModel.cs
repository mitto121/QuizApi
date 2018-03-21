using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.Quiz
{
    public class QuizApiModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Duration { get; set; }
        public decimal PassingPercentage { get; set; }

        public bool IsActive { get; set; } = true;

        public DateTime? CreatedDate { get; set; }

        public string QuizLinkId { get; set; }

        public int TotalParticipated { get; set; }
        public IEnumerable<QuestionApiModel> Questions { get; set; }
    }
}
