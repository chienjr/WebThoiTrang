using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Fashion.Areas.Admin.Controllers
{
    public class BrandController : BaseController
    {
        //
        // GET: /Admin/Brand/
        public ActionResult Index()
        {
            BrandDAO brandDAO = new BrandDAO();
            return View(brandDAO.ListBrand());
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Hang _brand)
        {
            new BrandDAO().CreateBrand(_brand);
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            List<SanPham> product = new ProductDAO().ListProductByBrand(id);
            if(product.Count == 0)
            {
                new BrandDAO().DeleteBrand(id);
            }
            return RedirectToAction("Index");
        }
    }
}