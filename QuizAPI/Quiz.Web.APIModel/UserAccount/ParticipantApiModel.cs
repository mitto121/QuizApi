using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.UserAccount
{
    public class ParticipantApiModel
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string Email { get; set; }

        public DateTime DateOfBirth { get; set; }

        public string DateOfBirthDisplayText
        {
            get
            {
                return DateOfBirth.ToString("MM/dd/yyyy");
            }
        }

        public bool IsActive { get; set; }

    }
}
