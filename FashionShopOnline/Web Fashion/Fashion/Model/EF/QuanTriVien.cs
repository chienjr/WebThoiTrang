namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("QuanTriVien")]
    public partial class QuanTriVien
    {
        [Key]
        public int MaAdmin { get; set; }

        [StringLength(100)]
        public string TenAdmin { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(100)]
        public string TaiKhoan { get; set; }

        [StringLength(100)]
        public string MatKhau { get; set; }

        public bool PhanLoai { get; set; }
    }
}
