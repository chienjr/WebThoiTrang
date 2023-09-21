using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Model.DAO
{
    public class ColorDAO
    {
        FashionDbContext color;
        public ColorDAO()
        {
            color = new FashionDbContext();
        }

        public List<MauSac> ListColor()
        {
            return color.MauSac.ToList();
        }

        public MauSac GetByID(int id)
        {
            return color.MauSac.Find(id);
        }
        public void CreateColor(MauSac _color)
        {
            color.MauSac.Add(_color);
            color.SaveChanges();
        }

        public bool DeleteColor(int id)
        {
            try
            {
                var entity = color.MauSac.Find(id);
                color.MauSac.Remove(entity);
                color.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }
        public List<MauSac> GetList(List<int> list)
        {
            List<MauSac> listMau = new List<MauSac>();
            foreach(var item in list)
            {
                var mau = color.MauSac.Find(item);
                listMau.Add(mau);
            }
            return listMau;
        }
    }
}
