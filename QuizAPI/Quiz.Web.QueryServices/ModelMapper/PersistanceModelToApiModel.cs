﻿using Quiz.Web.API.Shared;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.APIModel.UserAccount;
using Quiz.Web.DataServices.Data;
using System;
using System.Linq;

namespace Quiz.Web.QueryServices.ModelMapper
{
    public static class PersistanceModelToApiModel
    {

        public static UserAccountApiModel ToUserAccountApiModel(this User userData)
        {
            if (userData == null)
            {
                return null;
            }
            return new UserAccountApiModel
            {
                Id = userData.Id,
                FirstName=userData.FirstName,
                LastName=userData.LastName,
                Email=userData.Email,  
                ContactNumber=userData.ContactNumber,
                ProfileImagePath= userData.ProfileImagePath,
                CreatedDate =userData.CreatedDate,                
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
                QuizLinkId= Utility.EncryptData(Convert.ToString(quize.Id)),
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
                QuizId=question.QuizId.Value,
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

        public static ParticipantApiModel ToParticipantApiModel(this Participant participant)
        {
            if (participant == null)
            {
                return null;
            }
            return new ParticipantApiModel
            {
                Id = participant.Id,
                Name = participant.Name,
                DateOfBirth = participant.DateOfBirth,
                Email = participant.Email,
                IsActive= participant.IsActive
            };
        }

    }
}
