﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quiz.Web.APIModel.Quiz
{
    public class QuestionApiModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Boolean IsActive { get; set; }

        public IEnumerable<OptionApiModel> Option { get; set; }
    }
}