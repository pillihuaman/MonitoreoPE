using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Diagnostics;

namespace WSOpenExplorer
{
 class   SerrvicioDataImagenes
    {
        public static void WriteErroLog(Exception ex)
        {
            StreamWriter StrW = null;
            try
            {




                StrW = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "\\log.txt", true);
                StrW.WriteLine(DateTime.Now.ToString() + ":" + ex.Source.Trim() + ";" + ex.Message.ToString().Trim());
                StrW.Flush();
                StrW.Close();

            }

            catch { }

        }

        public static void WriteErroLog(string message)
        {
            StreamWriter StrW = null;
            try
            {


                StrW = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "\\log.txt", true);
                StrW.WriteLine(DateTime.Now.ToString() + ":" + message);
                StrW.Flush();
                StrW.Close();

            }

            catch { }

        }

        public static void ShowPage()
        {
            Process.Start("http://www.google.com");

        }
        public static void TimerTick()
        {
            try
            {
                bool IsAppRunning = IsProcessOpen("firefox");
                if (IsAppRunning)
                {
                    Process AppPro = new Process();
                    string PathApp;
                    PathApp = @"C:\Program Files (x86)\Mozilla Firefox\firefox.exe";
                    System.Diagnostics.Process.Start(PathApp);
               
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        private static bool IsProcessOpen(string AppName)
        {
            foreach (Process procs in Process.GetProcesses())
            {
                if (procs.ProcessName.Contains(AppName))
                {
                    return true;
                }


            }
            return false;
        }
    }
}
