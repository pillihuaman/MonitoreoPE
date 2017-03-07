using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Monitoreo.Models
{
    public class ConciliacionBanbif
    {

        public static Queue<string> Get_ConciliacionBanbif(Queue<string> FileName, string FilePath,string fecha)
        {
            try
            {
                List<string> Nuevo = new List<string>(FileName);
                Queue<string> get_Cip_Preconcil__ = new Queue<string>();
                Queue<string> ArchivosAnalizar = new Queue<string>();
                Queue<string> get_Cip_Preconciliacion = new Queue<string>();
                Queue<string> str = new Queue<string>();
                string fileName = string.Format(@"" + FilePath + "{0}.sql", Guid.NewGuid());
                string CodigoBuscar = "00000";

                int ni = 0;
                int CantidadDelineasBase = 0;
                int CantidadDelineasBase1 = 0;


                foreach (string Cadena in Nuevo)
                {
                    int n = 0;
                    string path = string.Empty;

                    path = @"" + FilePath + Cadena + "";

                    //////////////////////////

                    get_Cip_Preconciliacion =get_Fisrt_Step(path, n);
                    CantidadDelineasBase = get_Cip_Preconciliacion.Count;
                    get_Cip_Preconcil__ = get_Second_Step(get_Cip_Preconciliacion, CodigoBuscar);
                    CantidadDelineasBase1 = get_Cip_Preconcil__.Count;




                    foreach (String s in get_Cip_Preconcil__)
                    {
                        str.Enqueue(s + ",");

                    }
                    get_Cip_Preconciliacion.Clear();



                }
                //////////////////////////////////////
                String CadenaFinal = string.Empty;
                foreach (String s in str)
                {
                    CadenaFinal = CadenaFinal + s;

                }

                
                get_Cip_Preconciliacion = GetCipsBanbif(CadenaFinal, fecha, CantidadDelineasBase1);
                get_Cip_Preconciliacion.Enqueue("--Cantidad de lineas leidos___[" + CantidadDelineasBase + " ]");
                get_Cip_Preconciliacion.Enqueue("--Cantidad de cips leidos correctamente___[" + CantidadDelineasBase1 + " ]");
                return get_Cip_Preconciliacion;
            }

               

            catch (NotFiniteNumberException ex)
            {
                throw ex;
            }



        }

          public static Queue<string> get_Fisrt_Step(string Path, int intento)
        {

            Queue<string> get_Cip_Preconciliacion = new Queue<string>();
            int contado = 0;
            StreamReader readlinetxt = new StreamReader(Path);
            string cadena1 = string.Empty;
            while ((cadena1 = readlinetxt.ReadLine()) != null)
            {
                String cadena = cadena1.Trim();

                if (intento == 0)
                {
                    if (cadena.Trim().Length > 6 || cadena != "")
                    {

                        string Cadenita = cadena.Replace(" ", "");

                        string cade = Cadenita.Substring(4, Cadenita.Length - 4);


                        //string cadenitasinarroba = cade.Replace("0000000", "");

                        String NuevaCadena = cade.Substring(0, (cade.Length / 2));

                        get_Cip_Preconciliacion.Enqueue(NuevaCadena);
                        contado++;
                    }
                }

                else
                {

                    string Cadenita = cadena.Replace(" ", "");

                    string cade = Cadenita.Substring(4, Cadenita.Length - 4);


                    //string cadenitasinarroba = cade.Replace("0000000", "");

                    String NuevaCadena = cade.Substring(0, (cade.Length / 3));

                    get_Cip_Preconciliacion.Enqueue(NuevaCadena);
                    contado++;





                }










            }
            return get_Cip_Preconciliacion;
        }

		        public static Queue<string> get_Second_Step(Queue<string> get_Cip_Preconciliacion, string CodigoBuscar)
        {



            Dictionary<int, string> get_Cip_Preconciliacion_Pre = new Dictionary<int, string>();
            Queue<char> chart = new Queue<char>();
            Queue<string> chart1 = new Queue<string>();
            Queue<string> get_Cip_Preconcil__ = new Queue<string>();
            int ni = 0;
            foreach (string lista in get_Cip_Preconciliacion)
            {
                string matS;
                string newReg = string.Empty;
                string newRegIndex = string.Empty;
                string newRegfinal = string.Empty;
                matS = lista;
                if (matS.Contains("" + CodigoBuscar + ""))
                {
                    for (int i = 0; i <= matS.Length; i++)
                    {



                        chart.Enqueue(matS[i]);
                        newRegIndex = newRegIndex + matS[i].ToString();
                        if (newRegIndex.Contains("" + CodigoBuscar + ""))
                        {


                            newRegfinal = matS.Substring(newRegIndex.Length, matS.Length - newRegIndex.Length);
                            chart1.Enqueue(newRegfinal);
                            break;

                        }
                    }

                }
                chart.Clear();


            }



            foreach (string lista in chart1)
            {
                string matS;

                Regex re = new Regex(@"\d+");
                Match mat = re.Match(lista);
                if (mat.Success)
                {
                    matS = mat.Value;
                    //cadena1 = mat.Value;
                    get_Cip_Preconciliacion_Pre.Add(ni, matS);
                    ni++;


                }
            }

            foreach (KeyValuePair<int, string> lista2 in get_Cip_Preconciliacion_Pre)
            {
                string matS;
                int numeroIndex = 0;
                Regex re = new Regex(@"5\d+");
    
    
                //CALCULAR ULTIMOS CIPS ACTIVOS.

                Queue<int> promedioCip = new Queue<int>();


                //promedioCip = CalcularPromedio();
                //int NumeroBuscar1 = 0;
                //NumeroBuscar1 = NumeroBuscar(promedioCip);


                //string Buscar = string.Concat(NumeroBuscar1, "\\", "d+");



                //Regex re = new Regex(@"" + Buscar);
                Match mat = re.Match(lista2.Value);

                if (mat.Success)
                {
                    matS = mat.Value;
                    matS = mat.Value;
                    if (matS.Length >= 7)
                    {
                        //if (lista2.Key != 0)
                        //{
                        get_Cip_Preconcil__.Enqueue(matS.Substring(0, 7));

                        //    get_Cip_Preconcil__ParaEvaluacion.Enqueue(cadena1.Substring(0, 7));
                        ////}
                        ////else
                        ////{
                        //}

                    }

                    numeroIndex = lista2.Key;


                }
            }


            return get_Cip_Preconcil__;
        }

                public static Queue<String> GetCipsBanbif(string cadenacips, string FechaProceso,int cantidad)
                {
                    SqlDataReader dr = null;
                    //SqlConnection cn = null;
                    //SqlCommand cmd = null;
                    Queue<string> GetCIPS_banbif = new Queue<string>();
                    String Conexio_String = ConfigurationManager.ConnectionStrings["cnBD"].ConnectionString;

                    try
                    {

                        using (SqlConnection con = new SqlConnection(Conexio_String))
                        {
                            con.Open();

                            using (SqlCommand cmd = new SqlCommand("sp_Generar_Script_ConciliacionBanbif", con))
                            {

                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@FECHAPROCESO", DateTime.Parse(FechaProceso));
                                cmd.Parameters.AddWithValue("@STRINGCIPS", cadenacips);
                                cmd.Parameters.AddWithValue("@CANTIDAD", cantidad);
                                dr = cmd.ExecuteReader();

                                while (dr.Read())
                                {

                                    GetCIPS_banbif.Enqueue(dr["VALOR"].ToString());


                                }

                            }

                        
                        }
                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }


                    return GetCIPS_banbif;

                }

                public  static void CreateScript_Conciliacion(Queue<string> ScriptConciliacion,string path,string fecha)
                {
                    //string fileName = string.Format(@""+path+"","Conciliacion-banbif"+fecha+Guid.NewGuid());
                    //string fileName = string.Format(@"F:\\Monitoreo\IBK_ {0}.sql", Guid.NewGuid());
               
                    try
                    {
                      
                       
                        using (StreamWriter sw = File.CreateText(path + "Conciliacion-banbif___" +   fecha.Replace("/","")+"_______" + Guid.NewGuid()+".sql"))
                        {


                            foreach (string ca in ScriptConciliacion)
                            {

                                if (ca != "Correcto")
                                {

                                    sw.WriteLine(ca);
                                    sw.WriteLine("\n");
                                }
                              
                            }

                            ;
                        }

                    }

                    catch (Exception Ex)
                    {
                        Console.WriteLine(Ex.ToString());
                    }
                }
    }
}