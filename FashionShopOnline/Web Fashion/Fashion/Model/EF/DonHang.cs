namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DonHang")]
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            ChiTietDonHang = new HashSet<ChiTietDonHang>();
        }

        [Key]
        public int MaDonHang { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? NgayDat { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? NgayGiaoHang { get; set; }

        public int MaKhachHang { get; set; }

        public bool TinhTrangGiaoHang { get; set; }

        [StringLength(250)]
        public string GhiChu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHang { get; set; }

        public virtual KhachHang KhachHang { get; set; }
    }
}
