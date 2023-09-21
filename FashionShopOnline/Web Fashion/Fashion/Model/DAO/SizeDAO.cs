using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class SizeDAO
    {
        FashionDbContext size;
        public SizeDAO()
        {
            size = new FashionDbContext();
        }

        public List<KichThuoc> ListSize()
        {
            return size.KichThuoc.ToList();
        }

        public KichThuoc GetByID(int id)
        {
            return size.KichThuoc.Find(id);
        }
        public void CreateSize(KichThuoc _size)
        {
            size.KichThuoc.Add(_size);
            size.SaveChanges();
        }

        public bool DeleteSize(int id)
        {
            try
            {
                var entity = size.KichThuoc.Find(id);
                size.KichThuoc.Remove(entity);
                size.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }
    }
}
