namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("QuangCao")]
    public partial class QuangCao
    {
        [Key]
        public int MaQuangCao { get; set; }

        [StringLength(100)]
        public string HinhAnhQC { get; set; }
    }
}
