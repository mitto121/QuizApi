namespace Quiz.Web.APIModel
{
     public class ApiResponse<T>
    {
       
        public string DisplayMessgae { get; set; }

        public bool IsSucceeded { get; set; }

        public int? TotalRecordCount { get; set; }

        public T Result { get; set; }
    }
}
