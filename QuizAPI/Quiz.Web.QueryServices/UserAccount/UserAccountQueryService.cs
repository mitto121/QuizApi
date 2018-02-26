using Quiz.Web.API.Shared;
using Quiz.Web.APIModel;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
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

        public async Task<ApiResponse<UserLoginApiModel>> AuthenticateUser(string userName, string password)
        {
            ApiResponse<UserLoginApiModel> apiResponse = new ApiResponse<UserLoginApiModel>();

            password = Utility.EncryptData(password);

            var userData = await ( _context.Users.Where(x=>x.UserName==userName && x.Password==password && x.IsActive )).FirstOrDefaultAsync();

            apiResponse.IsSucceeded = userData!=null;

            apiResponse.Result = userData?.ToUserLoginApiModel();

            return apiResponse;
        }
    }
}
