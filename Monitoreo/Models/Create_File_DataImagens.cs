using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
namespace Monitoreo.Models
{
    public class Create_File_DataImagens
    {

        public static void CreateDirectoy()
{
        string SubFileName = DateTime.Now.Date.Year.ToString() + DateTime.Now.Date.Month.ToString() + DateTime.Now.Date.Day.ToString();
        string DataImages_Directory = @"F:\Reporte_George";
        string Ruta_DataImagenes_File = System.IO.Path.Combine(DataImages_Directory, SubFileName);
        string FileMessge = "";


        if ( ! Directory.Exists (Ruta_DataImagenes_File))
        {
          
            System.IO.Directory.CreateDirectory(Ruta_DataImagenes_File);

        }
        else
        {
       string SubFileName1 = "pase1";
       string DataImages_Directory1 = @"F:\Reporte_George\"+SubFileName;
        string Ruta_DataImagenes_File1 = System.IO.Path.Combine(DataImages_Directory, SubFileName1);
        string FileMessge1 = "";


             //if()
            
        }
    


}


    }



}