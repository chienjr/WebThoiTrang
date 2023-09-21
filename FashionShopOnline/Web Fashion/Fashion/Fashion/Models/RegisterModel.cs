using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Fashion.Models
{
    public class RegisterModel
    {
        [Required(ErrorMessage = "Yêu cầu nhập đầy đủ tên")]
        public string TenKhachHang { get; set; }

        [Required(ErrorMessage = "Yêu cầu nhập Username")]
        public string TenDangNhap { get; set; }

        [StringLength(100, MinimumLength = 6, ErrorMessage = "Độ dài mật khẩu tối thiểu 6 ký tự")]
        [Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        public string MatKhau { get; set; }

        [Required(ErrorMessage = "Yêu cầu nhập địa chỉ")]
        public string DiaChi { get; set; }

        [StringLength(11, MinimumLength = 10, ErrorMessage = "Yêu cầu nhập đúng số điện thoại")]
        [Required(ErrorMessage = "Yêu cầu nhập số điện thoại")]
        public string SoDienThoai { get; set; }

        [Required(ErrorMessage = "Yêu cầu nhập địa chỉ hòm thư điện tử")]
        public string Email { get; set; }

    }
}