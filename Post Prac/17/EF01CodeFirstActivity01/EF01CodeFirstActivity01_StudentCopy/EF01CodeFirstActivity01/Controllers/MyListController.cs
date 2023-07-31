using ClassActivity.Models;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace ClassActivity.Controllers
    {
    public class MyListController : Controller
        {
        private ListDbContext db = new ListDbContext();

        public ActionResult Index()
            {
            var lists = db.Lists.Include(p => p.ListItemType);
            return View(lists.ToList());
            }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            List list = db.Lists.Find(id);
            if (list == null)
                {
                return HttpNotFound();
                }
            return View(list);
            }

        // GET: Products/Create
        public ActionResult Create()
            {
            ViewBag.ListItemTypeID = new SelectList(db.ListItemTypes, "ListItemTypeID", "ListItemTypeDescription");
            ViewBag.PriorityID = new SelectList(db.Priorities, "PriorityID", "PriorityDescription");

            return View();
            }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,ListCode,Name,Description,ListItemTypeID,PriorityID")] List list)
            {
            if (ModelState.IsValid)
                {
                db.Lists.Add(list);
                db.SaveChanges();
                return RedirectToAction("Index");
                }

            ViewBag.ListItemTypeID = new SelectList(db.ListItemTypes, "ListItemTypeID", "ListItemTypeDescription", list.ListItemTypeID);
            ViewBag.PriorityID = new SelectList(db.Priorities, "PriorityID", "PriorityDescription", list.PriorityID);

            return View(list);
            }

        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            List list = db.Lists.Find(id);
            if (list == null)
                {
                return HttpNotFound();
                }
            ViewBag.ListItemTypeID = new SelectList(db.ListItemTypes, "ListItemTypeID", "ListItemTypeDescription", list.ListItemTypeID);
            ViewBag.PriorityID = new SelectList(db.Priorities, "PriorityID", "PriorityDescription", list.PriorityID);

            return View(list);
            }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ListID,ListCode,Name,Description,ListItemTypeID,PriorityID")] List list)
            {
            if (ModelState.IsValid)
                {
                db.Entry(list).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
                }
            ViewBag.ListItemTypeID = new SelectList(db.ListItemTypes, "ListItemTypeID", "ListItemTypeDescription", list.ListItemTypeID);
            ViewBag.PriorityID = new SelectList(db.Priorities, "PriorityID", "PriorityDescription", list.PriorityID);

            return View(list);
            }

        // GET: Products/Delete/5
        public ActionResult Delete(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            List list = db.Lists.Find(id);
            if (list == null)
                {
                return HttpNotFound();
                }
            return View(list);
            }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
            {
            List list = db.Lists.Find(id);
            db.Lists.Remove(list);
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