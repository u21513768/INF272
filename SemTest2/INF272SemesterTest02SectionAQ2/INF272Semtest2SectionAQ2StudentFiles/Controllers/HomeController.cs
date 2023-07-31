using INF272Semtest2SectionAQ2StudentFiles.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace INF272Semtest2SectionAQ2StudentFiles.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var myEmp = new PermanentEmployee();

            myEmp.employeeID = 1;
            myEmp.baseSalary = 30000;
            //myEmp.employeeName = "";
            myEmp.bonus = 10000;

            ViewBag.Message = myEmp.employeeName + " earns " + "R " + myEmp.CalculateSalary();

            return View();
        }

       
    }
}