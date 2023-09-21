using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fashion.Common
{
    [Serializable]
    public class AdminLogin
    {
        public int AdminID { set; get; }
        public String UserName { set; get; }
        public String Name { set; get; }
        public String Email { set; get; }
        public String Password { set; get; }
        public bool Phanloai { set; get; }
    }
}