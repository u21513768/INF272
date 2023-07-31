using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class Students
    {
        public int StudentID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime BirthDate { get; set; }
        public char Gender { get; set; }
        public string Class { get; set; }
        public int Point { get; set; }
    }
}