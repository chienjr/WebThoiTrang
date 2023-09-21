using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Fashion.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        //
        // GET: /Admin/Product/
        public ActionResult Index()
        {
            return View(new ProductDAO().ListProduct());
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ProductDAO().DeleteProduct(id);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            return View(new ProductDAO().GetByID(id));
        }
        
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(SanPham _product)
        {
            new ProductDAO().EditProduct(_product);
            return RedirectToAction("Index");
        }
        public ActionResult Detail(int id)
        {
            ViewBag.ListColor = new ProductDAO().ListColorProduct(id);
            ViewBag.ListSize = new ProductDAO().ListSizeProduct(id);
            ViewBag.Image = new ProductDAO().ImageGetByID(id);
            var entity = new ProductDAO().GetByID(id);
            return View(entity);
        }

	}
}