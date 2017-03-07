using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Monitoreo.Models;
using Monitoreo.Models.Mail;

namespace Monitoreo.Controllers
{
    public class DataIamgenesController : Controller
    {
        //
        // GET: /DataIamgenes/

        public ActionResult Index()
        
        
        
        
        
        {
            Type ts = typeof(Array);
            string Ana = ts.Assembly.FullName.ToString();
            string AnAa = ts.AssemblyQualifiedName.ToString();



            Create_File_DataImagens.CreateDirectoy();

            //MailSend.SenMail();
            return View();
        }

    }
}
