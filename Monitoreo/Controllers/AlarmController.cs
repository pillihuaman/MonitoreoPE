using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Monitoreo.Controllers
{
    public class AlarmController : Controller
    {
        //
        // GET: /Alarm/

        public ActionResult Index()
        {

            //return new FilePathResult(path, "text/html");

            return View();
        }

        
    }
}
