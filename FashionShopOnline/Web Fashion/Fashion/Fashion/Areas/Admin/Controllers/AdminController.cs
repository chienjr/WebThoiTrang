using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using Fashion.Common;

namespace Fashion.Areas.Admin.Controllers
{
    public class AdminController : BaseController
    {
        //
        // GET: /Admin/Admin/
        public ActionResult Index()
        {
            return View(new AdminDAO().ListAdmin());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(QuanTriVien _admin)
        {
            _admin.MatKhau = Encryptor.MD5Hash(_admin.MatKhau.ToString());
            new AdminDAO().CreateAdmin(_admin);
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new AdminDAO().DeleteAdmin(id);
            return RedirectToAction("Index");
        }
	}
}