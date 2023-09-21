using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Fashion.Areas.Admin.Controllers
{
    public class CategoryController : BaseController
    {
        //
        // GET: /Admin/Category/
        public ActionResult Index()
        {
            return View(new CategoryDAO().ListCategory());
        }

        public ActionResult SubCategory(int id)
        {
            ViewBag.idcate = id;
            return View(new CategoryDAO().ListSubCategory(id));
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewbag();
            return View();
        }

        [HttpPost]
        public ActionResult Create(DanhMucSP _category)
        {
            new CategoryDAO().CreateCategory(_category);
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult CreateSubCategory()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateSubCategory(DanhMucSP _category, int id)
        {
            new CategoryDAO().CreateSubCategory(_category, id);
            return RedirectToAction("SubCategory", "Category", new {@id=id });
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            List<SanPham> product = new ProductDAO().ListProductByCategory(id);
            List<DanhMucSP> category = new CategoryDAO().ListCategoryByIDParent(id);
            if(product.Count == 0 && category.Count == 0)
            {
                new CategoryDAO().DeleteCategory(id);
            }
            return RedirectToAction("Index");
        }

        public void SetViewbag(int? id=null)
        {
            var list = new CategoryDAO().ListCategory();
            ViewBag.MaDanhMucSP = new SelectList(list, "MaDanhMucSP", "TenDanhMucSP",id);
        }
	}
}