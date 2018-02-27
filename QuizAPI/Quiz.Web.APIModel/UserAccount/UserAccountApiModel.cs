using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.UserAccount
{
    public class UserAccountApiModel:UserLoginApiModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Email { get; set; }        
       
        public DateTime CreatedDate { get; set; }

    }
}
