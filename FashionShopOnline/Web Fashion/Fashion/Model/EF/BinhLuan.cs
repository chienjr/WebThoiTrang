namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BinhLuan")]
    public partial class BinhLuan
    {
        [Key]
        public int MaBinhLuan { get; set; }

        [StringLength(100)]
        public string HoTenNBL { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? NgayGio { get; set; }

        [StringLength(300)]
        public string NoiDung { get; set; }

        public bool TrangThai { get; set; }

        public int? MaSP { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
