using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace Monitoreo.Models
{
    public class DeleteFiles
    {
        public static string  DeleteFileFromDirectory(string path, string Nombre)
        {
            string Message = string.Empty;         

            try
            {
             DirectoryInfo dir=   new DirectoryInfo(path);
                 foreach(FileInfo FileName in  dir.GetFiles() )
                 {
                     FileName.Delete();
                     Message = "Se elimino todos losa archivo del directorio" + path;
                 
                 }
            //Dir.Delete(,)
               
                //DirectoryInfo()DeleteFileFromDirectory(path,Nombre);

                  }
            catch(Exception ex )
            {
                Message = "Se presento un error no contralado" + ex;
                throw ex;
            
            }
            return Message;
        
        }
    }
}