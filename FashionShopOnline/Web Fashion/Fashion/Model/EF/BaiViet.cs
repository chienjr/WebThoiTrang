namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BaiViet")]
    public partial class BaiViet
    {
        [Key]
        public int MaBaiViet { get; set; }

        [StringLength(50)]
        public string TieuDe { get; set; }

        [StringLength(100)]
        public string HinhAnhBaiViet { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? NgayDangBaiViet { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDung { get; set; }

        [StringLength(200)]
        public string MoTa { get; set; }
    }
}
