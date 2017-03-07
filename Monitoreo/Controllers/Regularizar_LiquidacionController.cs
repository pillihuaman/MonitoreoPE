using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Monitoreo.Models;

namespace Monitoreo.Controllers
{
    public class Regularizar_LiquidacionController : Controller
    {
        //
        // GET: /Regularizar_Liquidacion/

       
        public ActionResult Index()
        {



            return View();
        }

        [HttpPost]
        public JsonResult Procesar_Liqudiacion(string[] cipss)
        
        {

            Queue<string> Cips = new Queue<string>(cipss);
            Queue<string> GetValues = new Queue<string>();
            GetValues = Regularizacion_Liquidacion.Get_Values_Liquidacion(Cips);

            return Json(GetValues, JsonRequestBehavior.AllowGet);
        }

    }
}
