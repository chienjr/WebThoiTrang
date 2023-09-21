using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class BrandDAO
    {
        FashionDbContext brand;
        public BrandDAO()
        {
            brand = new FashionDbContext();
        }

        public List<Hang> ListBrand()
        {
            return brand.Hang.ToList();
        }

        public void CreateBrand(Hang _brand)
        {
            brand.Hang.Add(_brand);
            brand.SaveChanges();
        }

        public bool DeleteBrand(int id)
        {
            try
            {
                var entity = brand.Hang.Find(id);
                brand.Hang.Remove(entity);
                brand.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
