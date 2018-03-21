using Quiz.Web.API.Shared;
using Quiz.Web.APIModel;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
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

            var userData = _context.UserLogins.Join(_context.Users, a => a.UserId, b => b.Id, (a, b) => new { a, b })
                .Where(x => x.a.UserName == userName && x.a.Password == password && x.a.IsActive && x.b.IsActive)?
                .Select(x=>new UserAccountApiModel {
                    Id = x.b.Id,
                    FirstName = x.b.FirstName,
                    LastName = x.b.LastName,
                    UserName=x.a.UserName,
                    IsAdmin=x.a.IsAdmin ,                                      
                });

            apiResponse.IsSucceeded = userData != null && userData.Count()>0;

            apiResponse.Result = userData?.FirstOrDefault();

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
                AddUser(newUser, response);
            }
            return response;
        }

        public ApiResponse<UserAccountApiModel> UpdateUserProfile (UserAccountApiModel userProfile)
        {
            var response = new ApiResponse<UserAccountApiModel>();

            var user = _context.Users.FirstOrDefault(x => x.Id == userProfile.Id);          

            if (user!=null)
            {
                user.Email = userProfile.Email;
                user.ContactNumber = userProfile.ContactNumber;
                user.ProfileImagePath = userProfile.ProfileImagePath;

                _context.Entry(user).State = EntityState.Modified;
               int rowAffected= _context.SaveChanges();
               response.IsSucceeded = rowAffected > 0;
            }

            response.DisplayMessage = response.IsSucceeded? "Your profile has successfully updated":"Failed , Please try after some time";
            response.Result = userProfile;

            return response;
        }


        public bool CheckUserNameExistOrNot(string username)
        {
            var user = _context.UserLogins.Where(x => x.UserName.ToLower() == username).FirstOrDefault();
            return user != null;
        }

        public UserAccountApiModel GetUserById (int id)
        {
            return _context.Users
                .FirstOrDefault(x => x.Id == id && x.IsActive)
                .ToUserAccountApiModel();


        }
        public IEnumerable<UserAccountApiModel> GetUsers()
        {
           return _context.UserLogins.Join(_context.Users, a => a.UserId, b => b.Id, (a, b) => new { a, b })
                .Where(x => !x.a.IsAdmin)?.Select(x => new UserAccountApiModel {
                    Id=x.b.Id,
                    FirstName=x.b.FirstName,
                    LastName=x.b.LastName,
                    Email=x.b.Email,
                    ContactNumber=x.b.ContactNumber,
                    ProfileImagePath = x.b.ProfileImagePath,
                    UserName=x.a.UserName,
                    IsActive=x.b.IsActive                     
                });        
           
        }

        public Task ActiveOrDeactiveUserAccount(int userId,bool isActive)
        {
            var user = _context.Users.FirstOrDefault(x => x.Id == userId);

            if(user!=null)
            {
                user.IsActive = isActive;
                _context.Entry(user).State = EntityState.Modified;
                _context.SaveChanges();
            }

            return Task.FromResult(0);            
        }

        public ApiResponse<bool> ChangePassword(ChangePasswordApiModel model)
        {
            ApiResponse<bool> response = new ApiResponse<bool>();
            string password = Utility.EncryptData(model.OldPassword);

            var user = _context.UserLogins.Join(_context.Users, a => a.UserId, b => b.Id, (a, b) => a)
                        .Where(x => x.UserId == model.Id && x.Password == password && x.IsActive)
                        .FirstOrDefault();
            
            if (user != null)
            {
                string newPassword = Utility.EncryptData(model.NewPassword);
                user.Password = newPassword;

                _context.Entry(user).State = EntityState.Modified;
               int rowAffected= _context.SaveChanges();

                response.Result = rowAffected>0;
                response.DisplayMessage = "Invalid old Password !!";
            }

            response.DisplayMessage = response.Result? "Success !! Password has changed " : "Failed !! Invalid old Password";

            return response;
        }
        private void AddUser(UserAccountApiModel newUser, ApiResponse<bool> response)
        {
            string enPassword = Utility.EncryptData(newUser.Password);

            using (DbContextTransaction dbTran = _context.Database.BeginTransaction())
            {
                try
                {
                    User user = newUser.ToUser();
                    user.IsActive = true;
                    user.CreatedDate = DateTime.Now;
                    _context.Users.Add(user);
                    _context.SaveChanges();

                    UserLogin userLogin = new UserLogin
                    {
                        UserId = user.Id,
                        UserName = newUser.UserName,
                        Password = enPassword,
                        IsActive = true
                    };
                    _context.UserLogins.Add(userLogin);
                    _context.SaveChanges();
                    dbTran.Commit();
                    response.DisplayMessage = "User has successfully registered. !!";
                }
                catch (DbEntityValidationException ex)
                {
                    dbTran.Rollback();
                    response.DisplayMessage = "failed , Please try again !!";
                    throw;
                }
            }
        }
    }
}
