using Fashion.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Fashion.Common;

namespace Fashion.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Admin/Login/
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var adminDAO = new AdminDAO();
                var result = adminDAO.Login(model.UserName, Encryptor.MD5Hash(model.PassWord.ToString()));
                if (result == 1)
                {
                    var admin = adminDAO.GetByUsername(model.UserName);
                    var adminSession = new AdminLogin();

                    adminSession.AdminID = admin.MaAdmin;
                    adminSession.UserName = admin.TaiKhoan;
                    adminSession.Email = admin.Email;
                    adminSession.Password = admin.MatKhau;
                    adminSession.Phanloai = admin.PhanLoai;
                    adminSession.Name = admin.TenAdmin;
                    Session.Add(CommonConstants.ADMIN_SESSION, adminSession);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    if (result == 0)
                    {
                        ModelState.AddModelError("", "Tài khoản không tồn tại");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Mật khẩu không đúng");
                    }
                }
            }
            return View("Index");
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.ADMIN_SESSION] = null;
            return RedirectToAction("Index");
        }
    }
}