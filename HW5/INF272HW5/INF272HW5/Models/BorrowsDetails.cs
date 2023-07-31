using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class BorrowsDetails
    {
        public int StudentID { get; set; }
        public int BookID { get; set; }
        public int BorrowID { get; set; }
        public DateTime TakenDate { get; set; }
        public DateTime BroughtDate { get; set; }
        public string Name { get; set; }
        public string BookName { get; set; }
    }
}