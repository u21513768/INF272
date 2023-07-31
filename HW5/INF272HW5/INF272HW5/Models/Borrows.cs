using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class Borrows
    {
        public int BorrowID { get; set; }
        public int StudentID { get; set; }
        public int BookID { get; set; }
        public DateTime TakenDate { get; set; }
        public DateTime BroughtDate { get; set; }
    }
}