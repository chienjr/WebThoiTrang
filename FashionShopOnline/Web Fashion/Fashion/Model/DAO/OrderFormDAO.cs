using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class OrderFormDAO
    {
        FashionDbContext orderform;
        public OrderFormDAO()
        {
            orderform = new FashionDbContext();
        }

        public List<DonHang> ListOrderForm()
        {
            return orderform.DonHang.ToList();
        }

        public int CreateOrderForm(KhachHang customer, string note)
        {
            orderform.KhachHang.Add(customer);
            orderform.SaveChanges();
            var customerID = customer.MaKhachHang;
            var entity = new DonHang();
            entity.NgayDat = DateTime.Now;
            entity.MaKhachHang = customerID;
            entity.TinhTrangGiaoHang = false;
            entity.GhiChu = note;
            orderform.DonHang.Add(entity);
            orderform.SaveChanges();
            var id = entity.MaDonHang;
            return id;
        }

        public int CreateOrderForm(int CustomerID, string note)
        {
            var entity = new DonHang();
            entity.NgayDat = DateTime.Now;
            entity.MaKhachHang = CustomerID;
            entity.TinhTrangGiaoHang = false;
            entity.GhiChu = note;
            orderform.DonHang.Add(entity);
            orderform.SaveChanges();
            var id = entity.MaDonHang;
            return id;
        }

        public void CreateOrderFormDetail(int id, int productID, int colorID, int sizeID, int price, int quantity)
        {
            var entity = new ChiTietDonHang();
            entity.MaDonHang = id;
            entity.MaSP = productID;
            entity.MaMau = colorID;
            entity.MaSize = sizeID;
            entity.DonGia = price;
            entity.SoLuong = quantity;
            orderform.ChiTietDonHang.Add(entity);
            orderform.SaveChanges();
        }

        public void DeleteOrderForm(int id)
        {
        
            var entity = orderform.DonHang.SingleOrDefault(x => x.MaKhachHang == id);
            var e = orderform.ChiTietDonHang.SingleOrDefault(x => x.MaDonHang == entity.MaDonHang);
            orderform.ChiTietDonHang.Remove(e);
            orderform.SaveChanges();
            orderform.DonHang.Remove(entity);
            orderform.SaveChanges();
        }

        public DonHang GetByID(int id)
        {
            var entity = orderform.DonHang.Find(id);
            return entity;
        }

        public List<DonHang> ListByCustomerID(int id)
        {
            return orderform.DonHang.Where(x => x.MaKhachHang == id).ToList();
        }

        public int Total(int id)
        {
            List<ChiTietDonHang> list = orderform.ChiTietDonHang.Where(x => x.MaDonHang == id).ToList();
            int sum = 0;
            foreach (var item in list)
            {
                sum += item.DonGia * item.SoLuong;
            }
            return sum;
        }
        public bool EditOrderForm(DonHang _orderform)
        {
            try
            {
                var entity = orderform.DonHang.Find(_orderform.MaDonHang);
                entity.NgayGiaoHang = _orderform.NgayGiaoHang;
                entity.TinhTrangGiaoHang = _orderform.TinhTrangGiaoHang;
                orderform.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<ChiTietDonHang> ListOrderFormDetail(int id)
        {
            return orderform.ChiTietDonHang.Where(x => x.MaDonHang == id).ToList();
        }
    }
}
