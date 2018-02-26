using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.UserAccount
{
    public class UserLoginApiModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Email { get; set; }
       

        public string AuthTokenValue { get; set; }

        public bool IsActive { get; set; }

        public bool IsAdmin { get; set; }

        public DateTime CreatedDate { get; set; }       

      
    }
}
