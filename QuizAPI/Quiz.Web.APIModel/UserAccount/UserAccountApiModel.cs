using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.UserAccount
{
    public class UserAccountApiModel:UserLoginApiModel
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

        public string Email { get; set; }        
       
        public DateTime CreatedDate { get; set; }

        public bool IsActive { get; set; }

        public bool IsAdmin { get; set; }
    }
}
