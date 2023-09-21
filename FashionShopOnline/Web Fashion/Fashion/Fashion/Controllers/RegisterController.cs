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
    public class RegisterController : Controller
    {
        //
        // GET: /Register/
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(RegisterModel model)
        {
            if(ModelState.IsValid)
            {
                var dao = new CustomerDAO();
                if(dao.CheckUsername(model.TenDangNhap))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                if(dao.CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Email đã được sử dụng");
                }
                if(dao.CheckUsername(model.TenDangNhap) == false && dao.CheckEmail(model.Email) == false)
                {
                    var customer = new KhachHang();
                    customer.TenKhachHang = model.TenKhachHang;
                    customer.TenDangNhap = model.TenDangNhap;
                    customer.MatKhau = Encryptor.MD5Hash(model.MatKhau);
                    customer.DiaChi = model.DiaChi;
                    customer.SoDienThoai = model.SoDienThoai;
                    customer.Email = model.Email;
                    customer.PhanLoai = true;
                    dao.CreateCustomer(customer);
                    return RedirectToAction("RegisterSuccess");
                }
            }
            return View(model);
        }

        public ActionResult RegisterSuccess()
        {
            return View();
        }
	}
}