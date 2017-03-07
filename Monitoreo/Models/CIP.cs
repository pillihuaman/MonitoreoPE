using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Monitoreo.Models
{
    public class CIP
    {
        

        public string CIP1
        {
            get;
            set;
        }
        public string nombreServicio
        {
            get;
            set;
        }
        public string Idmoneda
        {
            get;
            set;
        }
        public string fecha
        {
            get;
            set;
        }

        public string CodigoOperacion
        {
            get;
            set;
        }
        public int Numero
        { get; set; }
        
        
        public CIP() { }
     
    }
}