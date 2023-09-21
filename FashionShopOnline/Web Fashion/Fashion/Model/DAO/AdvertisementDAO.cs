using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class AdvertisementDAO
    {
        FashionDbContext adv;
        public AdvertisementDAO()
        {
            adv = new FashionDbContext();
        }

        public List<QuangCao> ListAdvertisement()
        {
            return adv.QuangCao.ToList();
        }

        public List<QuangCao> ListSlider()
        {
            return adv.QuangCao.ToList().Where(x => x.HinhAnhQC.StartsWith("/Data/images/Advertisement/Slider")).ToList();
        }

        public List<QuangCao> ListInspired()
        {
            return adv.QuangCao.ToList().Where(x => x.HinhAnhQC.StartsWith("/Data/images/Advertisement/get_inspired")).ToList();
        }
        public bool CreateAdvertisement(QuangCao _adv)
        {
            try
            {
                adv.QuangCao.Add(_adv);
                adv.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteAdvertisement(int id)
        {
            try
            {
                var entity = adv.QuangCao.Find(id);
                adv.QuangCao.Remove(entity);
                adv.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
