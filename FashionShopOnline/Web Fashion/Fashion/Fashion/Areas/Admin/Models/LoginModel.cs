using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Fashion.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Mời nhập username")]
        public String UserName { set; get; }

        [Required(ErrorMessage = "Mời nhập password")]
        public String PassWord { set; get; }
    }
}