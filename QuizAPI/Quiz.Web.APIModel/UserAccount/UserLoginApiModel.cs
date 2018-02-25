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

        public string UserName { get; set; }

        public string Password { get; set; }

        public string AuthTokenValue { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreateDate { get; set; }       

        public bool IsSucceeded { get; set; }
    }
}
