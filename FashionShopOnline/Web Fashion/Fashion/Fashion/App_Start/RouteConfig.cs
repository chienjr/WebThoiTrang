using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Fashion
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            //Trang chủ
            routes.MapRoute(
                name: "Home",
                url: "trang-chu",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Liên hệ
            routes.MapRoute(
                name: "Contact",
                url: "lien-he",
                defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Bài viết
            routes.MapRoute(
                name: "Article",
                url: "bai-viet",
                defaults: new { controller = "Article", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            routes.MapRoute(
                name: "Article Detail",
                url: "bai-viet-{id}",
                defaults: new { controller = "Article", action = "Detail", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Bộ sưu tập
            routes.MapRoute(
                name: "Collection",
                url: "bo-suu-tap-{id}",
                defaults: new { controller = "Product", action = "ListProductByCollection", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );


            //Danh mục
            routes.MapRoute(
                name: "Category",
                url: "danh-muc-{id}",
                defaults: new { controller = "Product", action = "ListProduct", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Chi tiết sản phẩm
            routes.MapRoute(
                name: "Detail",
                url: "chi-tiet-san-pham-{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Kết quả tìm kiếm
            routes.MapRoute(
                name: "Search",
                url: "ket-qua-tim-kiem/{keyword}",
                defaults: new { controller = "Product", action = "SearchResult", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Giỏ hàng
            routes.MapRoute(
                name: "Cart",
                url: "gio-hang",
                defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            routes.MapRoute(
                name: "Cart Order",
                url: "mua-hang-thanh-cong",
                defaults: new { controller = "Cart", action = "OrderSuccess", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Đăng ký
            routes.MapRoute(
                name: "Register",
                url: "dang-ky",
                defaults: new { controller = "Register", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            routes.MapRoute(
                name: "Register Success",
                url: "dang-ky-thanh-cong",
                defaults: new { controller = "Register", action = "RegisterSuccess", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Đăng nhập
            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "Home", action = "Login", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Tài khoản
            routes.MapRoute(
                name: "Profile",
                url: "thong-tin-tai-khoan",
                defaults: new { controller = "Profile", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            routes.MapRoute(
                name: "Modify Profile",
                url: "cap-nhat-tai-khoan-thanh-cong",
                defaults: new { controller = "Profile", action = "ModifySuccess", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            //Lịch sử mua hàng
            routes.MapRoute(
                name: "History",
                url: "lich-su-mua-hang",
                defaults: new { controller = "Profile", action = "PurchasingHistory", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            routes.MapRoute(
                name: "History Detail",
                url: "chi-tiet-mua-hang-{id}",
                defaults: new { controller = "Profile", action = "PurchasingHistoryDetail", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Fashion.Controllers" }
            );
        }
    }
}
