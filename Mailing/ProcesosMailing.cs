using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Net.Mail;


namespace Mailing
{
    class ProcesosMailing
    {


        public static string EnviarMailing()
        {
            //System.Diagnostics.Debugger.Launch();


            try
            {
                SqlDataReader dr = null;
                String Conexio_String = ConfigurationManager.ConnectionStrings["cnBDLocal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(Conexio_String))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("SP_EnviarMailing", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        dr = cmd.ExecuteReader();

                        //while (dr.Read())
                        ////{
                        ////    NombreArchivo = dr["NOMBRE_ARCHIVO"].ToString();

                        ////    ListarResultadoDIInsert.Enqueue(dr["REPORTE_DATAIMAGENES"].ToString());
                        //}


                    }


                    dr.Close();

                }

            }

            catch (Exception ex)
            {

                throw ex;
            }

            return "";

        }
    }
}
