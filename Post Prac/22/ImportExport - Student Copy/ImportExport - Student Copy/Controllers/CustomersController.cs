using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using OfficeOpenXml;
using System.Web;
using System.Web.Mvc;
using ImportExportPractical.Models;

namespace ImportExportPractical.Controllers
{
    public class CustomersController : Controller
    {
        private ProductOrderEntities db = new ProductOrderEntities();

        // GET: Customers
        public ActionResult Index()
        {
            return View(db.Customers.ToList());
        }

        [HttpPost]
        public ActionResult ImportCustomers()
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            if (Request.Files.Count > 0) //Access Request object to see if any files were submitted
            {
                var file = Request.Files[0]; //Request object has a Files array. If files were submitted, then you will find it in this array.
                                             //Do whatever you want with the file (e.g. Save to folder on server)
                try
                {
                    using (var package = new ExcelPackage(file.InputStream))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0];
                        int col = 1;

                        for (int row = 2; worksheet.Cells[row, col].Value != null; row++)
                        {
                            string FirstName = (string)worksheet.Cells[row, 1].Value;
                            string LastName = (string)worksheet.Cells[row, 2].Value;
                            string City = (string)worksheet.Cells[row, 3].Value;
                            string Country = (string)worksheet.Cells[row, 4].Value;
                            string Phone = (string)worksheet.Cells[row, 5].Value;

                            //Add to DB...
                            Customer newCustomer = new Customer();
                            newCustomer.FirstName = FirstName;
                            newCustomer.LastName = LastName;
                            newCustomer.City = City;
                            newCustomer.Country = Country;
                            newCustomer.Phone = Phone;
                            db.Customers.Add(newCustomer);
                            db.SaveChanges();
                        }
                    }
                }
                catch(Exception e)
                {
                    throw e;
                }
            }
            return RedirectToAction("Index");
        }

        // GET: Customers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // GET: Customers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CustomerId,FirstName,LastName,City,Country,Phone")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerId,FirstName,LastName,City,Country,Phone")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
