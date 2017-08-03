using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectSix.Models;

namespace ProjectSix.Controllers
{
    public class AsscTypesController : Controller
    {
        private WardrobeMVCEntities db = new WardrobeMVCEntities();

        // GET: AsscTypes
        public ActionResult Index()
        {
            return View(db.AsscTypes.ToList());
        }

        // GET: AsscTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AsscType asscType = db.AsscTypes.Find(id);
            if (asscType == null)
            {
                return HttpNotFound();
            }
            return View(asscType);
        }

        // GET: AsscTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AsscTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AsscTypesID,AsscTypeName")] AsscType asscType)
        {
            if (ModelState.IsValid)
            {
                db.AsscTypes.Add(asscType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(asscType);
        }

        // GET: AsscTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AsscType asscType = db.AsscTypes.Find(id);
            if (asscType == null)
            {
                return HttpNotFound();
            }
            return View(asscType);
        }

        // POST: AsscTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AsscTypesID,AsscTypeName")] AsscType asscType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(asscType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(asscType);
        }

        // GET: AsscTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AsscType asscType = db.AsscTypes.Find(id);
            if (asscType == null)
            {
                return HttpNotFound();
            }
            return View(asscType);
        }

        // POST: AsscTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AsscType asscType = db.AsscTypes.Find(id);
            db.AsscTypes.Remove(asscType);
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
