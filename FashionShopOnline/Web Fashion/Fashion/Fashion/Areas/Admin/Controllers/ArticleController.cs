using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Fashion.Areas.Admin.Controllers
{
    public class ArticleController : BaseController
    {
        //
        // GET: /Admin/Article/
        public ActionResult Index()
        {
            return View(new ArticleDAO().ListArticle());
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var entity = new ArticleDAO().GetByID(id);
            return View(entity);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(BaiViet _article)
        {
            new ArticleDAO().EditArticle(_article);
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ArticleDAO().DeleteArticle(id);
            return RedirectToAction("Index");
        }
	}
}