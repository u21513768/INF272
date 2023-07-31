using EF02Activity.Models;
using PagedList;
using System;
using System.Data;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace EF02Activity.Controllers
{
    public class ActivityController : Controller
    {
        private HumanResourcesDB db = new HumanResourcesDB();

        public ActionResult Index(string sortOrder, string currentFilterTextbox, string textboxSearchString, int? page)
        {

            // Complete this section as well as the associated view.
            ViewBag.CurrentSort = sortOrder;
            ViewBag.AddressSortParm = String.IsNullOrEmpty(sortOrder) ? "address_desc" : "";
            ViewBag.DepartmentSortParm = sortOrder == "Department" ? "department_desc" : "Department";
            ViewBag.NameSortParm = sortOrder == "Name" ? "name_desc" : "Name";
            ViewBag.SurnameSortParm = sortOrder == "Surname" ? "surname_desc" : "Surname";
            ViewBag.EMailSortParm = sortOrder == "EMail" ? "eMail_desc" : "EMail";
            ViewBag.JobSortParm = sortOrder == "Job" ? "job_desc" : "Job";

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

            var locTemp = from loc in db.locations
                          select loc;

            var jobTemp = from job in db.jobs
                          select job;

            if (!String.IsNullOrEmpty(textboxSearchString))
            {
                locTemp = locTemp.Where(xx => xx.street_address.Contains(textboxSearchString));
            }

            var result = (from a in locTemp
                          join b in dTemp on a.location_id equals b.location_id into tempTable01
                          from b in tempTable01.ToList()
                          join c in eTemp on b.department_id equals c.department_id into tempTable02
                          from c in tempTable02.ToList()
                          join d in jobTemp on c.job_id equals d.job_id into tempTable03
                          from d in tempTable03.ToList()
                          select new Activity
                          {
                              LocationDetails = a,
                              DepartmentDetails = b,
                              EmployeeDetails = c,
                              JobDetails = d
                          });

            switch (sortOrder)
            {
                case "address_desc":
                    result = result.OrderByDescending(o => o.LocationDetails.street_address);
                    break;

                case "Department":
                    result = result.OrderBy(o => o.DepartmentDetails.department_name);
                    break;

                case "department_desc":
                    result = result.OrderByDescending(o => o.DepartmentDetails.department_name);
                    break;

                case "Name":
                    result = result.OrderBy(o => o.EmployeeDetails.first_name);
                    break;

                case "name_desc":
                    result = result.OrderByDescending(o => o.EmployeeDetails.first_name);
                    break;

                case "Surname":
                    result = result.OrderBy(o => o.EmployeeDetails.last_name);
                    break;

                case "surname_desc":
                    result = result.OrderByDescending(o => o.EmployeeDetails.last_name);
                    break;

                case "EMail":
                    result = result.OrderBy(o => o.EmployeeDetails.email);
                    break;

                case "eMail_desc":
                    result = result.OrderByDescending(o => o.EmployeeDetails.email);
                    break;

                case "Job":
                    result = result.OrderBy(o => o.JobDetails.job_title);
                    break;

                case "job_desc":
                    result = result.OrderByDescending(o => o.JobDetails.job_title);
                    break;

                default:
                    result = result.OrderBy(o => o.LocationDetails.street_address);
                    break;
            }

            int pageSize = 7;
            int pageNumber = (page ?? 1);
            return View(result.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(int? id)
        {

            // Complete this section as well as the associated view.
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