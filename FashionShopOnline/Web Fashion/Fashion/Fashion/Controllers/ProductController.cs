using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Fashion.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Product/
        public ActionResult ListProduct(int id, int page = 1, int pageSize = 3)
        {
            int totalRecord = 0;
            ViewBag.ID = id;
            var model = new ProductDAO().ListProductByCategory(id, ref totalRecord, page, pageSize);
            ViewBag.TotalRecord = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)(Math.Ceiling((double)totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Previous = page - 1;
            return View(model);
        }

        public ActionResult ListProductByCollection(int id, int page = 1, int pageSize = 3)
        {
            int totalRecord = 0;
            ViewBag.ID = id;
            var model = new ProductDAO().ListProductByCollection(id, ref totalRecord, page, pageSize);
            ViewBag.TotalRecord = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)(Math.Ceiling((double)totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Previous = page - 1;
            return View(model);
        }

        [ChildActionOnly]
        public ActionResult Menu_Category()
        {
            ViewBag.SubCategory = new CategoryDAO().ListSubCategory();
            ViewBag.Collection = new CollectionDAO().ListCollection();
            return PartialView(new CategoryDAO().ListCategory());
        }

        [HttpGet]
        public ActionResult Detail(int id)
        {
            ViewBag.ListColor = new ProductDAO().ListColorProduct(id);
            ViewBag.ListSize = new ProductDAO().ListSizeProduct(id);
            ViewBag.ListImage = new ProductDAO().ListImageProduct(id);
            ViewBag.Comments = new CommentDAO().ListCommentDisplay(id);
            var entity = new ProductDAO().GetByID(id);
            return View(entity);
        }

        public ActionResult Detail(int id, string name, string comment)
        {
            if (name.Length > 0 && comment.Length > 0)
            {
                var entity = new BinhLuan();
                entity.MaSP = id;
                entity.NoiDung = comment;
                entity.HoTenNBL = name;
                new CommentDAO().AddComment(entity);
            }
            ViewBag.ListColor = new ProductDAO().ListColorProduct(id);
            ViewBag.ListSize = new ProductDAO().ListSizeProduct(id);
            ViewBag.ListImage = new ProductDAO().ListImageProduct(id);
            ViewBag.Comments = new CommentDAO().ListCommentDisplay(id);
            var product = new ProductDAO().GetByID(id);
            return View(product);
        }

        public void SetViewBag(int id)
        {
            var ListColor = new ProductDAO().ListColorProduct(id);
            var ListSize = new ProductDAO().ListSizeProduct(id);
            ViewBag.MaMau = new SelectList(ListColor, "MaMau", "TenMau", id);
            ViewBag.MaSize = new SelectList(ListSize, "MaSize", "TenSize", id);
        }

        public ActionResult SearchResult(string keyword, int page = 1, int pageSize = 3)
        {
            int totalRecord = 0;
            ViewBag.Key = keyword;
            var model = new ProductDAO().Search(keyword, ref totalRecord, page, pageSize);
            ViewBag.TotalRecord = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)(Math.Ceiling((double)totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Previous = page - 1;
            ViewBag.KeyWord = keyword;
            return View(model);
        }

        public JsonResult ListName(string keyword)
        {
            var data = new ProductDAO().ListNameProduct(keyword);
            return Json( new
            {
            data = data,
            status = true
            }, JsonRequestBehavior.AllowGet);
        }
    }
}