﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INF272HW5.Models
{
    public class BookVM
    {
        public List<BooksDetails> BooksDetails { get; set; }
        public List<string> Types { get; set; }
        public List<string> Authors { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Type { get; set; }
    }
}