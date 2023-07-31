using EF02Activity.Models;
using PagedList;
using System;
using System.Data;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace EF02Activity.Controllers
    {
    public class EmployeeDepartmentController : Controller
        {
        private HumanResourcesDB db = new HumanResourcesDB();

        public ActionResult Index(string sortOrder, string currentFilterTextbox, string textboxSearchString, int? page)
            {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.SurnameSortParm = sortOrder == "Surname" ? "surname_desc" : "Surname";
            ViewBag.EMailSortParm = sortOrder == "EMail" ? "eMail_desc" : "EMail";
            ViewBag.DepartmentSortParm = sortOrder == "Department" ? "department_desc" : "Department";

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

            var dTemp = from d in db.departments
                        select d;

            if (!String.IsNullOrEmpty(textboxSearchString))
                {
                eTemp = eTemp.Where(xx => xx.first_name.Contains(textboxSearchString));
                }

            var empDept = (from e in eTemp
                           join d in dTemp
                           on e.department_id equals d.department_id
                           select new TableJoin
                               {
                               EmployeeDetails = e,
                               DepartmentDetails = d
                               });

            switch (sortOrder)
                {
                case "name_desc":
                    empDept = empDept.OrderByDescending(o => o.EmployeeDetails.first_name);
                    break;

                case "Surname":
                    empDept = empDept.OrderBy(o => o.EmployeeDetails.last_name);
                    break;

                case "surname_desc":
                    empDept = empDept.OrderByDescending(o => o.EmployeeDetails.last_name);
                    break;

                case "EMail":
                    empDept = empDept.OrderBy(o => o.EmployeeDetails.email);
                    break;

                case "eMail_desc":
                    empDept = empDept.OrderByDescending(o => o.EmployeeDetails.email);
                    break;

                case "Department":
                    empDept = empDept.OrderBy(o => o.DepartmentDetails.department_name);
                    break;

                case "department_desc":
                    empDept = empDept.OrderByDescending(o => o.DepartmentDetails.department_name);
                    break;

                default:
                    empDept = empDept.OrderBy(o => o.EmployeeDetails.first_name);
                    break;
                }
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            return View(empDept.ToPagedList(pageNumber, pageSize));
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