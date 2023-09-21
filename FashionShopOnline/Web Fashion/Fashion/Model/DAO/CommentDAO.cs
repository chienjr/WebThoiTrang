using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CommentDAO
    {
        FashionDbContext comment;
        public CommentDAO()
        {
            comment = new FashionDbContext();
        }

        public List<BinhLuan> ListComment()
        {
            return comment.BinhLuan.ToList();
        }

        public List<BinhLuan> ListCommentDisplay(int id)
        {
            return comment.BinhLuan.Where(x => x.TrangThai == true).Where(x => x.MaSP == id).ToList();
        }

        public BinhLuan GetByID(int id)
        {
            var entity = comment.BinhLuan.Find(id);
            return entity;
        }
        public bool EditComment(BinhLuan _comment)
        {
            try
            {
                var entity = comment.BinhLuan.Find(_comment.MaBinhLuan);
                entity.TrangThai = _comment.TrangThai;
                comment.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }

        public bool DeleteComment(int id)
        {
            try
            {
                var entity = comment.BinhLuan.Find(id);
                comment.BinhLuan.Remove(entity);
                comment.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public void AddComment(BinhLuan _comment)
        {
            _comment.NgayGio = DateTime.Now;
            _comment.TrangThai = true;
            comment.BinhLuan.Add(_comment);
            comment.SaveChanges();
        }
    }
}
