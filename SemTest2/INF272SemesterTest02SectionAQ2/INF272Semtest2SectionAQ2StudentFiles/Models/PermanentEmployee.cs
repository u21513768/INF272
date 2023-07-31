using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272Semtest2SectionAQ2StudentFiles.Models
{
    public class PermanentEmployee : Employee
    {
        public int bonus { get; set; }

        public override string employeeName
        {
            get { return  base.employeeName; }

            set
            {
                base.employeeName = value;
                
                if(base.employeeName == "" || base.employeeName == null)
                {
                    base.employeeName = "Unknown";
                }
            }
        }

        public override double CalculateSalary()
        {
            return baseSalary + bonus;
        }
    }
}