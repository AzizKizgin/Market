using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Market.Models;

namespace Market.Controllers
{
    public class PropertyController : Controller
    {
        MarketDBEntities db = new MarketDBEntities();
        // GET: Property
        public ActionResult Index()
        {
            var data = db.TBLPROPERTY.ToList();
            return View(data);
        }

        public ActionResult Properties(int id)
        {
            var data = db.TBLPROPERTY.Where(k => k.TBLCategory.ID == id).ToList();
            return View(data);
        }

        [HttpGet]
        public ActionResult AddProp()
        {
            List<SelectListItem> value = (from i in db.TBLCategory.ToList()
                                           select new SelectListItem
                                           {
                                               Text = i.NAME,
                                               Value = i.ID.ToString()
                                           }).ToList();
            ViewBag.value = value;
            return View();
        }

        [HttpPost]
        public ActionResult AddProp(TBLPROPERTY prop)
        {
            var ctg = db.TBLCategory.Where(k => k.ID == prop.TBLCategory.ID).FirstOrDefault();
            prop.TBLCategory = ctg;
            db.TBLPROPERTY.Add(prop);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            var data = db.TBLPROPERTY.Find(id);
            db.TBLPROPERTY.Remove(data);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult GetProperty(int id)
        {
            var data = db.TBLPROPERTY.Find(id);
            List<SelectListItem> value = (from i in db.TBLCategory.ToList()
                                           select new SelectListItem
                                           {
                                               Text = i.NAME,
                                               Value = i.ID.ToString()
                                           }).ToList();
            ViewBag.value = value;
            return View("GetProperty", data);
        }

        public ActionResult Update(TBLPROPERTY p)
        {
            var data = db.TBLPROPERTY.Find(p.ID);
            data.NAME = p.NAME;
            data.PHOTO = p.PHOTO;
            var ctg = db.TBLCategory.Where(c => c.ID == p.TBLCategory.ID).FirstOrDefault();
            data.CATEGORY = ctg.ID;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}