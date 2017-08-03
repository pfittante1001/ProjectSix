﻿using System;
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
    public class ShoesController : Controller
    {
        private WardrobeMVCEntities db = new WardrobeMVCEntities();

        // GET: Shoes
        public ActionResult Index()
        {
            var shoes = db.Shoes.Include(s => s.ShoeType);
            return View(shoes.ToList());
        }

        // GET: Shoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shoe shoe = db.Shoes.Find(id);
            if (shoe == null)
            {
                return HttpNotFound();
            }
            return View(shoe);
        }

        // GET: Shoes/Create
        public ActionResult Create()
        {
            ViewBag.ShoeTypeID = new SelectList(db.ShoeTypes, "ShoeTypeID", "ShoesTypeName");
            return View();
        }

        // POST: Shoes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ShoesID,Name,Photo,Color,Season,Occassion,ShoeTypeID")] Shoe shoe)
        {
            if (ModelState.IsValid)
            {
                db.Shoes.Add(shoe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ShoeTypeID = new SelectList(db.ShoeTypes, "ShoeTypeID", "ShoesTypeName", shoe.ShoeTypeID);
            return View(shoe);
        }

        // GET: Shoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shoe shoe = db.Shoes.Find(id);
            if (shoe == null)
            {
                return HttpNotFound();
            }
            ViewBag.ShoeTypeID = new SelectList(db.ShoeTypes, "ShoeTypeID", "ShoesTypeName", shoe.ShoeTypeID);
            return View(shoe);
        }

        // POST: Shoes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ShoesID,Name,Photo,Color,Season,Occassion,ShoeTypeID")] Shoe shoe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shoe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ShoeTypeID = new SelectList(db.ShoeTypes, "ShoeTypeID", "ShoesTypeName", shoe.ShoeTypeID);
            return View(shoe);
        }

        // GET: Shoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Shoe shoe = db.Shoes.Find(id);
            if (shoe == null)
            {
                return HttpNotFound();
            }
            return View(shoe);
        }

        // POST: Shoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Shoe shoe = db.Shoes.Find(id);
            db.Shoes.Remove(shoe);
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
