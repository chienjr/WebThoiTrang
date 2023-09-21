using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using System.Data.SqlClient;

namespace Model.DAO
{
    public class ProductDAO
    {
        FashionDbContext product;
        public ProductDAO()
        {
            product = new FashionDbContext();
        }

        public List<MauSac> ListColorProduct(int id)
        {
            return product.Database.SqlQuery<MauSac>("exec list_color " + id).ToList();
        }
        public List<KichThuoc> ListSizeProduct(int id)
        {
            return product.Database.SqlQuery<KichThuoc>("exec list_size " + id).ToList();
        }
        public List<HinhAnh> ListImageProduct(int id)
        {
            return product.HinhAnh.Where(x => x.MaSP == id).ToList();
        }
        public List<SanPham> ListProduct()
        {
            return product.SanPham.OrderByDescending(x => x.MaSP).ToList();
        }

        public List<SanPham> ListHotProduct()
        {
            return product.SanPham.Take(5).ToList();
        }

        public List<SanPham> ListProductByCategory(int id, ref int totalRecord, int pageIndex = 1, int pageSize = 3)
        {
            totalRecord = product.SanPham.Where(x => x.MaDanhMucSP == id).Count();
            return product.SanPham.Where(x => x.MaDanhMucSP == id).OrderByDescending(x => x.NgayCapNhat).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }
        public List<SanPham> ListProductByCategory(int id)
        {
            return product.SanPham.Where(x => x.MaDanhMucSP == id).ToList();
        }
        public List<SanPham> ListProductByBrand(int id)
        {
            return product.SanPham.Where(x => x.MaHang == id).ToList();
        }

        public List<SanPham> ListProductByCollection(int id, ref int totalRecord, int pageIndex = 1, int pageSize = 3)
        {
            totalRecord = product.SanPham.Where(x => x.MaBST == id).Count();
            return product.SanPham.Where(x => x.MaBST == id).OrderByDescending(x => x.NgayCapNhat).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }

        public void DeleteProduct(int id)
        {
            SqlParameter[] pram = 
                {
                    new SqlParameter {ParameterName="@MaSP", Value = id}
                };
            product.Database.ExecuteSqlCommand("exec delete_product @MaSP", pram);
            product.SaveChanges();
        }

        public List<HinhAnh> ImageGetByID(int id)
        {
            return product.HinhAnh.Where(x => x.MaSP == id).ToList();
        }
        public SanPham GetByID(int id)
        {
            return product.SanPham.Find(id);
        }
        public bool EditProduct(SanPham _product)
        {
            try
            {
                var entity = product.SanPham.Find(_product.MaSP);
                entity.TenSP = _product.TenSP;
                entity.GiaSP = _product.GiaSP;
                entity.GiaKhuyenMai = _product.GiaKhuyenMai;
                entity.MoTa = _product.MoTa;
                entity.SoLuong = _product.SoLuong;
                product.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public void CreateProduct(SanPham _product, List<int> listcolor, List<int> listsize, string img1, string img2, string img3)
        {
            _product.NgayCapNhat = DateTime.Now;
            product.SanPham.Add(_product);
            product.SaveChanges();
            int idproduct = _product.MaSP;
            foreach (var idcolor in listcolor)
            {
                SqlParameter[] id = 
                {
                    new SqlParameter {ParameterName="@MaSP", Value = idproduct},
                    new SqlParameter {ParameterName="@MaMau", Value = idcolor}
                };
                product.Database.ExecuteSqlCommand("exec add_sanpham_mausac @MaSP, @MaMau", id);
            }
            foreach (var idsize in listsize)
            {
                SqlParameter[] id = 
                {
                    new SqlParameter {ParameterName="@MaSP", Value = idproduct},
                    new SqlParameter {ParameterName="@MaSize", Value = idsize}
                };
                product.Database.ExecuteSqlCommand("exec add_sanpham_kichthuoc @MaSP, @MaSize", id);
            }
            if (img1.Length != 0)
            {
                SqlParameter[] para1 =
            {
                new SqlParameter {ParameterName="@TenHinhAnh", Value = img1},
                new SqlParameter {ParameterName="@MaSP", Value = idproduct}
            };
                product.Database.ExecuteSqlCommand("exec add_hinhanh @TenHinhAnh, @MaSP", para1);
            }
            if (img2.Length != 0)
            {
                SqlParameter[] para2 =
            {
                new SqlParameter {ParameterName="@TenHinhAnh", Value = img2},
                new SqlParameter {ParameterName="@MaSP", Value = idproduct}
            };
                product.Database.ExecuteSqlCommand("exec add_hinhanh @TenHinhAnh, @MaSP", para2);
            }
            if (img3.Length != 0)
            {
                SqlParameter[] para3 =
            {
                new SqlParameter {ParameterName="@TenHinhAnh", Value = img3},
                new SqlParameter {ParameterName="@MaSP", Value = idproduct}
            };
                product.Database.ExecuteSqlCommand("exec add_hinhanh @TenHinhAnh, @MaSP", para3);
            }
            product.SaveChanges();
        }

        public List<SanPham> Search(string keyword, ref int totalRecord, int pageIndex = 1, int pageSize = 3)
        {
            totalRecord = product.SanPham.Where(x => x.TenSP.Contains(keyword)).Count();
            return product.SanPham.Where(x => x.TenSP.Contains(keyword)).OrderByDescending(x => x.NgayCapNhat).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }

        public List<string> ListNameProduct(string keyword)
        {
            return product.SanPham.Where(x => x.TenSP.Contains(keyword)).Select(x => x.TenSP).ToList();
        }
    }
}
