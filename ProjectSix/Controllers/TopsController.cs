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
    public class TopsController : Controller
    {
        private WardrobeMVCEntities db = new WardrobeMVCEntities();

        // GET: Tops
        public ActionResult Index()
        {
            var tops = db.Tops.Include(t => t.TopType);
            return View(tops.ToList());
        }

        // GET: Tops/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Top top = db.Tops.Find(id);
            if (top == null)
            {
                return HttpNotFound();
            }
            return View(top);
        }

        // GET: Tops/Create
        public ActionResult Create()
        {
            ViewBag.TopTypesID = new SelectList(db.TopTypes, "TopTypesID", "TopTypeName");
            return View();
        }

        // POST: Tops/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TopsID,Name,Photo,Color,Season,Occassion,TopTypesID")] Top top)
        {
            if (ModelState.IsValid)
            {
                if (top.TopTypesID.Equals(2))
                {
                    top.Photo = "/images/rsz_staffordcrewneck.jpg";
                }
                if (top.TopTypesID.Equals(3))
                {
                    top.Photo = "/images/rsz_staffordvneck.jpg";
                }
                if (top.TopTypesID.Equals(4))
                {
                    top.Photo = "/images/rsz_perryellispasleyblue.jpg";
                }
                if (top.TopTypesID.Equals(5))
                {
                    top.Photo = "/images/rsz_perryellispasleybrown.jpg";
                }
                if (top.TopTypesID.Equals(6))
                {
                    top.Photo = "/images/rsz_truereligiontshirt.jpg";
                }
                if (top.TopTypesID.Equals(7))
                {
                    top.Photo = "/images/rsz_perryellispasley.jpg";
                }
                if (top.TopTypesID.Equals(8))
                {
                    top.Photo = "/images/rsz_sleevlesstshirt.jpg";
                }
                if (top.TopTypesID.Equals(9))
                {
                    top.Photo = "/images/harley.jpg";
                }

                db.Tops.Add(top);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TopTypesID = new SelectList(db.TopTypes, "TopTypesID", "TopTypeName", top.TopTypesID);
            return View(top);
        }

        // GET: Tops/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Top top = db.Tops.Find(id);
            if (top == null)
            {
                return HttpNotFound();
            }
            ViewBag.TopTypesID = new SelectList(db.TopTypes, "TopTypesID", "TopTypeName", top.TopTypesID);
            return View(top);
        }

        // POST: Tops/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TopsID,Name,Photo,Color,Season,Occassion,TopTypesID")] Top top)
        {
            if (ModelState.IsValid)
            {
                db.Entry(top).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TopTypesID = new SelectList(db.TopTypes, "TopTypesID", "TopTypeName", top.TopTypesID);
            return View(top);
        }

        // GET: Tops/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Top top = db.Tops.Find(id);
            if (top == null)
            {
                return HttpNotFound();
            }
            return View(top);
        }

        // POST: Tops/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Top top = db.Tops.Find(id);
            db.Tops.Remove(top);
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
