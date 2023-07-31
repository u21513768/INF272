using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272Semtest2SectionAQ1StudentFiles.Models
{
    public class Student
    {
        public readonly Guid studentID;
        public string Surname { get; set; }
        public string Names { get; set; }
        public int NumberOfDistinctions { get; set; }
        public int CreditPerDist { get; set; }
        public int Credit { get; set; }

        public Student(Guid guid)
        {
            studentID = guid;
        }

        public void ComputeCredit()
        {
            CreditPerDist = 5000;
            Credit = CreditPerDist * NumberOfDistinctions;
        }
    }
}