using EF02Activity.Models;
using PagedList;
using System;
using System.Data;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace EF02Activity.Controllers
    {
    public class EmployeeController : Controller
        {
        private HumanResourcesDB db = new HumanResourcesDB();

        public ActionResult Index(string sortOrder, string currentFilterTextbox, string textboxSearchString, int? page)
            {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.SurnameSortParm = sortOrder == "Surname" ? "surname_desc" : "Surname";
            ViewBag.EMailSortParm = sortOrder == "EMail" ? "eMail_desc" : "EMail";
            ViewBag.PhoneSortParm = sortOrder == "Phone" ? "phone_desc" : "Phone";
            ViewBag.HireSortParm = sortOrder == "Hire" ? "hire_desc" : "Hire";
            ViewBag.SalarySortParm = sortOrder == "Salary" ? "salary_desc" : "Salary";

            if (textboxSearchString != null)
                {
                page = 1;
                }
            else
                {
                textboxSearchString = currentFilterTextbox;
                }

            ViewBag.CurrentFilterTextbox = textboxSearchString;

            var eTemp = from e in db.employees
                        select e;

            if (!String.IsNullOrEmpty(textboxSearchString))
                {
                eTemp = eTemp.Where(xx => xx.first_name.Contains(textboxSearchString));
                }

            switch (sortOrder)
                {
                case "name_desc":
                    eTemp = eTemp.OrderByDescending(o => o.first_name);
                    break;

                case "Surname":
                    eTemp = eTemp.OrderBy(o => o.last_name);
                    break;

                case "surname_desc":
                    eTemp = eTemp.OrderByDescending(o => o.last_name);
                    break;

                case "EMail":
                    eTemp = eTemp.OrderBy(o => o.email);
                    break;

                case "eMail_desc":
                    eTemp = eTemp.OrderByDescending(o => o.email);
                    break;

                case "Phone":
                    eTemp = eTemp.OrderBy(o => o.phone_number);
                    break;

                case "phone_desc":
                    eTemp = eTemp.OrderByDescending(o => o.phone_number);
                    break;

                case "Hire":
                    eTemp = eTemp.OrderBy(o => o.hire_date);
                    break;

                case "hire_desc":
                    eTemp = eTemp.OrderByDescending(o => o.hire_date);
                    break;

                case "Salary":
                    eTemp = eTemp.OrderBy(o => o.salary);
                    break;

                case "salary_desc":
                    eTemp = eTemp.OrderByDescending(o => o.salary);
                    break;

                default:
                    eTemp = eTemp.OrderBy(o => o.first_name);
                    break;
                }
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            return View(eTemp.ToPagedList(pageNumber, pageSize));
            }

        public ActionResult Details(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            employee employee = db.employees.Find(id);

            if (employee == null)
                {
                return HttpNotFound();
                }
            return View(employee);
            }
        }
    }