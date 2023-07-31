using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class BooksDetails
    {
        public int BookID { get; set; }
        public string Name { get; set; }
        public string Author { get; set; }
        public string Type { get; set; }
        public int PageCount { get; set; }
        public int Points { get; set; }
        public bool Status { get; set; }
    }
}