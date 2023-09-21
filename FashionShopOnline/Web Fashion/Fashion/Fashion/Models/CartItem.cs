using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fashion.Models
{
    [Serializable]
    public class CartItem
    {
        public int Key { set; get; }
        public SanPham Product { set; get; }
        public MauSac Color { set; get; }
        public KichThuoc Size { set; get; }
        public int Quantity { set; get; }
    }
}