using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Fashion.Controllers
{
    public class ArticleController : Controller
    {
        //
        // GET: /Article/
        public ActionResult Index()
        {
            return View(new ArticleDAO().ListArticle());
        }

        [ChildActionOnly]
        public ActionResult Menu_Article()
        {
            return PartialView(new ArticleDAO().ListArticle());
        }

        public ActionResult Detail(int id)
        {
            var entity = new ArticleDAO().GetByID(id);
            return View(entity);
        }
	}
}