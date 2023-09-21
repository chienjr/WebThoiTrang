﻿using Fashion.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Fashion.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = Session[CommonConstants.ADMIN_SESSION];
            if(session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(
                    new { controller = "Login", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
        }
	}
}