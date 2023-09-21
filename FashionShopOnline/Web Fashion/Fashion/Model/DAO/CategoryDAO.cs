using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CategoryDAO
    {
        FashionDbContext category;
        public CategoryDAO()
        {
            category = new FashionDbContext();
        }

        public List<DanhMucSP> ListCategory()
        {
            return category.DanhMucSP.Where(x => x.MaDanhMucSPCha == null).ToList();
        }

        public List<DanhMucSP> ListSubCategory()
        {
            return category.DanhMucSP.Where(x => x.MaDanhMucSPCha != null).ToList();
        }
        public List<DanhMucSP> ListSubCategory(int id)
        {
            return category.DanhMucSP.Where(x => x.MaDanhMucSPCha == id).ToList();
        }
        public void CreateCategory(DanhMucSP _category)
        {
            category.DanhMucSP.Add(_category);
            category.SaveChanges();
        }

        public void CreateSubCategory(DanhMucSP _category, int id)
        {
            _category.MaDanhMucSPCha = id;
            category.DanhMucSP.Add(_category);
            category.SaveChanges();
        }
        public bool DeleteCategory(int id)
        {
            try
            {
                var entity = category.DanhMucSP.Find(id);
                category.DanhMucSP.Remove(entity);
                category.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public List<DanhMucSP> ListCategoryByIDParent(int id)
        {
            return category.DanhMucSP.Where(x => x.MaDanhMucSPCha == id).ToList();
        }
    }
}
