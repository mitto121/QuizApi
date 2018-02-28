using Quiz.Web.APIModel;
using Quiz.Web.APIModel.Quiz;
using Quiz.Web.DataServices.Data;
using Quiz.Web.QueryServices.ModelMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace Quiz.Web.QueryServices.Quiz
{
    public class QuizQueryServices
    {
        private readonly QuizMasterDBEntities _context;

        public QuizQueryServices()
        {
            _context = new QuizMasterDBEntities();

        }

        public ApiResponse<IEnumerable<QuizApiModel>> GetQuizesAsync()
        {
            var quizes = new ApiResponse<IEnumerable<QuizApiModel>>();

            var quizesData =  _context.Quizes.Where(x=>x.IsActive).ToList();

            quizes.TotalRecordCount = quizesData.Count();
            quizes.Result = quizesData?.Select(x=>x.ToQuizApiModel());

            return quizes;
        }
        public  QuizApiModel GetQuizById(int Id)
        {
            var quizdata = _context.Quizes.Where(x => x.Id == Id && x.IsActive).FirstOrDefault();

            var quizResult = quizdata.ToQuizApiModel();

            return quizResult;
        }
        public ApiResponse<QuizApiModel> CreateQuiz(QuizApiModel quizApiModel)
        {
            var response = new ApiResponse<QuizApiModel>();

            var quiz = quizApiModel.ToQuize();
            quiz.CreatedDate = DateTime.Now;

            _context.Quizes.Add(quiz);
            int rowAffected=_context.SaveChanges();

            response.IsSucceeded = rowAffected > 0;
            quizApiModel.Id = quiz.Id;
            response.Result = quizApiModel;

            return response;
        }
        public Task UpdateQuiz(QuizApiModel quiz)
        {

            //save to db
            return Task.FromResult(0);
        }
        public bool DeleteQuiz(int Id)
        {
            var quiz = _context.Quizes.Where(x => x.Id == Id).FirstOrDefault();
            quiz.IsActive = false;
            _context.Entry(quiz).State = EntityState.Modified;
            int rowAffected=_context.SaveChanges();
            return rowAffected>0;
        }

    }
}
