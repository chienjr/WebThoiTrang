using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;

namespace Model.DAO
{
    public class ArticleDAO
    {
        FashionDbContext article;
        public ArticleDAO()
        {
            article = new FashionDbContext();
        }

        public List<BaiViet> ListArticle()
        {
            return article.BaiViet.ToList();
        }

        public List<BaiViet> ListIntroArticle()
        {
            return article.BaiViet.Take(2).ToList();
        }

        public void CreateArticle(BaiViet _article)
        {
            _article.NgayDangBaiViet = DateTime.Now;
            article.BaiViet.Add(_article);
            article.SaveChanges();
        }

        public BaiViet GetByID(int id)
        {
            return article.BaiViet.Find(id);
        }

        public bool EditArticle(BaiViet _article)
        {
            try
            {
                var entity = article.BaiViet.Find(_article.MaBaiViet);
                entity.TieuDe = _article.TieuDe;
                entity.MoTa = _article.MoTa;
                entity.NoiDung = _article.NoiDung;
                article.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }

        public bool DeleteArticle(int id)
        {
            try
            {
                var entity = article.BaiViet.Find(id);
                article.BaiViet.Remove(entity);
                article.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
