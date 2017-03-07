using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace Monitoreo.Models
{
    public class RemoveFilesFromDirectory
    {
        public static String RemoveFile(string path, string Nombre)
        {
            string Mensaje = string.Empty;

            try
            {
                //new System.IO.DirectoryInfo(path).Delete(true);

            }
            catch (Exception ex)
            {

                Mensaje = "Error Encontrado" + ex.ToString();
                throw ex;


            }

            return Mensaje;

        }
    }
}