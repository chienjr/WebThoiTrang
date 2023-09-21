using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Fashion.Areas.Admin.Models
{
    public class Size
    {
        [Required(ErrorMessage = "Yêu cầu nhập tên size")]
        public string SizeName { set; get; }
    }
}