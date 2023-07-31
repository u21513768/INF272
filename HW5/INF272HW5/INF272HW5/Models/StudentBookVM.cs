using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class StudentBookVM
    {
        public int BookID { get; set; }
        public List<StudentDetails> Students { get; set; }
        //public List<BooksDetails> Books { get; set; }
        public List<BorrowsDetails> BorrowDetails { get; set; }
        public List<string> Classes { get; set; }
        public string Name { get; set; }
        public string Class { get; set; }
    }
}