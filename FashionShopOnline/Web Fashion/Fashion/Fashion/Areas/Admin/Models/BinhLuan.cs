//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Fashion.Areas.Admin.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BinhLuan
    {
        public int MaBinhLuan { get; set; }
        public string HoTenNBL { get; set; }
        public Nullable<System.DateTime> NgayGio { get; set; }
        public string NoiDung { get; set; }
        public Nullable<bool> TrangThai { get; set; }
        public Nullable<int> MaSP { get; set; }
    
        public virtual SanPham SanPham { get; set; }
    }
}