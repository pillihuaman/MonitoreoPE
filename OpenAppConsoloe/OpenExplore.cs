using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
namespace OpenAppConsoloe
{
    class OpenExplore
    {

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
