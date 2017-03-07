using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using Microsoft.Office.Interop.Excel;
using System.IO;
using Spire.Xls;

namespace Monitoreo.Models
{
    public class ConvertoXLSFormat
    {

        public static string ConvertFileToXLSXFormat(string Path,string NameFile)
        {



            //var files = Directory.GetFiles(Path);
            //var ApPframewok = new Microsoft.Office.Interop.Excel.Application();
            //var WorkBookSheet = ApPframewok.Workbooks.Open(NameFile);
            var NameFile1 = NameFile;
                        if (NameFile.Contains("xls") || NameFile.Contains("XLS"))
                        {

                            NameFile1 = NameFile.Substring(0, NameFile.Length - 4)+".xlsx";
                            //WorkBookSheet.SaveAs(Filename: NameFile1, FileFormat: Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook);
                            //WorkBookSheet.Close();
                            //ApPframewok.Quit();
                            Workbook WorkBook = new Workbook();
                            WorkBook.LoadFromFile(Path + "//" + NameFile);
                            Models.DeleteFiles.DeleteFileFromDirectory(Path, NameFile);
                            WorkBook.SaveToFile(Path.Substring(0, Path.Length-4) + "//" + NameFile1, ExcelVersion.Version2007);
                        }
                        else
                            {

                                //NameFile1 = NameFile.Substring(0, NameFile.Length - 4) + ".xlsx";
                                //WorkBookSheet.SaveAs(Filename: NameFile1, FileFormat: Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook);
                                //WorkBookSheet.Close();
                                //ApPframewok.Quit();
                                Workbook WorkBook = new Workbook();
                                WorkBook.LoadFromFile(Path + "//" + NameFile);
                                Models.DeleteFiles.DeleteFileFromDirectory(Path, NameFile);
                                WorkBook.SaveToFile(Path.Substring(0, Path.Length - 4) + "//" + NameFile1, ExcelVersion.Version2007);
                            }


            return NameFile1;

        
        }


       
    }
}