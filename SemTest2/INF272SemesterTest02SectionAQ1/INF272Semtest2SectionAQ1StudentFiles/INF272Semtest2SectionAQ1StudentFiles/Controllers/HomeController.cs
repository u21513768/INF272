using INF272Semtest2SectionAQ1StudentFiles.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace INF272Semtest2SectionAQ1StudentFiles.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {

            Student myStudent = new Student(Guid.NewGuid());

            myStudent.Surname = "Kahlau";
            myStudent.Names = "Mary";
            myStudent.NumberOfDistinctions = 3;
            myStudent.ComputeCredit();



            return View(myStudent);
            return View();

        }



    }
}
