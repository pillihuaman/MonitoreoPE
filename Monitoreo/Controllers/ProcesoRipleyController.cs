using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace Monitoreo.Controllers
{
    public class ProcesoRipleyController : Controller
    {
        //
        // GET: /ProcesoRipley/   ProcesoRipley/Procesar_Liquidacion

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Procesar_Ripley()
        {
            string path = string.Empty;
            string Mensaje = string.Empty;
            Queue<Monitoreo.DataBussiness.Ripley> ResultadoTramFinal = new Queue<Monitoreo.DataBussiness.Ripley>();
            try 
            {

                var Fecha = HttpContext.Request.Params.Get("FechaProceso");
                    HttpFileCollectionBase Colecio = Request.Files;
                    path = Server.MapPath("~/Files/FinalFiles/").ToString();
                      ResultadoTramFinal=   Monitoreo.Models.GenerarTramaRipley.GenerarTrama(path, "M",Fecha);
            }
            catch(Exception ex)
            {
                //throw ex;
                Monitoreo.DataBussiness.Ripley erro = new DataBussiness.Ripley();
                erro._Message = "Error" + ex.ToString();

                ResultadoTramFinal.Enqueue(erro);
            }
            return Json(ResultadoTramFinal, JsonRequestBehavior.AllowGet);
        
        }

        [HttpPost]
        public JsonResult Crear_Trama_Ripley(string Fecha)
        {

            return Json("s", JsonRequestBehavior.AllowGet);
        }
    
    }
}
