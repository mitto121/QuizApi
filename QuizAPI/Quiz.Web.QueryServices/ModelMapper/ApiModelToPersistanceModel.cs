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
                CreatedDate = quizApiModel.CreatedDate,
                Questions=quizApiModel.Questions.ToQuestions(),
                IsActive=quizApiModel.IsActive                
            };
        }

        public static ICollection<Question> ToQuestions(this IEnumerable<QuestionApiModel> questions)
        {
            if(questions==null)
            {
                return null;
            }
            return questions?.Select(x => new Question
            {
                Name=x.Name,
                IsActive=x.IsActive,
                QuizId=x.QuizId,               
                Options =x.Options.ToOptionModel()                
            }) as ICollection<Question>;
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
                QuizId =   questions.QuizId,
                Options = questions.Options.ToOptionModel()
            };
        }
        public static ICollection<Option> ToOptionModel(this IEnumerable<OptionApiModel> optionApiModel)
        {
            return optionApiModel?.Select(option=> new Option
            {
                Code= option.Code,
                Name = option.Name,
                IsActive=option.IsActive,
                IsAnswer=option.IsAnswer,                
            }) as ICollection<Option>;
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
