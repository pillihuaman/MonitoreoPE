﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;


namespace DataImagenesValidar
{
    public static  class  SerrvicioDataImagenes
    {
        public static void WriteErroLog(Exception ex)
        {
            StreamWriter StrW = null;
            try
            { 
            



            StrW= new StreamWriter(AppDomain.CurrentDomain.BaseDirectory+"\\log.txt",true);
            StrW.WriteLine(DateTime.Now.ToString() + ":" + ex.Source.Trim() + ";" + ex.Message.ToString().Trim());
            StrW.Flush();
            StrW.Close();

            }

            catch{}
        
        }

        public static void WriteErroLog(string message)
        {
            StreamWriter StrW = null;
            try
            {
                 

                StrW = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "\\log.txt", true);
                StrW.WriteLine(DateTime.Now.ToString() + ":"+message);
                StrW.Flush();
                StrW.Close();

            }

            catch { }

        }

        public static void ShowPage()
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://www.contoso.com/");
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        
        }
    
    }
}
