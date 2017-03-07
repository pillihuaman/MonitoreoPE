using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Monitoreo.Models
{
    public class Validar_Clientes_DI
    {
        public    int IDArchivo {set;get;}
        public  string NombreArchivo { set; get; }
        public  DateTime Fecha_proceso { set; get; }
        public  string FTP_URL { set; get; }
        public  string UserName { set; get; }
        public  string Password { set; get; }
        public  string FTP_File_Localeted_File { set; get; }
        public string Directory_Local { set; get; }
       
    }

   
}