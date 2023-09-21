using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CollectionDAO
    {
        FashionDbContext collection;
        public CollectionDAO()
        {
            collection = new FashionDbContext();
        }

        public List<BoSuuTap> ListAllCollection()
        {
            return collection.BoSuuTap.ToList();
        }
        public List<BoSuuTap> ListCollection()
        {
            return collection.BoSuuTap.Where(x => x.TenBST != "None").ToList();
        }

        public void CreateCollection(BoSuuTap _collection)
        {
            collection.BoSuuTap.Add(_collection);
            collection.SaveChanges();
        }

        public bool DeleteCollection(int id)
        {
            try
            {
                var entity = collection.BoSuuTap.Find(id);
                var listProduct = collection.SanPham.Where(x => x.MaBST == id).ToList();
                BoSuuTap bst = collection.BoSuuTap.Where(x => x.TenBST == "None").First();
                foreach(var item in listProduct)
                {
                    item.MaBST = bst.MaBST;
                    collection.SaveChanges();
                }
                collection.BoSuuTap.Remove(entity);
                collection.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
