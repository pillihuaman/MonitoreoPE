using Monitoreo.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using System.Web;

namespace Monitoreo.Controllers
{
    public class ConciliacionBanbifController : Controller
    {
        //
        // GET: /ConciliacionBanbif/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        //procesar Preconciliacion
        public JsonResult ProcesarLiquidacionBanbif()
        {

            string path = string.Empty;
            string Mensaje = string.Empty;
            Queue<Monitoreo.DataBussiness.Ripley> ResultadoTramFinal = new Queue<Monitoreo.DataBussiness.Ripley>();
            Queue<string> FileName =new Queue<string>();  
            Queue<string> ScriptConciliacion =new Queue<string>();
            try
            {
                //Fecha = this.Request.QueryString["param1"];
                var Fecha = HttpContext.Request.Params.Get("FechaProceso");
                if (Request.Files.Count > 0)
                {
                    HttpFileCollectionBase Colecio = Request.Files;
                    for (int i = 0; i < Colecio.Count; i++)
                    {
                        HttpPostedFileBase Basepos = Colecio[i];
                        string Nombre = Basepos.FileName;
                        string ContenidoType = Basepos.ContentType;
                        Stream Contenido = Basepos.InputStream;
                        Basepos.SaveAs(Server.MapPath("~/Files/") + Nombre);
                    path = Server.MapPath("~/Files/").ToString();
                    FileName.Enqueue(Nombre);

                  ScriptConciliacion=  ConciliacionBanbif.Get_ConciliacionBanbif(FileName, path, Fecha);
                  if (ScriptConciliacion.Count > 3)
                  {
                      ConciliacionBanbif.CreateScript_Conciliacion(ScriptConciliacion, path, Fecha);
                  }
                }
                }

                
            }
             catch(Exception ex)
            {



            }

            return Json(ScriptConciliacion, JsonRequestBehavior.AllowGet);
        }



      
    }
}
