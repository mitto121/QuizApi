using Quiz.Web.APIModel.Quiz;
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
                Questions=quizApiModel.Questions.ToQuestion(),
                IsActive=quizApiModel.IsActive                
            };
        }

        public static ICollection<Question> ToQuestion(this IEnumerable<QuestionApiModel> questions)
        {
            if(questions==null)
            {
                return null;
            }
            return questions?.Select(x => new Question
            {
                Name=x.Name,
                IsActive=x.IsActive,                
                Options =x.Options.ToOptionModel()                
            }) as ICollection<Question>;
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

    }
}
