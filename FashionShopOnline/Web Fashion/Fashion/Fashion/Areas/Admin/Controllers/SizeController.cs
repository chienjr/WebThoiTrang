using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;

namespace Fashion.Areas.Admin.Controllers
{
    public class SizeController : BaseController
    {

        // GET: /Admin/Size/
        public ActionResult Index()
        {
            SizeDAO sizeDAO = new SizeDAO();
            return View(sizeDAO.ListSize());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Fashion.Areas.Admin.Models.Size model)
        {
            if (ModelState.IsValid)
            {
                var list = new SizeDAO().ListSize();
                int check = 0;
                foreach (var size in list)
                {
                    if (model.SizeName.Equals(size.TenSize))
                    {
                        check = 1;
                    }
                }
                if (check == 0)
                {
                    var kichthuoc = new KichThuoc();
                    kichthuoc.TenSize = model.SizeName;
                    new SizeDAO().CreateSize(kichthuoc);
                    return RedirectToAction("Index");
                }
                if (check == 1)
                {
                    ModelState.AddModelError("", "Kích thước này đã tồn tại.");
                }
            }
            return View(model);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new SizeDAO().DeleteSize(id);
            return RedirectToAction("Index");
        }
    }
}
