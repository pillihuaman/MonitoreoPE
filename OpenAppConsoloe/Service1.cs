using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Timers;

namespace OpenAppConsoloe
{
    partial class Service1 : ServiceBase
    {
        private Timer TMR = null;
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            System.Diagnostics.Debugger.Launch();


            TMR = new Timer();

            this.TMR.Interval = 60000;
            this.TMR.Elapsed += new System.Timers.ElapsedEventHandler(this.TimerTick);
            TMR.Enabled = true;
            //SerrvicioDataImagene
           
            // TODO: Add code here to start your service.
        }

        protected override void OnStop()
        {
            TMR.Enabled = false;
            // TODO: Add code here to perform any tear-down necessary to stop your service.
        }
        private void TimerTick(Object sender, ElapsedEventArgs Arg)
        {
            Program.Main();
        }
    }
}
