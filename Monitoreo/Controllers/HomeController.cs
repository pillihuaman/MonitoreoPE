using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services;
using Monitoreo.Models;
using System.Threading;

namespace Monitoreo.Controllers
{
    public class HomeController : Controller
    {


        public ActionResult Index()
        {

            //Create_txt_File.Creates_txt_File();

            //Conexion.GetCliente();
            //ReadTxtFile.Get_Value_CIP();
            //Get_Excel_Values.get_Values_Excel_BBVA();
            return View();
        }
        [HttpPost]
        //Cargar Archivos a Servidor
        public JsonResult Procesar_Monitoreo()
        {
            string Message;
            Queue<string> Retun_Result = new Queue<string>();
            try
            {
                Queue<string> MP_Name_File = new Queue<string>();
                Queue<string> CIP_Final = new Queue<string>();
                Queue<string> CIP_Enbruto = new Queue<string>();



                string path = string.Empty;
                if (Request.Files.Count > 0)
                {
                    HttpFileCollectionBase fil = Request.Files;
                    for (int i = 0; i < fil.Count; i++)
                    {

                        HttpPostedFileBase fl = fil[i];
                        string filename = fl.FileName;
                        string fileConten = fl.ContentType;
                        Stream FileConten = fl.InputStream;
                        MP_Name_File.Enqueue(filename);
                        // sabe in the path server

                        fl.SaveAs(Server.MapPath("~/Files/") + filename);
                        //string PathSave=Server.MapPath("~/Files/").ToString();
                      //MP_Name_File.Enqueue(  Monitoreo.Models.ConvertoXLSFormat.ConvertFileToXLSXFormat(PathSave, filename));
                        path = Server.MapPath("~/Files/").ToString();


                    }

                    Message = "Successful Upload";
                    Retun_Result.Enqueue(Message);

                    ThreadStart starter = delegate { CIP_Enbruto = Get_Excel_Values.Monitore_Source_En_Bruto(MP_Name_File, path); };
                    new Thread(starter).Start();

                    //Get_Excel_Values.Monitore_Source_En_Bruto(MP_Name_File, path);

                    //Get_Excel_Values.MonitoreoGetFileValues(MP_Name_File, path);
                    CIP_Final=Get_Excel_Values.MonitoreoGetFileValues(MP_Name_File, path);
                    foreach (string s in CIP_Final )
                    {

                        Retun_Result.Enqueue(s);
                    }

                    foreach (string s in CIP_Enbruto)
                    {

                        Retun_Result.Enqueue(s);
                    }

                }

            
            }

            catch (Exception ex)
            {
                //throw ex;
                Message = ex.ToString() + "Error en la carga";
                Retun_Result.Enqueue(Message);
            }

            return Json(Retun_Result.ToArray(), JsonRequestBehavior.AllowGet);
        }



        [HttpPost]
        //procesar Preconciliacion
        public JsonResult AddPreconciliacion(List<string> list)
        {
            Queue<string> MP_Name_File = new Queue<string>();
            Queue<string> Final_Message = new Queue<string>();


            string path = string.Empty;
            //var array= NewRequest.Files.AllKeys.ToArray();
            try
            {
                if (Request.Files.Count > 0)
                {
                    HttpFileCollectionBase fil = Request.Files;
                    for (int i = 0; i < fil.Count; i++)
                    {

                        HttpPostedFileBase fl = fil[i];
                        string filename = fl.FileName;
                        string fileConten = fl.ContentType;
                        Stream FileConten = fl.InputStream;
                        MP_Name_File.Enqueue(filename);
                        // sabe in the path server

                        fl.SaveAs(Server.MapPath("~/Files/") + filename);
                        path = Server.MapPath("~/Files/").ToString();

                    }
                    Final_Message = Get_Excel_Values.Get_Preconciliacion(MP_Name_File, path);

                }
                else
                {
                    Final_Message.Enqueue("No se carga el archivos  o el archivo Incorreto");
                }

                //Get_Excel_Values.get_Values_Excel_BBVA(MP_Name_File, path);
                //Get_Excel_Values.Get_Preconciliacion(MP_Name_File, path);
            }
            catch (Exception ex)
            {

                //throw ex:

                Final_Message.Enqueue(ex.ToString());
            }

            return Json(Final_Message.ToArray(), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        //procesar Procesar Proveedores
        public JsonResult ProcesarProvedores(string Banco)
        {


          

            Queue<string> Final_CIPS;
            if (Banco.ToString().Contains("SKB"))
            { Final_CIPS = new Queue<string>(Create_txt_File.SBK(Banco)); }
            else if (Banco.ToString().Contains("IBK"))
            { Final_CIPS = new Queue<string>(Create_txt_File.Creates_IBK(Banco)); }
            else if (Banco.ToString().Contains("FC"))
            { Final_CIPS = new Queue<string>(Create_txt_File.Creates_FC(Banco)); }
            else if (Banco.ToString().Contains("BIF"))
            { Final_CIPS = new Queue<string>(Create_txt_File.Creates_BIF(Banco)); }
            else if (Banco.ToString().Contains("WU"))
            { Final_CIPS = new Queue<string>(Create_txt_File.Creates_WU(Banco)); }
            else
            {
                string mesaError = "Know Name of bank";
                Final_CIPS = new Queue<string>();
                Final_CIPS.Enqueue(mesaError);

            }




            //Get_Excel_Values.get_Values_Excel_BBVA(MP_Name_File, path);
            //Get_Excel_Values.Get_Preconciliacion(MP_Name_File, path);


            return Json(Final_CIPS.ToArray(), JsonRequestBehavior.AllowGet);
        }

    }

}
