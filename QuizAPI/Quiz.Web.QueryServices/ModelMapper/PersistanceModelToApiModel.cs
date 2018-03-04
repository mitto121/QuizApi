using Quiz.Web.APIModel.Quiz;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices.Data;
using System.Linq;

namespace Quiz.Web.QueryServices.ModelMapper
{
    public static class PersistanceModelToApiModel
    {

        public static UserLoginApiModel ToUserLoginApiModel(this User userData)
        {
            if (userData == null)
            {
                return null;
            }
            return new UserLoginApiModel
            {
                Id = userData.Id,
                UserName = userData.UserName,
                IsAdmin = userData.IsAdmin,
                IsActive = userData.IsActive
            };
        }

        public static QuizApiModel ToQuizApiModel(this Quize quize)
        {
            if (quize == null)
            {
                return null;
            }
            return new QuizApiModel
            {
                Id = quize.Id,
                Name = quize.Name,
                Description = quize.Description,
                Duration=quize.Duration,
                PassingPercentage=quize.PassingPercentage,
                IsActive = quize.IsActive,
                CreatedDate = quize.CreatedDate,
                Questions = quize.Questions?.Select(x => x.ToQuestionApiModel())
            };
        }

        public static QuestionApiModel ToQuestionApiModel(this Question question)
        {
            if (question == null)
            {
                return null;
            }
            return new QuestionApiModel
            {
                Id = question.Id,
                Name = question.Name,
                IsActive = question.IsActive,
                Options = question.Options?.Select(x => x.ToOptionApiModel())
            };
        }
        public static OptionApiModel ToOptionApiModel(this Option option)
        {
            if (option == null)
            {
                return null;
            }
            return new OptionApiModel
            {
                Id = option.Id,
                Code = option.Code,
                Name = option.Name,
                IsActive = option.IsActive,
                IsAnswer = option.IsAnswer

            };
        }

    }
}
