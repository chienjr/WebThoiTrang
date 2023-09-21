using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Fashion.Areas.Admin.Controllers
{
    public class collectionController : BaseController
    {

        // GET: /Admin/Collection/
        public ActionResult Index()
        {
            CollectionDAO collectionDAO = new CollectionDAO();
            return View(collectionDAO.ListCollection());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(BoSuuTap _collection)
        {
            new CollectionDAO().CreateCollection(_collection);
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new CollectionDAO().DeleteCollection(id);
            return RedirectToAction("Index");
        }
    }
}
