using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using Fashion.Models;
using Fashion.Common;

namespace Fashion.Controllers
{
    public class ProfileController : Controller
    {
        //
        // GET: /Profile/
        [HttpGet]
        public ActionResult Index()
        {
            var session = (Fashion.Common.UserLogin)Session["USER_SESSION"];
            var profile = new ChangeProfile();
            if (session != null)
            {
                var entity = new CustomerDAO().GetByID(session.CustomerID);
                profile.TenKhachHang = entity.TenKhachHang;
                profile.TenDangNhap = entity.TenDangNhap;
                profile.DiaChi = entity.DiaChi;
                profile.SoDienThoai = entity.SoDienThoai;
                profile.Email = entity.Email;
                return View(profile);
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Index(ChangeProfile model)
        {
            if (ModelState.IsValid)
            {
                var session = (Fashion.Common.UserLogin)Session["USER_SESSION"];
                if(session != null)
                {
                    var entity = new KhachHang();
                    entity.MaKhachHang = session.CustomerID;
                    entity.TenKhachHang = model.TenKhachHang;
                    entity.TenDangNhap = model.TenDangNhap;
                    entity.DiaChi = model.DiaChi;
                    entity.SoDienThoai = model.SoDienThoai;
                    entity.Email = model.Email;
                    entity.PhanLoai = true;
                    if(model.ExPassword != null)
                    {
                        if (session.Password.Equals(Encryptor.MD5Hash(model.ExPassword)))
                        {
                            entity.MatKhau = Encryptor.MD5Hash(model.ConfirmPassword.ToString());
                        }
                        else
                        {
                            ModelState.AddModelError("", "Nhập sai mật khẩu");
                        }
                    }
                    new CustomerDAO().EditCustomer(entity);
                    return RedirectToAction("ModifySuccess");
                }
            }
            return View(model);
        }

        public ActionResult ModifySuccess()
        {
            return View();
        }

        public ActionResult PurchasingHistory()
        {
            var session = (Fashion.Common.UserLogin)Session["USER_SESSION"];
            List<DonHang> list = new List<DonHang>();
            if(session != null)
            {
                list = new OrderFormDAO().ListByCustomerID(session.CustomerID);
            }
            return View(list);
        }

        public ActionResult PurchasingHistoryDetail(int id)
        {
            ViewBag.ID = id;
            return View(new OrderFormDAO().ListOrderFormDetail(id));
        }
    }
}