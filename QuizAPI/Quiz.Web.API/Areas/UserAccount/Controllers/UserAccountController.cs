using Newtonsoft.Json;
using Quiz.Web.APIModel;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.QueryServices.UserAccount;
using System;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.Hosting;
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


            apiResponse = _UserAccountQueryService.AuthenticateUser(userName, password);

            if (apiResponse.IsSucceeded)
            {
                apiResponse.Result.AuthToken = CreateToken(apiResponse.Result);
            }
            else
            {
                apiResponse.DisplayMessage = "Login failed !!";
            }

            return Ok(apiResponse);
        }

        [HttpGet]
        [Route("api/UserAccount/UserById/{id}")]
        public IHttpActionResult GetUserById(int id)
        {
            var response = _UserAccountQueryService.GetUserById(id);
            response.Image = getProfileImage(response.ProfileImagePath);

            return Ok(response);
        }



        [HttpGet]
        [Route("api/UserAccount/Users")]
        public IHttpActionResult GetUsers()
        {
            var response = _UserAccountQueryService.GetUsers();

            return Ok(response);
        }

        [HttpPost]
        [Route("api/UserAccount/CreateUser")]
        public IHttpActionResult UserRegistration([FromBody] UserAccountApiModel newUser)
        {

            var apiResponse = _UserAccountQueryService.CreateUserAccount(newUser);

            return Ok(apiResponse);
        }

        [HttpPut]
        [Route("api/UserAccount/ActiveOrDeactiveUserAccount/{id}/{isActive}")]
        public IHttpActionResult ActiveOrDeactiveUserAccount(int id, bool isActive)
        {

            var apiResponse = _UserAccountQueryService.ActiveOrDeactiveUserAccount(id, isActive);

            return Ok(apiResponse);
        }
        [HttpPost]
        [Route("api/UserAccount/UpdateProfile")]
        public IHttpActionResult UpdateUserProfile()
        {
            var response = new ApiResponse<UserAccountApiModel>();

            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Params["Profile"] != null)
            {
                UserAccountApiModel user = JsonConvert.DeserializeObject<UserAccountApiModel>(httpRequest.Params["Profile"]);

                if (user != null && httpRequest.Files.Count > 0)
                {
                    string ImagePath = string.Empty;
                    string userFileName =$"{user.Id}-{user.Email?.Split('@')[0]}";
                    ImagePath = SaveImageFile(httpRequest, userFileName);
                    user.ProfileImagePath = ImagePath;
                }
                response = _UserAccountQueryService.UpdateUserProfile(user);
            }

            return Ok(response);
        }
        [HttpPut]
        [Route("api/UserAccount/ChangePassword")]
        public IHttpActionResult ChangePassword([FromBody]ChangePasswordApiModel model)
        {
            var response=_UserAccountQueryService.ChangePassword(model);
            return Ok(response);
        }
        private static string SaveImageFile(HttpRequest httpRequest, string userFileName)
        {
            string ImagePath = string.Empty;
            foreach (string fileName in httpRequest.Files.Keys)
            {
                var file = httpRequest.Files[fileName];              
                string ext = Path.GetExtension(file.FileName);
                ImagePath = $"App_Data/images/{userFileName}{ext}";
                string filePath = HttpContext.Current.Server.MapPath($"~/{ImagePath}");
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
                file.SaveAs(filePath);
            }

            return ImagePath;
        }

        private string CreateToken(UserLoginApiModel userLogin)
        {
            return "token"; //TODO : replace with jwt token
        }

        private byte[] getProfileImage(string Imagepath)
        {
            string filePath = string.Empty;
            if (string.IsNullOrEmpty(Imagepath))
            {
                filePath = HttpContext.Current.Server.MapPath($"~/App_Data/images/profile.png");
            }
            else
            {
                filePath = HttpContext.Current.Server.MapPath($"~/{Imagepath}");
            }
            if (File.Exists(filePath))
            {

                using (FileStream fileStream = new FileStream(filePath, FileMode.Open))
                {
                    Image image = Image.FromStream(fileStream);
                    using (MemoryStream mStream = new MemoryStream())
                    {
                        image.Save(mStream, image.RawFormat);
                        return mStream.ToArray();
                    }
                }
            }
            return null;
        }

       
    }
}
