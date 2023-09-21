using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Fashion.Areas.Admin.Controllers
{
    public class ColorController : BaseController
    {
        //
        // GET: /Admin/Color/
        public ActionResult Index()
        {
            ColorDAO colorDAO = new ColorDAO();
            return View(colorDAO.ListColor());
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Fashion.Areas.Admin.Models.Color model)
        {
            if(ModelState.IsValid)
            {
                var list = new ColorDAO().ListColor();
                int check = 0;
                foreach(var color in list)
                {
                    if(model.ColorName.Equals(color.TenMau))
                    {
                        check = 1;
                    }
                }
                if(check == 0)
                {
                    var mausac = new MauSac();
                    mausac.TenMau = model.ColorName;
                    new ColorDAO().CreateColor(mausac);
                    return RedirectToAction("Index");
                }
                if(check == 1)
                {
                    ModelState.AddModelError("", "Màu này đã tồn tại.");
                }
            }
            return View(model);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            ColorDAO colorDAO = new ColorDAO();
            colorDAO.DeleteColor(id);
            return RedirectToAction("Index");
        }
	}
}