using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Fashion.Areas.Admin.Controllers
{
    public class CommentController : BaseController
    {
        //
        // GET: /Admin/Comment/
        public ActionResult Index()
        {
            return View(new CommentDAO().ListComment());
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var entity = new CommentDAO().GetByID(id);
            return View(entity);
        }

        [HttpPost]
        public ActionResult Edit(BinhLuan _comment)
        {
            new CommentDAO().EditComment(_comment);
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            new CommentDAO().DeleteComment(id);
            return RedirectToAction("Index");
        }
	}
}