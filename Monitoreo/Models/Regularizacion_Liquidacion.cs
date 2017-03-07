using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Web.Hosting;

namespace Monitoreo.Models
{
    public class Regularizacion_Liquidacion
    {

        public static Queue<string> Get_Values_Liquidacion(Queue<string> Liquidacion)
        {
            Queue<string> Get_LiquidacionCip = new Queue<string>(Liquidacion);
            Queue<string> Get_Values_Liquidacion = new Queue<string>();

            SqlDataReader dr = null;
            SqlConnection cn = null;
            //SqlCommand cmd = null;
            Stack<string> Lista_cliente = new Stack<string>();
            String Conexio_String = ConfigurationManager.ConnectionStrings["cnBD"].ConnectionString;



            try
            {




                using (SqlConnection con = new SqlConnection(Conexio_String))
                {
                    con.Open();
                    string Nombre = string.Empty;
                    string monenda = string.Empty;
                    foreach (string cips in Get_LiquidacionCip)
                    {
                        using (SqlCommand cmd = new SqlCommand("USP_GET_CIPS", con))
                        {

                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@idordenpago", cips);
                            //cmd.Parameters.AddWithValue("@LastName", txtlastname);

                            dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                //  Get_Values_Liquidacion.Enqueue(dr["idordenpago"].ToString()+"///"+dr["IdMoneda"].ToString()+"///"+dr["Nombre"].ToString()+"///"+dr["IdEmpresaContratante"].ToString());
                                monenda = dr["IdMoneda"].ToString();
                                Nombre = dr["Nombre"].ToString();
                            }
                        }

                        dr.Close();
                        using (SqlCommand cmd = new SqlCommand("USP_GET_CIPS_ULTIMALIQUIDACION", con))
                        {

                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@Nombre", Nombre);
                            cmd.Parameters.AddWithValue("@IdMoneda", int.Parse(monenda));
                            //cmd.Parameters.AddWithValue("@LastName", txtlastname);

                            dr = cmd.ExecuteReader();
                            Queue<string> Cips = new Queue<string>(GetnameReader(dr));

                            while (dr.Read())
                            {

                                foreach (string s in Cips)
                                {
                                    if (s.Contains("FechaRegistro"))
                                    {
                                        Get_Values_Liquidacion.Enqueue(dr["FechaRegistro"].ToString() + "///" + dr["IdMoneda"].ToString() + "///" + dr["Nombre"].ToString() + "///" + dr["IdEmpresaContratante"].ToString() + "///" + dr["IdTransferenciaEmpresas"].ToString());
                                        Leer_SctiptLiquidacion(cips, dr["IdEmpresaContratante"].ToString(), dr["IdTransferenciaEmpresas"].ToString(), dr["Nombre"].ToString());
                                       
                                        
                                        break;
                                    }
                                    else
                                    { Get_Values_Liquidacion.Enqueue(dr["ErrorMessage"].ToString()); }

                                }

                            }
                        }
                        dr.Close();

                        Nombre = string.Empty;
                        monenda = string.Empty;
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }


            return Get_Values_Liquidacion;

        }

        public static Queue<string> GetnameReader(SqlDataReader red)
        {
            Queue<string> nameRader = new Queue<string>();

            for (int i = 0; i < red.FieldCount; i++)
            {
                nameRader.Enqueue(red.GetName(i).ToString());

            }

            return nameRader;

        }

        public static Queue<string> Leer_SctiptLiquidacion(string Cips, string IdServicio, string IdTransferenciaEmpresas,string NombreServicio)
        {
            int counter = 0;
            string linea;
            string CadeNaScript = string.Empty;
            Queue<string> txt_CIP = new Queue<string>();
            string Script1 = string.Empty;
            string Script2 = string.Empty;
            string filepath = HttpContext.Current.Request.PhysicalApplicationPath;
            filepath += "Files\\FileConstant\\Procesar_Liquidacion.sql";
            StreamReader file = new StreamReader(filepath);
            while ((linea = file.ReadLine()) != null)
            {
                string Key = string.Empty;
                Key = linea;

                if (Key.Contains("DECLARE @IdTransferenciaEmpresas INT ="))
                {
                    string cadena1 = Key;
                    txt_CIP.Enqueue(cadena1 + IdTransferenciaEmpresas + "\n");

                }
                else if (Key.Contains("DECLARE @IdEmpresa int ="))
                {
                    string cadena1 = Key;
                    txt_CIP.Enqueue(cadena1 + IdServicio + "\n");

                }
                else if (Key.Contains("where O1.IdOrdenPago in ("))
                {
                    string cadena1 = Key;
                    txt_CIP.Enqueue(cadena1 + Cips + "\n");

                }

                else
                {

                    txt_CIP.Enqueue(linea + "\n");

                    //CadeNaScript = CadeNaScript + linea + "\n";

                    counter++;
                }





            }
            file.Close();

            CreateScriptLiquidacion(txt_CIP,Cips+"___"+NombreServicio+"__");
            //

            return txt_CIP;

        }


        public static void CreateScriptLiquidacion(Queue<string> GetStringScript,String Cadena_Nombre)
        {

            string filepath = HttpContext.Current.Request.PhysicalApplicationPath;
            filepath += "Files";
            string fileName = string.Format(@"" + filepath + "\\Liquidacion"+Cadena_Nombre+" {0}.sql", Guid.NewGuid());

            try
            {

                using (StreamWriter sw = File.CreateText(fileName))
                {

                    foreach (string sxript in GetStringScript)
                    {

                        sw.WriteLine(sxript);
                    
                    }

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    }
}