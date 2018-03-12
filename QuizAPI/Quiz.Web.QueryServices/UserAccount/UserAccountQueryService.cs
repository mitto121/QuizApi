using Quiz.Web.API.Shared;
using Quiz.Web.APIModel;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;


namespace Quiz.Web.QueryServices.UserAccount
{
    public class UserAccountQueryService
    {

        private readonly QuizMasterDBEntities _context;
        public UserAccountQueryService()
        {
            _context = new QuizMasterDBEntities();
        }

        public ApiResponse<UserLoginApiModel> AuthenticateUser(string userName, string password)
        {
            ApiResponse<UserLoginApiModel> apiResponse = new ApiResponse<UserLoginApiModel>();

            password = Utility.EncryptData(password);

            var userData = _context.Users.Where(x => x.UserName == userName && x.Password == password && x.IsActive).FirstOrDefault();

            apiResponse.IsSucceeded = userData != null;

            apiResponse.Result = userData?.ToUserLoginApiModel();

            return apiResponse;
        }

        public ApiResponse<bool> CreateUserAccount(UserAccountApiModel newUser)
        {
            var response = new ApiResponse<bool>();
            var isUserExist = CheckUserNameExistOrNot(newUser.UserName);
            if (isUserExist)
            {
                response.DisplayMessage = "Failed : User Name is already exist !!";
                response.Result = false;
            }
            else
            {

                string enPassword = Utility.EncryptData(newUser.Password);
                User user = newUser.ToUser();
                user.Password = enPassword;
                user.IsActive = true;
                user.CreatedDate = DateTime.Now;

                _context.Users.Add(user);
                int rowAffective = _context.SaveChanges();
                response.Result = rowAffective > 0;
                response.DisplayMessage = response.Result ? "You have registered successfully. !!" : "failed , Please try again !!";
            }
            return response;
        }       

        public bool CheckUserNameExistOrNot(string username)
        {
            var user = _context.Users.Where(x => x.UserName.ToLower() == username).FirstOrDefault();
            return user != null;
        }
    }
}
