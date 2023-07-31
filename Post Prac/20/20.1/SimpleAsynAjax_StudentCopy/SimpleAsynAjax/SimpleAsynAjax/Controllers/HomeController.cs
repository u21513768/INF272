using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SimpleAsynAjax.Models;
using Newtonsoft.Json;
using System.Net;
using System.Data;
using System.Threading;


namespace SimpleAsynAjax.Controllers
    {

    public class HomeController : Controller
        {

        public ExampleDatabaseEntities db = new ExampleDatabaseEntities();
        public ActionResult Index()
            {
            return View();
            }

        [HttpPost]
        public ActionResult Create(ExampleTable tbl)
            {
            //----------- Edit Here -----------
            string message;
            try
            {
                db.ExampleTables.Add(tbl);
                db.SaveChanges();
                message = "Data with attribute: '" + Convert.ToString(tbl.SimpleAttribute) + "' added successfully";
            }
            catch(Exception)
            {
                message = "Failed to add";
            }
            
            return Json(new { Message = message, JsonRequestBehavior.AllowGet });
            }

        public JsonResult GetExampleTable()
            {
            //----------- Edit Here -----------
            List<ExampleTable> tables = new List<ExampleTable>();
            tables = db.ExampleTables.ToList();
            return Json(tables, JsonRequestBehavior.AllowGet);
        }
        }
    }


