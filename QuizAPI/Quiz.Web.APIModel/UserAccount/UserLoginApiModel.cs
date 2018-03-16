using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.UserAccount
{
    public class UserLoginApiModel
    {       
        public string UserName { get; set; }
        public string Password { get; set; }

        public string AuthToken { get; set; }     


    }
}
