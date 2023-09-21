using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class CustomerDAO
    {
        FashionDbContext customer;
        public CustomerDAO()
        {
            customer = new FashionDbContext();
        }

        public List<KhachHang> ListCustomer()
        {
            return customer.KhachHang.ToList();
        }
        public void CreateCustomer(KhachHang _customer)
        {
            customer.KhachHang.Add(_customer);
            customer.SaveChanges();
        }

        public KhachHang GetByID(int id)
        {
            return customer.KhachHang.Find(id);
        }
        public bool EditCustomer(KhachHang _customer)
        {
            try
            {
                var entity = customer.KhachHang.Find(_customer.MaKhachHang);
                entity.TenKhachHang = _customer.TenKhachHang;
                entity.TenDangNhap = _customer.TenDangNhap;
                entity.MatKhau = _customer.MatKhau;
                entity.DiaChi = _customer.DiaChi;
                entity.SoDienThoai = _customer.SoDienThoai;
                entity.Email = _customer.Email;
                entity.PhanLoai = _customer.PhanLoai;
                customer.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public void DeleteCustomer(int id)
        {
            var entity = customer.KhachHang.Find(id);
            customer.KhachHang.Remove(entity);
            customer.SaveChanges();
        }

        public KhachHang GetByUsername(string username)
        {
            return customer.KhachHang.SingleOrDefault(x => x.TenDangNhap == username);
        }
        public int Login(string userName, string passWord)
        {
            var result = customer.KhachHang.SingleOrDefault(x => x.TenDangNhap == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.MatKhau == passWord)
                    return 1;
                else
                    return -1;
            }
        }
        public bool CheckUsername(string username)
        {
            return customer.KhachHang.Count(x => x.TenDangNhap == username) > 0;
        }
        public bool CheckEmail(string email)
        {
            return customer.KhachHang.Count(x => x.Email == email) > 0;
        }
    }
}
