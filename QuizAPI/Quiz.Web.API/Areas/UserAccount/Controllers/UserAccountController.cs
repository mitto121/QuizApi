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
        [Route("AuthenticateUser/{userName}/{password}")]
        public async Task<ApiResponse<UserLoginApiModel>> AuthenticateUser(string userName, string password)
        {
            ApiResponse<UserLoginApiModel> apiResponse = new ApiResponse<UserLoginApiModel>();


            apiResponse = await _UserAccountQueryService.AuthenticateUser(userName, password);

            if (apiResponse.IsSucceeded)
            {
                apiResponse.Result.AuthTokenValue = CreateToken(apiResponse.Result);
            }
            else
            {
                apiResponse.DisplayMessgae = "Login failed !!";
            }

            return apiResponse;
        }

        private string CreateToken(UserLoginApiModel userLogin)
        {
            return "token"; //TODO : replace with jwt token
        }

    }
}
