using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Timers;
using System.Configuration;

using Monitoreo.DataBussiness;
using Monitoreo.Models.Mail;


namespace JobDataImagenes
{
    public partial class Scheduler : ServiceBase
    {
        private Timer TMR = null;
        public Scheduler()
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
            SerrvicioDataImagenes.WriteErroLog("El servicio a empezado a enviar correo");

          
        }

        private void TimerTick(Object sender,ElapsedEventArgs Arg)
        {
            //Monitoreo.DataBussiness.Mail Mail;
           Mail ObjMail = new Mail();
            Queue<string> ObjRipley = new Queue<string>();

            ObjMail._NetworkCredencialUser = ConfigurationManager.AppSettings["NetworkCredencialUser"];
            ObjMail._NetworkCredencialPass = ConfigurationManager.AppSettings["NetworkCredencialPass"];
            ObjMail._CorreoGmailOrigen = "pillihuamanhz@gmail.com";
            ObjMail._NombreGmailOrigen = "Trama Ripley";
            ObjMail._ListaCorreos = new Queue<string>();
            //ObjMail._ListaCorreos.Enqueue("zarmir.pillihuaman@orbis.com.pe");
            ObjMail._ListaCorreos.Enqueue("pillihuamanhz@gmail.com");
            ObjMail._ListaCorreos.Enqueue("universo_infinito88@hotmail.com");
            ObjMail._Subject = DateTime.Now.ToString() + ".txt";
            ObjMail._BodyHtml = "<html><body><h1>" + "Trama Ripley   " + DateTime.Now.ToString() + ".txt" + "  <br>Saludos Coordiales " + "</h1></body></html>";
            //ObjMail.File_Path_ToAtacch = RutaArchivo + NombreTramaTXT + ".txt";
            ObjMail._DisponibleHTMLBODy = true;
            ObjMail._Puerto = ConfigurationManager.AppSettings["Puerto"];


            MailSend.SenMailNoAttachments(ObjMail);
            SerrvicioDataImagenes.ShowPage();
            SerrvicioDataImagenes.WriteErroLog("Timer y otras funcionalidades se levantadon con exito");
        }

        protected override void OnStop()
        {
            TMR.Enabled = false;
            SerrvicioDataImagenes.WriteErroLog("El servicio esta detenido el envio de correos");
        }
    }
}
