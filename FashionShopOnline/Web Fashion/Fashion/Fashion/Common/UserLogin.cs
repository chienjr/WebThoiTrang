using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Fashion.Common
{
    [Serializable]
    public class UserLogin
    {
        public int CustomerID { get; set; }
        public String UserName { get; set; }
        public String Name { get; set; }
        public String Password { get; set; }
    }
}