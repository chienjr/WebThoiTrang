using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;

namespace Fashion.Areas.Admin.Controllers
{
    public class OrderFormController : BaseController
    {
        //
        // GET: /Admin/OrderForm/
        public ActionResult Index()
        {
            return View(new OrderFormDAO().ListOrderForm());
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var entity = new OrderFormDAO().GetByID(id);
            return View(entity);
        }

        [HttpPost]
        public ActionResult Edit(DonHang _orderform)
        {
            new OrderFormDAO().EditOrderForm(_orderform);
            return RedirectToAction("Index");
        }

        public ActionResult Detail(int id)
        {
            var entity = new OrderFormDAO().GetByID(id);
            int IDcustomer = entity.MaKhachHang;
            var customer = new CustomerDAO().GetByID(IDcustomer);
            ViewBag.name = customer.TenKhachHang;
            ViewBag.address = customer.DiaChi;
            ViewBag.phone = customer.SoDienThoai;
            return View(new OrderFormDAO().ListOrderFormDetail(id));
        }
	}
}