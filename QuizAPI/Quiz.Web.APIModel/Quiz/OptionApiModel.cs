using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.Quiz
{
    public class OptionApiModel
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool IsAnswer { get; set; }

        public bool IsActive { get; set; } = true;

        public int? SelectedOptionId { get; set; }

        public bool IsSelected
        {
            get
            {
                return Id == SelectedOptionId;
            }
            set {
                
                SelectedOptionId = value ? Id : (int?)null;
            }
        }
    }
}
