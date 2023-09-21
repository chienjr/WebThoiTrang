using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using Model.DAO;
using Fashion.Models;

namespace Fashion.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        //
        // GET: /Cart/
        public ActionResult Index()
        {
            var session_cart = Session[CartSession];
            var list = new List<CartItem>();
            if(session_cart != null)
            {
                list = (List<CartItem>)session_cart;
            }
            return View(list);
        }

        public ActionResult Update(int key, int quantity)
        {
            var session_cart = Session[CartSession];
            var list = new List<CartItem>();
            if (session_cart != null)
            {
                list = (List<CartItem>)session_cart;
                foreach(var item in list)
                {
                    if(item.Key == key && quantity/10 > 0)
                    {
                        item.Quantity = quantity/10;
                    }
                }
            }
            return RedirectToAction("Index");
        }

        public ActionResult Order(string txtName, string txtAddress, string txtPhone, string txtEmail, string txtNote)
        {
            if(txtName.Length > 0 && txtAddress.Length > 0 && txtPhone.Length > 0 && txtEmail.Length > 0)
            {
                var session_cart = Session[CartSession];
                if (session_cart != null)
                {
                    var entity = new KhachHang();
                    entity.TenKhachHang = txtName;
                    entity.DiaChi = txtAddress;
                    entity.SoDienThoai = txtPhone;
                    entity.Email = txtEmail;
                    entity.PhanLoai = false;
                    int id = new OrderFormDAO().CreateOrderForm(entity, txtNote);
                    var list = new List<CartItem>();
                    list = (List<CartItem>)session_cart;
                    foreach (var item in list)
                    {
                        if (item.Product.GiaKhuyenMai != null)
                        {
                            new OrderFormDAO().CreateOrderFormDetail(id, item.Product.MaSP, item.Color.MaMau, item.Size.MaSize, (int)item.Product.GiaKhuyenMai, item.Quantity);
                        }
                        else
                        {
                            new OrderFormDAO().CreateOrderFormDetail(id, item.Product.MaSP, item.Color.MaMau, item.Size.MaSize, item.Product.GiaSP, item.Quantity);
                        }
                    }
                    return RedirectToAction("OrderSuccess");
                }
            }
            return RedirectToAction("Index");
        }

        public ActionResult Order_Session(string txtNote)
        {
            var session_cart = Session[CartSession];
            if(session_cart != null)
            {
                var session = (Fashion.Common.UserLogin)Session["USER_SESSION"];
                if(session != null)
                {
                    int id = new OrderFormDAO().CreateOrderForm(session.CustomerID, txtNote);
                    var list = new List<CartItem>();
                    list = (List<CartItem>)session_cart;
                    foreach (var item in list)
                    {
                        if (item.Product.GiaKhuyenMai != null)
                        {
                            new OrderFormDAO().CreateOrderFormDetail(id, item.Product.MaSP, item.Color.MaMau, item.Size.MaSize, (int)item.Product.GiaKhuyenMai, item.Quantity);
                        }
                        else
                        {
                            new OrderFormDAO().CreateOrderFormDetail(id, item.Product.MaSP, item.Color.MaMau, item.Size.MaSize, item.Product.GiaSP, item.Quantity);
                        }
                    }
                    return RedirectToAction("OrderSuccess");
                }
            }
            return RedirectToAction("Index");
        }

        public ActionResult OrderSuccess()
        {
            var session_cart = Session[CartSession];
            var list = new List<CartItem>();
            if (session_cart != null)
            {
                list = (List<CartItem>)session_cart;
            }
            Session[CartSession] = null;
            return View(list);
        }
        public ActionResult AddItem(int productID, int colorID, int sizeID, int quantity)
        {
            var product = new ProductDAO().GetByID(productID);
            var color = new ColorDAO().GetByID(colorID);
            var size = new SizeDAO().GetByID(sizeID);
            var session_cart = Session[CartSession];
            if(session_cart != null)
            {
                var list = (List<CartItem>)session_cart;
                if(list.Exists(x => x.Product.MaSP == productID) && list.Exists(x => x.Color.MaMau == colorID) && list.Exists(x => x.Size.MaSize == sizeID))
                {
                    foreach(var item in list)
                    {
                        if(item.Product.MaSP == productID && item.Color.MaMau == colorID && item.Size.MaSize == sizeID)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Key = productID*colorID*sizeID*quantity;
                    item.Product = product;
                    item.Color = color;
                    item.Size = size;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                Session[CartSession] = list;
            }
            else
            {
                var item = new CartItem();
                item.Key = productID*colorID*sizeID*quantity;
                item.Product = product;
                item.Color = color;
                item.Size = size;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int key)
        {
            var session_cart = (List<CartItem>)Session[CartSession];
            session_cart.RemoveAll(x => x.Key == key);
            Session[CartSession] = session_cart;
            return RedirectToAction("Index");
        }

        public ActionResult DeleteAll()
        {
            Session[CartSession] = null;
            return RedirectToAction("Index");
        }
	}
}