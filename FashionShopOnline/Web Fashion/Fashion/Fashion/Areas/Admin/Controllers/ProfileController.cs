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
    public class ProfileController : BaseController
    {
        //
        // GET: /Admin/Profile/
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult EditPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EditPassword(Fashion.Areas.Admin.Models.ChangePassword model)
        {
            if (ModelState.IsValid)
            {
                var session = (AdminLogin)Session["ADMIN_SESSION"];
                if (session != null)
                {
                    if(session.Password.Equals(Encryptor.MD5Hash(model.ExPassword)))
                    {
                        var _admin = new QuanTriVien();
                        _admin.MaAdmin = session.AdminID;
                        _admin.MatKhau = Encryptor.MD5Hash(model.Password.ToString());
                        new AdminDAO().EditPassword(_admin);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Nhập sai mật khẩu");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Không tồn tại tài khoản này");
                }
            }
            return View(model);
        }
    }
}