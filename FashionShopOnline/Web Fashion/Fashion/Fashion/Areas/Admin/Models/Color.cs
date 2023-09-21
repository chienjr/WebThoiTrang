using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Fashion.Areas.Admin.Models
{
    public class Color
    {
        [Required(ErrorMessage = "Yêu cầu nhập tên màu")]
        public string ColorName { set; get; }
    }
}