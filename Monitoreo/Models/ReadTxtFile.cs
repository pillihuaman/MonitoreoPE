using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;

namespace Monitoreo.Models
{
    public class ReadTxtFile
    {

         public static  String Leer_Txt_CIP(string FilePath){
             int counter = 0;
             string linea;
             string CadeNaScript = string.Empty;
             Queue<string> txt_CIP = new Queue<string>();
             StreamReader file = new StreamReader("" + FilePath + "FileConstant\\Pre_Conciliacion.sql");

             while ((linea= file.ReadLine())!= null) {

                 txt_CIP.Enqueue(linea);
                 CadeNaScript = CadeNaScript + linea +"\n";

                 counter++;
             }
             file.Close();

             return CadeNaScript;
         
         
         }
         public static Queue<string> Leer_SctiptMonitore(string FilePath)
         {
             int counter = 0;
             string linea;
             string CadeNaScript = string.Empty;
             Queue<string> txt_CIP = new Queue<string>();
             StreamReader file = new StreamReader(FilePath + "FileConstant\\Bancos.sql");

             while ((linea = file.ReadLine()) != null)
             {
                 string Key = string.Empty;
                 Key = linea;
                 if (Key.Contains("@B1='"))
                 {
                     string cadena1 = Key;
                     txt_CIP.Enqueue(cadena1 + "\n");

                 }
                 else if ((Key.Contains("(IdOrdenPago,Banco) VALUES")))
                 {
                     string cadena2 = Key;
                     txt_CIP.Enqueue(cadena2 + "\n");

                 }
                 else
                 {

                     txt_CIP.Enqueue(linea + "\n");

                     //CadeNaScript = CadeNaScript + linea + "\n";

                     counter++;
                 }





             }
             file.Close();
             return txt_CIP;
         }
        public static Queue<CIP> Get_Value_CIP()
        {

            SqlDataReader dr = null;
            SqlConnection cn = null;
            SqlCommand cmd = null;
            Queue<CIP> Lista_cliente = new Queue<CIP>();
            CIP objcip= new CIP();
              //Queue<string> Lista_CIP = new Queue<string>(Leer_Txt_CIP("dfd"));
            String Conexio_String = ConfigurationManager.ConnectionStrings["cnBD"].ConnectionString;

            string cadena = string.Empty;
             //foreach(string s  in Lista_CIP){

             //    cadena = cadena + s;
             
             //}

            try
            {




                //Open the conexion to DB
                cn = new SqlConnection(Conexio_String);
                cn.Open();
                string Seleccionar_CIPS = " SELECT OP.IDORDENPAGO,SER.NOMBRE,OP.IDMONEDA FROM OrdenPago OP" + "\n" +
  " JOIN Servicio SER ON (OP.IDSERVICIO=SER.IDSERVICIO)" + "\n" +
  " WHERE OP.IDORDENPAGO IN" + "\n" +
  " (" + cadena.Substring(0,cadena.Length-1) + " )";



                cmd = new SqlCommand(Seleccionar_CIPS, cn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    objcip = new CIP();
                    objcip.CIP1 = dr["IDORDENPAGO"].ToString();
                    objcip.nombreServicio = dr["NOMBRE"].ToString();
                    objcip.Idmoneda = dr["IDMONEDA"].ToString();

                    Lista_cliente.Enqueue(objcip);

                }



                cn.Close();
                return Lista_cliente;

            }
            catch (Exception ex)
            {

                throw ex;
            }


        
        }

        public static void fn_Find_LastIdtranferencia_to_Service() {

        
        
        }    
    }
}


