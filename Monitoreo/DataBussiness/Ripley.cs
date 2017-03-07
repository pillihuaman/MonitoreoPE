using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Monitoreo.DataBussiness
{
    public class Ripley
    {
        public string _Trama { set; get; }
        public string _FechaProceso { set; get; }
        public string _NombreArchivo { set; get; }
        public string _monto_Ripley { set; get; }
        public string _Total_Transferir { set; get; }

        public string _Comision { set; get; }
        public string _Message { set; get; }
        public string _Cip { set; get; }
        public Ripley()
        { }

    }
}