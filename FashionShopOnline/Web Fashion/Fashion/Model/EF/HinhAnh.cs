namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HinhAnh")]
    public partial class HinhAnh
    {
        [Key]
        public int MaHinhAnh { get; set; }

        [StringLength(100)]
        public string TenHinhAnh { get; set; }

        public int? MaSP { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
