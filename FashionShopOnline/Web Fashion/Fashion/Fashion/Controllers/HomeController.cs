using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using Fashion.Common;
using Fashion.Models;

namespace Fashion.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult Slider()
        {
            return PartialView(new AdvertisementDAO().ListSlider());
        }

        [ChildActionOnly]
        public ActionResult Inspired()
        {
            return PartialView(new AdvertisementDAO().ListInspired());
        }

        [ChildActionOnly]
        public ActionResult NavBar()
        {
            ViewBag.SubCategory = new CategoryDAO().ListSubCategory();
            ViewBag.Collection = new CollectionDAO().ListCollection();
            return PartialView(new CategoryDAO().ListCategory());
        }

        [ChildActionOnly]
        public ActionResult Hot_Product()
        {
            return PartialView(new ProductDAO().ListHotProduct());
        }

        [ChildActionOnly]
        public ActionResult Article()
        {
            return PartialView(new ArticleDAO().ListIntroArticle());
        }
        [HttpPost]
        public ActionResult Login(string name, string password)
        {
            if (ModelState.IsValid)
            {
                var result = new CustomerDAO().Login(name, Fashion.Common.Encryptor.MD5Hash(password.ToString()));
                if (result == 1)
                {
                    var user = new CustomerDAO().GetByUsername(name);
                    var userSession = new UserLogin();

                    userSession.CustomerID = user.MaKhachHang;
                    userSession.UserName = user.TenDangNhap;
                    userSession.Password = user.MatKhau;
                    userSession.Name = user.TenKhachHang;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
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
            return RedirectToAction("Index");
        }
        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return RedirectToAction("Index");
        }


    }
}