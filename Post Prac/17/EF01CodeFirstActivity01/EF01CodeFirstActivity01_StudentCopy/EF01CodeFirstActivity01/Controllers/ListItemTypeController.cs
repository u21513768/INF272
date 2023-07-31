using ClassActivity.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace ClassActivity.Controllers
    {
    public class ListItemTypeController : Controller
        {
        // GET: ListItemType
        private ListDbContext db = new ListDbContext();

        // GET: ProductTypes
        public ActionResult Index()
            {
            return View(db.ListItemTypes.ToList());
            }

        // GET: ProductTypes/Details/5
        public ActionResult Details(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            ListItemType listItemType = db.ListItemTypes.Find(id);
            if (listItemType == null)
                {
                return HttpNotFound();
                }
            return View(listItemType);
            }

        // GET: ProductTypes/Create
        public ActionResult Create()
            {
            return View();
            }

        // POST: ProductTypes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,ListItemTypeDescription")] ListItemType listItemType)
            {
            if (ModelState.IsValid)
                {
                db.ListItemTypes.Add(listItemType);
                db.SaveChanges();
                return RedirectToAction("Index");
                }

            return View(listItemType);
            }

        // GET: ProductTypes/Edit/5
        public ActionResult Edit(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            ListItemType listItemType = db.ListItemTypes.Find(id);
            if (listItemType == null)
                {
                return HttpNotFound();
                }
            return View(listItemType);
            }

        // POST: ProductTypes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ListItemTypeID,ListItemTypeDescription")] ListItemType listItemType)
            {
            if (ModelState.IsValid)
                {
                db.Entry(listItemType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
                }
            return View(listItemType);
            }

        // GET: ProductTypes/Delete/5
        public ActionResult Delete(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            ListItemType listItemType = db.ListItemTypes.Find(id);
            if (listItemType == null)
                {
                return HttpNotFound();
                }
            return View(listItemType);
            }

        // POST: ProductTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
            {
            ListItemType listItemType = db.ListItemTypes.Find(id);
            db.ListItemTypes.Remove(listItemType);
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