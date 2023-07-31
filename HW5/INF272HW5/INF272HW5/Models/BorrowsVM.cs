using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class BorrowsVM
    {
        public List<BorrowsDetails> BorrowsDetails { get; set; }
        public int count { get; set; }
        public bool flag { get; set; }
    }
}