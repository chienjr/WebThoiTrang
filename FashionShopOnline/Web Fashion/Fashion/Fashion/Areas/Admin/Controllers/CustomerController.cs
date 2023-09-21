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
    public class CustomerController : BaseController
    {
        //
        // GET: /Admin/Customer/
        public ActionResult Index()
        {
            return View(new CustomerDAO().ListCustomer());
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var entity = new CustomerDAO().GetByID(id);
            return View(entity);
        }

        [HttpPost]
        public ActionResult Edit(KhachHang _customer)
        {
            _customer.MatKhau = Encryptor.MD5Hash(_customer.MatKhau.ToString());
            new CustomerDAO().EditCustomer(_customer);
            return RedirectToAction("Index");
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new OrderFormDAO().DeleteOrderForm(id);
            new CustomerDAO().DeleteCustomer(id);
            return RedirectToAction("Index");
        }
	}
}