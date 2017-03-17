using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Timers;

namespace Mailing
{
    public partial class Service1 : ServiceBase
    {
        private Timer timer = null;
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {

            System.Diagnostics.Debugger.Launch();

            //timer = new Timer();
            //this.timer.Interval = 240000;
            //this.timer.Elapsed += new System.Timers.ElapsedEventHandler(this.Mailing);
            //timer.Enabled = true;
            ProcesosMailing.EnviarMailing();
        }

        protected override void OnStop()
        {
        }

        private void Mailing(object sender, ElapsedEventArgs g)
        {

            ProcesosMailing.EnviarMailing();
        }
    }
}
