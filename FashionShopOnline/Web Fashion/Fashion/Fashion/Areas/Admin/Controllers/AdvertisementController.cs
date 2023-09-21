using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Fashion.Areas.Admin.Controllers
{
    public class AdvertisementController : BaseController
    {
        //
        // GET: /Admin/Advertisement/
        public ActionResult Index()
        {
            return View(new AdvertisementDAO().ListAdvertisement());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(QuangCao _adv)
        {
            new AdvertisementDAO().CreateAdvertisement(_adv);
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new AdvertisementDAO().DeleteAdvertisement(id);
            return RedirectToAction("Index");
        }
	}
}