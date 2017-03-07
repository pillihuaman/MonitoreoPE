using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;

namespace Monitoreo.Models
{
    public class GenerarTramaRipley
    {
        public static Queue<Monitoreo.DataBussiness.Ripley> GenerarTrama(string RutaArchivo, string NombreArchivo, string FechaProceso)
        {
            string mensaje = string.Empty;
            Queue<Monitoreo.DataBussiness.Ripley> TramaRipley = new Queue<Monitoreo.DataBussiness.Ripley>();
            Queue<string> ResultadoTrama = new Queue<string>();
            Monitoreo.DataBussiness.Ripley  ObjRipley;
            try
            {

                SqlDataReader dr = null;
                SqlConnection cn = null;
                //SqlCommand cmd = null;
                Stack<string> Lista_cliente = new Stack<string>();
                String Conexio_String = ConfigurationManager.ConnectionStrings["cnBD"].ConnectionString;
                //string Filename = Monitoreo.Models.ConvertoXLSFormat.ConvertFileToXLSXFormat(RutaArchivo, NombreArchivo);
                //ObjRipley = new DataBussiness.Ripley();
                //TramaRipley = GetCipsRipley(RutaArchivo, Filename);
                string NombreTramaTXT = string.Empty;


                using (SqlConnection con = new SqlConnection(Conexio_String))
                {
                    con.Open();
                    string Nombre = string.Empty;
       
                  if (FechaProceso == string.Empty)
                  {
                      DateTime Now = DateTime.Today;
                      DateTime yesteday = Now.AddDays(-1);

                      FechaProceso = yesteday.ToString();
                     
                  }
                  else
                  {
                     
                  }

                    using (SqlCommand cmd = new SqlCommand("sp_GENERAR_TRAMA_RIPLEY", con))
                    {

                        cmd.CommandType = CommandType.StoredProcedure;
                        string cips = "";

                        foreach (Monitoreo.DataBussiness.Ripley ob in TramaRipley)
                        {
                            cips = ob._Cip.ToString();
                            break;
                        }
                        //cmd.Parameters.AddWithValue("@CadenaCips", cips.Substring(0, cips.Length - 1));
                        cmd.Parameters.AddWithValue("@FechaDeProceso",  DateTime.Parse(FechaProceso));



                        dr = cmd.ExecuteReader();
                        decimal SumaMontoRipley = 0;
                        decimal SumaComision = 0;
                        decimal TotalaTransferir = 0;
                        while (dr.Read())

                        {   ObjRipley= new DataBussiness.Ripley();
                            ObjRipley._Trama=dr["trama"].ToString();
                            ObjRipley._NombreArchivo = dr["NombreArchivo"].ToString();
                            //ObjRipley._monto_Ripley = dr["monto"].ToString();
                            SumaMontoRipley = SumaMontoRipley + Decimal.Parse( dr["monto"].ToString().Trim());
                            SumaComision = SumaComision + Decimal.Parse(dr["comision"].ToString().Trim());
                            //ObjRipley._Comision = dr["comision"].ToString();

                            TramaRipley.Enqueue(ObjRipley);
                            NombreTramaTXT = dr["NombreArchivo"].ToString();

                        }
                        TotalaTransferir = SumaMontoRipley - SumaComision;
                        ObjRipley = new DataBussiness.Ripley();
                        ObjRipley._monto_Ripley = SumaMontoRipley.ToString();
                        ObjRipley._Comision = SumaComision.ToString();
                        ObjRipley._Total_Transferir = TotalaTransferir.ToString();
                        TramaRipley.Enqueue(ObjRipley);

                    }
                    ResultadoTrama.Enqueue(NombreTramaTXT);

                    dr.Close();

                }

                //Creamos Archivo txt
                using (StreamWriter sw = File.CreateText(RutaArchivo + NombreTramaTXT+ ".txt"))
                {

                    foreach (Monitoreo.DataBussiness.Ripley s in TramaRipley)
                    {
                        if (s._Trama != null)
                        {
                            sw.WriteLine(s._Trama);
                            ResultadoTrama.Enqueue(s._Trama);
                        }

                    }
                    sw.Close();
                   

                }

                //Enviar Mail
                Monitoreo.DataBussiness.Mail ObjMail = new Monitoreo.DataBussiness.Mail();

                ObjMail._NetworkCredencialUser = ConfigurationManager.AppSettings["NetworkCredencialUser"];
                ObjMail._NetworkCredencialPass = ConfigurationManager.AppSettings["NetworkCredencialPass"];
                ObjMail._CorreoGmailOrigen = "pillihuamanhz@gmail.com";
                ObjMail._NombreGmailOrigen = "Trama Ripley";
                ObjMail._ListaCorreos = new Queue<string>();
                ObjMail._ListaCorreos.Enqueue("zarmir.pillihuaman@orbis.com.pe");
                ObjMail._ListaCorreos.Enqueue("pillihuamanhz@gmail.com");
                ObjMail._ListaCorreos.Enqueue("universo_infinito88@hotmail.com");
                ObjMail._Subject = "Trama Ripley    " + NombreTramaTXT + ".txt";
                ObjMail._BodyHtml= "<html><body><h1>"+"Trama Ripley   "+  NombreTramaTXT + ".txt"+"  <br>Saludos Coordiales "+"</h1></body></html>";
                ObjMail.File_Path_ToAtacch = RutaArchivo + NombreTramaTXT + ".txt";
                ObjMail._DisponibleHTMLBODy = true;
                ObjMail._Puerto = ConfigurationManager.AppSettings["Puerto"];
              ObjRipley._Message=  Models.Mail.MailSend.SenMail(ObjMail);

            }

            catch (Exception ex)
            {
                //throw ex;
            Monitoreo.DataBussiness.Ripley ri= new DataBussiness.Ripley();
                //mensaje = "Error generado" + ex.ToString();
                ri._Message="Error generado" + ex.ToString();
                TramaRipley.Enqueue(ri);

            }
            return TramaRipley;
        }



        public static Queue<Monitoreo.DataBussiness.Ripley> GetCipsRipley(string rutaFile, string NombreArchivo)
        {

            string Message = "";
            Monitoreo.DataBussiness.Ripley objtRipley;
                //= new  Monitoreo.DataBussiness.Ripley();
            Queue<Monitoreo.DataBussiness.Ripley> QueeRippley = new Queue<Monitoreo.DataBussiness.Ripley>();
           Queue<string> CollectionRippley = new Queue<string>();
           Queue<string> CollectionRippleyFinal = new Queue<string>();
            string CadenaCips = string.Empty;
            try
            {

                System.Data.OleDb.OleDbConnection MyConnection;
                System.Data.DataTable TBL = new System.Data.DataTable();
                System.Data.OleDb.OleDbDataAdapter MyCommand;
                MyConnection = new System.Data.OleDb.OleDbConnection
                 ("provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + rutaFile + NombreArchivo.ToString() + "';Extended Properties=Excel 8.0;");

                string GetExcelNameSheet = string.Empty;
                GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                MyCommand.TableMappings.Add("Table", "TestTable");
                TBL = new System.Data.DataTable();
                MyCommand.Fill(TBL);

                foreach (DataRow row in TBL.Rows)
                {


                    if (!row.IsNull("F4"))
                    {
                        if (row["F4"].ToString().Length >=7)
                        {
                            CollectionRippley.Enqueue(row["F4"].ToString().Substring(row["F4"].ToString().Length - 7, 7));
                        }

                    }
                }

                foreach (string s in CollectionRippley)
                {

                   
                    CadenaCips = CadenaCips + s + ",";
                }
                objtRipley = new DataBussiness.Ripley();
                //En el primer cola siempre llena el cip
                objtRipley._Cip = CadenaCips;
                QueeRippley.Enqueue(objtRipley);

                int contador = 0;
                foreach (DataRow row in TBL.Rows)
                { 
                    if (!row.IsNull("F21"))
                    {
                        objtRipley = new DataBussiness.Ripley();
                        if (contador == 0)
                        {
                           
                            objtRipley._monto_Ripley = row["F21"].ToString();
                            QueeRippley.Enqueue(objtRipley);
                        }
                        else if (contador == 1)
                        {
                            
                            objtRipley._Comision = row["F21"].ToString();
                            QueeRippley.Enqueue(objtRipley);
                        }

                        else if (contador == 2)
                        {
                          
                            objtRipley._Total_Transferir = row["F21"].ToString();
                            QueeRippley.Enqueue(objtRipley);
                        }
                        contador++;
                    }
                }




                //String[] ColumnaName = TBL.Columns.Cast<DataColumn>().Select(x => x.ColumnName).ToArray();

               
                MyConnection.Close();
            }
            catch (Exception ex)
            {

                //throw ex;
                Message = "Error el formato no cumple con los requerimientos" + ex.ToString();
               
            }

            return QueeRippley;
        }
    }
}