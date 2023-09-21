using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Fashion.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Mời nhập username")]
        public String UserName { set; get; }

        [Required(ErrorMessage = "Mời nhập password")]
        public String PassWord { set; get; }
    }
}