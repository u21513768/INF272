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
            
            db.ExampleTables.Add(tbl);
            db.SaveChanges();
            string message = "Whatever you would like to send.";
            //return Json(new { Message = message, JsonRequestBehavior.AllowGet });

            return RedirectToAction("Index", Json(new { Message = message, JsonRequestBehavior.AllowGet }));
            }

        public JsonResult GetExampleTable(string SimpleID)
            {
            //----------- Edit Here -----------
            List<ExampleTable> tables = new List<ExampleTable>();
            tables = db.ExampleTables.ToList();
            //return RedirectToAction("Index", Json(JsonRequestBehavior.AllowGet));
            return Json(tables, JsonRequestBehavior.AllowGet); // <<<<<<<<< You will need to change this to a Json return.
        }
        }
    }


