using Quiz.Web.APIModel.Quiz;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices.Data;
using System.Collections.Generic;
using System.Linq;

namespace Quiz.Web.QueryServices.ModelMapper
{
    public static class ApiModelToPersistanceModel
    {
        public static Quize ToQuize(this QuizApiModel quizApiModel)
        {
            return new Quize()
            {
                Name = quizApiModel.Name,
                Description = quizApiModel.Description,           
                Duration=quizApiModel.Duration,
                PassingPercentage=quizApiModel.PassingPercentage,     
                CreatedDate = quizApiModel.CreatedDate,              
                IsActive=quizApiModel.IsActive                
            };
        }

       
        public static Question ToQuestion(this QuestionApiModel questions)
        {
            if (questions == null)
            {
                return null;
            }
            return  new Question
            {
                Name = questions.Name,
                IsActive = questions.IsActive,
                QuizId =   questions.QuizId               
            };
        }
     
        public static Option ToOption(this OptionApiModel optionApiModel,int questionId)
        {
            if (optionApiModel == null)
            {
                return null;
            }
            return new Option
            {
                Code = optionApiModel.Code,
                Name = optionApiModel.Name,
                IsActive = optionApiModel.IsActive,
                IsAnswer = optionApiModel.IsAnswer,
                QuestionId=questionId               
            };
        }

        public static User ToUser(this UserAccountApiModel userAccountApiModel)
        {
            return new User {
                FirstName = userAccountApiModel.FirstName,
                LastName=userAccountApiModel.LastName,
                Email=userAccountApiModel.Email,
                UserName=userAccountApiModel.UserName,
                Password=userAccountApiModel.Password,
                CreatedDate=userAccountApiModel.CreatedDate,
                IsActive=userAccountApiModel.IsActive,
                IsAdmin=userAccountApiModel.IsAdmin                
            };
        }

    }
}
