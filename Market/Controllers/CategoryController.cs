using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Market.Models;

namespace Market.Controllers
{
    
    public class CategoryController : Controller
    {
        MarketDBEntities db = new MarketDBEntities();
        public ActionResult Index()
        {
            var data = db.TBLCategory.ToList();
            return View(data);
        }

        [HttpGet]
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(TBLCategory category)
        {
            db.TBLCategory.Add(category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            var category = db.TBLCategory.Find(id);
            db.TBLCategory.Remove(category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult GetCategory(int id)
        {
            var category = db.TBLCategory.Find(id);
            return View("GetCategory", category);
        }

        public ActionResult Update(TBLCategory p)
        {
            var category = db.TBLCategory.Find(p.ID);
            category.NAME = p.NAME;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}