namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhachHang")]
    public partial class KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachHang()
        {
            DonHang = new HashSet<DonHang>();
        }

        [Key]
        public int MaKhachHang { get; set; }

        [StringLength(100)]
        public string TenKhachHang { get; set; }

        [StringLength(100)]
        public string TenDangNhap { get; set; }

        [StringLength(100)]
        public string MatKhau { get; set; }

        [StringLength(100)]
        public string DiaChi { get; set; }

        [StringLength(11)]
        public string SoDienThoai { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        public bool PhanLoai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DonHang> DonHang { get; set; }
    }
}
