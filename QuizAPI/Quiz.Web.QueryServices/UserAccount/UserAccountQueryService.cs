using Quiz.Web.API.Shared;
using Quiz.Web.APIModel;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices;
using Quiz.Web.DataServices.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Quiz.Web.QueryServices.UserAccount
{
    public class UserAccountQueryService
    {
         
        private readonly QuizDataContext _context;
        public UserAccountQueryService()
        {
            _context = new QuizDataContext();
        }

        public  Task<ApiResponse<UserLoginApiModel>> AuthenticateUser(string userName, string password)
        {
            ApiResponse<UserLoginApiModel> apiResponse = new ApiResponse<UserLoginApiModel>();

            password = Utility.EncryptData(password);

            var userData =  ( _context.UserAccounts.Where(x=>x.UserName==userName && x.Password==password && x.IsActive )).FirstOrDefault();

            apiResponse.IsSucceeded = userData!=null;

            apiResponse.Result = new UserLoginApiModel {
                Id=userData.Id,
                FirstName=userData.FirstName,
                LastName=userData.LastName,
                Email=userData.Email         

            };

            return Task.FromResult(apiResponse);
        }
    }
}
