using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
//using System.Timers;

namespace OpenAppConsoloe
{
    class Program
    {
        
       public static void Main()
        {

       

            System.Timers.Timer aTimer = new System.Timers.Timer();
            aTimer.Elapsed += new System.Timers.ElapsedEventHandler(TimerTick);
            aTimer.Interval = 60000;
            aTimer.Enabled = true;
            Thread.Sleep(System.Threading.Timeout.Infinite);
  
    
        }

        private static void TimerTick(object sender, EventArgs e)
        {
            try
            {
                string APPNmae = "notepad";


                bool IsAppRunning = IsProcessOpen(APPNmae);
                Process AppPro = new Process();
                if (!IsAppRunning)
                {
                  
                    string PathApp;
                    PathApp = @"C:\Windows\notepad.exe";
                    System.Diagnostics.Process.Start(PathApp);
                    Thread.Sleep(10000);
                }
                foreach (Process procs in Process.GetProcesses())
                {
                    if (procs.ProcessName.Contains(APPNmae))
                    {
                        procs.Kill();
                    }


                }
       
             
            }
            catch (Exception ex)
            {

                throw ex;
            }
       

        }

   

        private static bool IsProcessOpen(string AppName)
        {
            foreach(Process procs in Process.GetProcesses())
            {
                if (procs.ProcessName.Contains(AppName))
                {
                    return true;
                }
               
            
         }
            return false;
        }

        public static void TimerTick()
        {
            try
            {
                bool IsAppRunning = IsProcessOpen("firefox");
                if (!IsAppRunning)
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

    
    }
}
