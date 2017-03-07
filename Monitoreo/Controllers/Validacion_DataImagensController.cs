using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Monitoreo.Models;
using System.Net;
using System.IO;
using System.Text;



namespace Monitoreo.Controllers
{
    public class Validacion_DataImagensController : Controller
    {
        //
        // GET: /Validacion_DataImagens/

        public ActionResult Index()
        {

            Validar_Clientes_DI Obj_valida = new Validar_Clientes_DI();
            Obj_valida.Fecha_proceso = new DateTime();
            Obj_valida.FTP_File_Localeted_File = "FTP_NEGOCIO01";//Ruta del archivo donde se encuentra alojado el FTP
            Obj_valida.FTP_URL = "190.81.188.203";//URL del FTP externo
            Obj_valida.IDArchivo = 0;
            //Obj_valida.NombreArchivo = "";//Nombre del archivo alojado en el FTP 
            Obj_valida.Password = "sentinel2016"; // Pass to autentification to enter to FTP Protocol file saved
            Obj_valida.UserName = "usr_negocio01";//Nombre del usuario  paraacceder al FTP


          
            //Obj_valida.FTP_File_Localeted_File = "home\\dataimagenes\\pagoefectivo\\home\\pagoefectivo\\SALIDA";//Ruta del archivo donde se encuentra alojado el FTP
            
            //Obj_valida.FTP_URL = "190.81.45.62";//URL del FTP externo
            //Obj_valida.IDArchivo = 0;
            ////Obj_valida.NombreArchivo = "";//Nombre del archivo alojado en el FTP 
            //Obj_valida.Password = "P@g$$f3ct1v$"; // Pass to autentification to enter to FTP Protocol file saved
            //Obj_valida.UserName = "pagoefectivo";//Nombre del usuario  paraacceder al FTP
       
            Queue<string> List_Files_FTPServer =new Queue<string>(GetAllFile(Obj_valida));

            
            foreach (string File in List_Files_FTPServer)
            {
                Obj_valida.Directory_Local = "F:\\ValidarDataimages\\"+File;


                DownloadFiles(Obj_valida, File);
            
            }

            //DownloadFiles(Obj_valida,List_Files_FTPServer);

            return View();
        }

        public static Queue<String> GetAllFile(Validar_Clientes_DI objVal )
        {
            //string ftpfullpath = "ftp://" + ftphost + ftpfilepath;
            try
            {
                string line;
                Queue<String> listar_ArchivosFTP = new Queue<string>();

                StringBuilder result = new StringBuilder();
                FtpWebRequest requestDir = (FtpWebRequest)WebRequest.Create("ftp://" + objVal.FTP_URL + "/"+objVal.FTP_File_Localeted_File);
                requestDir.Method = WebRequestMethods.Ftp.ListDirectory;
                requestDir.Credentials = new NetworkCredential(objVal.UserName,objVal.Password);
                FtpWebResponse responseDir = (FtpWebResponse)requestDir.GetResponse();
                StreamReader readerDir = new StreamReader(responseDir.GetResponseStream());

                 line = readerDir.ReadLine();
                while (line != null)
                {
                    result.Append(line);
                    //result.Append("\n");
                    line = readerDir.ReadLine();
                    listar_ArchivosFTP.Enqueue( line);
                }

                //result.Remove(result.ToString().LastIndexOf('\n'), 1);
                responseDir.Close();
                return listar_ArchivosFTP;


            
            }
            catch (Exception ex)
            { throw ex; }
        
        }

        public static  string  DownloadFiles(Validar_Clientes_DI objVal,string  filename)
        {
              string Message = string.Empty;
            try
                  {
                      if (filename != null)
                      {


                          objVal.NombreArchivo = filename;
                          StringBuilder result = new StringBuilder();
                          FtpWebRequest requestDir = (FtpWebRequest)WebRequest.Create("ftp://" + objVal.FTP_URL + "/" + objVal.FTP_File_Localeted_File + "/" + objVal.NombreArchivo);
                          requestDir.Method = WebRequestMethods.Ftp.DownloadFile;
                          requestDir.Credentials = new NetworkCredential(objVal.UserName, objVal.Password);
                          FtpWebResponse responseDir = (FtpWebResponse)requestDir.GetResponse();
                          StreamReader readerDir = new StreamReader(responseDir.GetResponseStream());
                          StreamWriter escribe = new StreamWriter(objVal.Directory_Local);
                          escribe.Write(readerDir.ReadToEnd());

                          escribe.Close();

                          //readerDir.Close();
                          responseDir.Close();
                          readerDir.Close();
                          Message = "Se descargo Correctamente";
                          objVal.NombreArchivo = string.Empty;
                          result.Clear();

                          filename = "";
                      }
            
              
                 

                  }
                  catch (Exception ex)
                  {
                      Message = "Se genero un error" + ex;
                      throw ex;

                  }

            
            return Message;

        }

    }
}
