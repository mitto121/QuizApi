using Quiz.Web.APIModel;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.QueryServices.UserAccount;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;


namespace Quiz.Web.API.Areas.UserAccount.Controllers
{
    [Route("api/UserAccount")]
    public class UserAccountController : ApiController
    {
        private readonly UserAccountQueryService _UserAccountQueryService;

        public UserAccountController()
        {
            _UserAccountQueryService = new UserAccountQueryService();
        }
        [HttpGet]
        [Route("api/UserAccount/AuthenticateUser/{userName}/{password}")]
        public IHttpActionResult AuthenticateUser(string userName, string password)
        {
            ApiResponse<UserLoginApiModel> apiResponse = new ApiResponse<UserLoginApiModel>();


            apiResponse =  _UserAccountQueryService.AuthenticateUser(userName, password);

            if (apiResponse.IsSucceeded)
            {
                apiResponse.Result.AuthToken= CreateToken(apiResponse.Result);
            }
            else
            {
                apiResponse.DisplayMessage = "Login failed !!";
            }

            return Ok(apiResponse);
        }

        [HttpPost]
        [Route("api/UserAccount/CreateUser")]
        public IHttpActionResult UserRegistration([FromBody] UserAccountApiModel newUser)
        {

            var apiResponse = _UserAccountQueryService.CreateUserAccount(newUser);

            return Ok(apiResponse);
        }

        private string CreateToken(UserLoginApiModel userLogin)
        {
            return "token"; //TODO : replace with jwt token
        }

    }
}
