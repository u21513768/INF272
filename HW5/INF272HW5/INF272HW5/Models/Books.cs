using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class Books
    {
        public int BookID { get; set; }
        public string Name { get; set; }
        public int PageCount { get; set; }
        public int Point { get; set; }
        public int AuthorID { get; set; }
        public int TypeID { get; set; }
    }
}