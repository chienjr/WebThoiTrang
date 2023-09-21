namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class FashionDbContext : DbContext
    {
        public FashionDbContext()
            : base("name=FashionDbContext")
        {
        }

        public virtual DbSet<BaiViet> BaiViet { get; set; }
        public virtual DbSet<BinhLuan> BinhLuan { get; set; }
        public virtual DbSet<BoSuuTap> BoSuuTap { get; set; }
        public virtual DbSet<ChiTietDonHang> ChiTietDonHang { get; set; }
        public virtual DbSet<DanhMucSP> DanhMucSP { get; set; }
        public virtual DbSet<DonHang> DonHang { get; set; }
        public virtual DbSet<Hang> Hang { get; set; }
        public virtual DbSet<HinhAnh> HinhAnh { get; set; }
        public virtual DbSet<KichThuoc> KichThuoc { get; set; }
        public virtual DbSet<KhachHang> KhachHang { get; set; }
        public virtual DbSet<MauSac> MauSac { get; set; }
        public virtual DbSet<QuanTriVien> QuanTriVien { get; set; }
        public virtual DbSet<QuangCao> QuangCao { get; set; }
        public virtual DbSet<SanPham> SanPham { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiViet>()
                .Property(e => e.NoiDung)
                .IsUnicode(false);

            modelBuilder.Entity<DonHang>()
                .HasMany(e => e.ChiTietDonHang)
                .WithRequired(e => e.DonHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KichThuoc>()
                .HasMany(e => e.ChiTietDonHang)
                .WithRequired(e => e.KichThuoc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<KichThuoc>()
                .HasMany(e => e.SanPham)
                .WithMany(e => e.KichThuoc)
                .Map(m => m.ToTable("SanPham_KichThuoc").MapLeftKey("MaSize").MapRightKey("MaSP"));

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<MauSac>()
                .HasMany(e => e.ChiTietDonHang)
                .WithRequired(e => e.MauSac)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MauSac>()
                .HasMany(e => e.SanPham)
                .WithMany(e => e.MauSac)
                .Map(m => m.ToTable("SanPham_MauSac").MapLeftKey("MaMau").MapRightKey("MaSP"));

            modelBuilder.Entity<SanPham>()
                .Property(e => e.MoTa)
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietDonHang)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

        }
    }
}
