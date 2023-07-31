using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272Semtest2SectionAQ2StudentFiles.Models
{
    public class Employee
    {
        public int employeeID { get; set; }
        public virtual string employeeName { get; set; }
        public double baseSalary { get; set; }
        public List<string> Qualifications { get; set; }

        public virtual double CalculateSalary()
        {
            return baseSalary;
        }


    }

}
