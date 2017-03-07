using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Monitoreo.Models
{
    public class Conexion
    {

        public static Stack<String> GetCliente()
        {
            SqlDataReader dr = null;
            SqlConnection cn = null;
            SqlCommand cmd = null;
            Stack<string> Lista_cliente = new Stack<string>();
            String Conexio_String = ConfigurationManager.ConnectionStrings["cnBD"].ConnectionString;

            try
            {

                //Open the conexion to DB
                cn = new SqlConnection(Conexio_String);
                cn.Open();
                string Seleccionar_Cliente = "select IdCliente,Nombres from  cliente";

                cmd = new SqlCommand(Seleccionar_Cliente, cn);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (!(Convert.ToInt32(dr["IdCliente"]) % 2 != 0))
                    {

                        Lista_cliente.Push(dr["IdCliente"].ToString());
                    }

                }


             
                cn.Close();
                return Lista_cliente;

            }
            catch (Exception ex)
            {

                throw ex;
            }




        }

    }
}