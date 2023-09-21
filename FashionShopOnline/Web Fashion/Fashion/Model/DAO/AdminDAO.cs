using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class AdminDAO
    {
        FashionDbContext admin;
        public AdminDAO()
        {
            admin = new FashionDbContext();
        }

        public List<QuanTriVien> ListAdmin()
        {
            return admin.QuanTriVien.ToList();
        }

        public QuanTriVien GetByID(int id)
        {
            return admin.QuanTriVien.Find(id);
        }
        public bool CreateAdmin(QuanTriVien _admin)
        {
            try
            {
                admin.QuanTriVien.Add(_admin);
                admin.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteAdmin(int id)
        {
            try
            {
                var entity = admin.QuanTriVien.Find(id);
                admin.QuanTriVien.Remove(entity);
                admin.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public QuanTriVien GetByUsername(string userName)
        {
            return admin.QuanTriVien.SingleOrDefault(x => x.TaiKhoan == userName);
        }

        public int Login(string userName, string passWord)
        {
            var result = admin.QuanTriVien.SingleOrDefault(x => x.TaiKhoan == userName);
            if(result == null)
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

        public bool EditPassword(QuanTriVien _admin)
        {
            try
            {
                var entity = admin.QuanTriVien.Find(_admin.MaAdmin);
                entity.MatKhau = _admin.MatKhau;
                admin.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
