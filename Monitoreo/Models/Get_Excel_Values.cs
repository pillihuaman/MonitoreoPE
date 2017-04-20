
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using Excel = Microsoft.Office.Interop.Excel;

using System.IO;


namespace Monitoreo.Models
{
    public class Get_Excel_Values
    {



        public static Queue<string> MonitoreoGetFileValues(Queue<string> FileName, string FilePath)
        {


            Queue<string> Files_Monitoreo = new Queue<string>(FileName);
            Queue<string> Files_Monitoreo_Final = new Queue<string>();
            Queue<string> CIPS_DE_BCP = new Queue<string>();
            Queue<string> CIPS_DE_BBVA = new Queue<string>();
            Queue<string> CIPS_DE_SKB = new Queue<string>();
            Queue<string> CIPS_DE_IBK = new Queue<string>();

            //constantes
            //            CodigoBanco.Enqueue("04");
            //            CodigoBanco.Enqueue("03");
            //            CodigoBanco.Enqueue("02");
            //            CodigoBanco.Enqueue("05");
            //           string CadenaScript="use  BDPagoEfectivoReplicaCore"+
            //"Declare @Fecha date, @B1 char(2),@B2 char(2),@B3 char(2),@B4 char(2),@B5 char(2);"+
            //"Set @Fecha=getdate()"+
            //"select	@B1='02',"+
            //"		@b5='dd'"+
            //"DECLARE @TABLA TABLE"+
            //"(	IdOrdenPago			INT,"+
            //"	Banco				INT"+
            //")" +
            //"INSERT INTO @TABLA (IdOrdenPago,Banco) VALUES ";

            ///////////////////////////
            try
            {
                foreach (string Name in Files_Monitoreo)
                {
                    Queue<string> Listas_CIPS_Monitorieo = new Queue<string>();


                    Listas_CIPS_Monitorieo = cl_HelpMethod.GetTableMonitoreoFile(Name, FilePath);
                    foreach (string MoniCIps in Listas_CIPS_Monitorieo)
                    {
                        string NewNameFileBanco = Name.Replace(".xls", "");

                        Files_Monitoreo_Final.Enqueue(MoniCIps + NewNameFileBanco);
                    }
                }


                foreach (string cips in Files_Monitoreo_Final)
                {
                    string filtro = cips;//string that contains cips
                    Regex res = new Regex(@"\d+");

                    if (filtro.Contains("BBVA_") || filtro.Contains("bbva_") || filtro.Contains("bb") || filtro.Contains("BB"))
                    {

                        Match matt = res.Match(filtro);
                        if (matt.Success)
                        {


                            CIPS_DE_BBVA.Enqueue("(" + matt.Value.ToString() + "," + "'03'),");

                        }

                    }
                    else if (filtro.Contains("BCP_") || filtro.Contains("bcp_") || filtro.Contains("bc") || filtro.Contains("BC"))
                    {
                        Match matt = res.Match(filtro);
                        if (matt.Success)
                        {



                            CIPS_DE_BCP.Enqueue("(" + matt.Value.ToString() + "," + "'02'),");

                        }
                    }
                    else if (filtro.Contains("IBK") || filtro.Contains("ibk") || filtro.Contains("ib") || filtro.Contains("IB"))
                    {
                        Match matt = res.Match(filtro);
                        if (matt.Success)
                        {


                            CIPS_DE_IBK.Enqueue("(" + matt.Value.ToString() + "," + "'04'),");

                        }

                    }
                    else if (filtro.Contains("SBK") || filtro.Contains("sbk") || filtro.Contains("sk") || filtro.Contains("SK"))
                    {

                        Match matt = res.Match(filtro);
                        if (matt.Success)
                        {


                            CIPS_DE_SKB.Enqueue("(" + matt.Value.ToString() + "," + "'05'),");

                        }
                    }

                    else
                    {
                        string message = "Banco Desconocido";

                    }

                }

                //Creaccion del Thhea Y mostras informacion
                //metodo para crear Archivo de monitore
                if (CIPS_DE_BCP.Count > 0) { Get_Excel_Values.Create_Script_Monitoreo_BCP(CIPS_DE_BCP, FilePath); }
                if (CIPS_DE_BBVA.Count > 0) { Get_Excel_Values.Create_Script_Monitoreo_BBVA(CIPS_DE_BBVA, FilePath); }
                if (CIPS_DE_IBK.Count > 0) { Get_Excel_Values.Create_Script_Monitoreo_IBK(CIPS_DE_IBK, FilePath); }
                if (CIPS_DE_SKB.Count > 0) { Get_Excel_Values.Create_Script_Monitoreo_SKB(CIPS_DE_SKB, FilePath); }





            }
            catch (NotFiniteNumberException ex)
            {
                throw ex;
            }




            return Files_Monitoreo_Final;



        }
        public static Queue<string> Monitore_Source_En_Bruto(Queue<string> FileName, string FilePath)
        {
            Queue<string> Listas_CIPS_Monitorieo = new Queue<string>();
            Queue<string> Listas_CIPS_Monitorieo1 = new Queue<string>();
            try
            {
                foreach (string Name in FileName)
                {
                    



                    Listas_CIPS_Monitorieo = cl_HelpMethod.GetTable_TotalMonitoreoFile(Name, FilePath);
                    foreach (string Name1 in Listas_CIPS_Monitorieo)
                    {
                        Listas_CIPS_Monitorieo1.Enqueue(Name1);

                    }

                }

            }
            catch (NotFiniteNumberException ex)
            {
                throw ex;
            }

            return Listas_CIPS_Monitorieo1;
        }
        public static Queue<string> Get_Preconciliacion(Queue<string> FileName, string FilePath)
        {
            try
            {
                List<string> Nuevo = new List<string>(FileName);
                Queue<string> get_Cip_Preconcil__ = new Queue<string>();
                //Queue<string> get_Cip_Preconcil__ParaEvaluacion = new Queue<string>();

                //Dictionary<int, string> get_Cip_Preconciliacion_Pre = new Dictionary<int, string>();
                //Queue<string> get_Cip_Preconciliacion_Pre_Semi = new Queue<string>();
                //Queue<string> ColaCipsEndFilter = new Queue<string>();
                Queue<string> QueeStatdisticas = new Queue<string>();
                Queue<string> ArchivosAnalizar = new Queue<string>();
                Queue<string> get_Cip_Preconciliacion = new Queue<string>();
                Queue<string> str = new Queue<string>();
                string fileName = string.Format(@"" + FilePath + "{0}.sql", Guid.NewGuid());
                string CodigoBuscar = "00000";

                int ni = 0;
                int CantidadDeArchivos = 0;


                foreach (string Cadena in Nuevo)
                {
                    int n = 0;
                    string path = string.Empty;

                    path = @"" + FilePath + Cadena + "";

                    //////////////////////////

                    get_Cip_Preconciliacion = cl_HelpMethod.get_Cip_Preconciliacion_Fisrt_Step(path, n);
                    get_Cip_Preconcil__ = cl_HelpMethod.Metodo_Second_Step(get_Cip_Preconciliacion, CodigoBuscar);



                    if ((get_Cip_Preconciliacion.Count - get_Cip_Preconcil__.Count) > 2)
                    {
                        CodigoBuscar = "00";
                        n++;
                        get_Cip_Preconciliacion.Clear();
                        get_Cip_Preconcil__.Clear();
                        get_Cip_Preconciliacion = cl_HelpMethod.get_Cip_Preconciliacion_Fisrt_Step(path, n);
                        get_Cip_Preconcil__ = cl_HelpMethod.Metodo_Second_Step(get_Cip_Preconciliacion, CodigoBuscar);
                        ArchivosAnalizar.Enqueue(Cadena);
                        n = 0;
                        CantidadDeArchivos++;

                        if ((get_Cip_Preconciliacion.Count - get_Cip_Preconcil__.Count) > 4)
                        {
                            QueeStatdisticas.Enqueue("Error_________" + "Cantidad de Archivos:  [" + CantidadDeArchivos + "]" + "    Nombre del archhivo...." + Cadena + "   Cantidad de Lineas  [" + get_Cip_Preconciliacion.Count + "]" + "  Cantidad de  Lineas Procesadas con exito [" + get_Cip_Preconcil__.Count + "] Total [" + str.Count + "]");

                        }
                        else
                        {


                            QueeStatdisticas.Enqueue("Cantidad de Archivos:  [" + CantidadDeArchivos + "]" + "    Nombre del archhivo...." + Cadena + "   Cantidad de Lineas  [" + get_Cip_Preconciliacion.Count + "]" + "  Cantidad de  Lineas Procesadas con exito [" + get_Cip_Preconcil__.Count + "] Total [" + str.Count + "]");
                        }





                    }
                    else
                    {
                        CantidadDeArchivos++;

                        if ((get_Cip_Preconciliacion.Count - get_Cip_Preconcil__.Count) > 4)
                        {
                            QueeStatdisticas.Enqueue("Error_________" + "Cantidad de Archivos:  [" + CantidadDeArchivos + "]" + "    Nombre del archhivo...." + Cadena + "   Cantidad de Lineas  [" + get_Cip_Preconciliacion.Count + "]" + "  Cantidad de  Lineas Procesadas con exito [" + get_Cip_Preconcil__.Count + "] Total [" + str.Count + "]");

                        }
                        else
                        {


                            QueeStatdisticas.Enqueue("Cantidad de Archivos:  [" + CantidadDeArchivos + "]" + "    Nombre del archhivo...." + Cadena + "   Cantidad de Lineas  [" + get_Cip_Preconciliacion.Count + "]" + "  Cantidad de  Lineas Procesadas con exito [" + get_Cip_Preconcil__.Count + "] Total [" + str.Count + "]");
                        }



                    }

                    foreach (String s in get_Cip_Preconcil__)
                    {
                        str.Enqueue(s + ",");

                    }

                    //get_Cip_Preconcil__.Clear();
                    //get_Cip_Preconciliacion_Pre.Clear();
                    //chart1.Clear();
                    get_Cip_Preconciliacion.Clear();



                }
                //////////////////////////////////////
                String CadenaFinal = string.Empty;
                foreach (String s in str)
                {
                    CadenaFinal = CadenaFinal + s;

                }

                //ReadTxtFile.Leer_Txt_CIP(FilePath);
                using (StreamWriter sw = File.CreateText(fileName))
                {
                    string Cadena_Scrip = ReadTxtFile.Leer_Txt_CIP(FilePath);

                    sw.WriteLine(Cadena_Scrip.Substring(0, Cadena_Scrip.Length - 1));
                    sw.WriteLine("(");
                    sw.WriteLine(CadenaFinal.Substring(0, CadenaFinal.Length - 1) + ")");
                    sw.Close();
                }




                return QueeStatdisticas;
            }



            catch (NotFiniteNumberException ex)
            {
                throw ex;
            }



        }
        public static Queue<string> get_Values_Proveedores(int Numero, string Banco)
        {
            Queue<string> Listar_Excel = new Queue<string>();
            Queue<string> Listar_Fecha_NumeroOperacions = new Queue<string>();
            Queue<string> CIPS_Final = new Queue<string>();
            List<CIP> Listar_CIP = new List<CIP>();
            List<string> Copias_Cip = new List<String>();
            CIP OBJ = new CIP();



            try
            {






                System.Data.OleDb.OleDbConnection MyConnection;
                System.Data.DataTable DtSet;
                System.Data.OleDb.OleDbDataAdapter MyCommand;
                MyConnection = new System.Data.OleDb.OleDbConnection
                    ("provider=Microsoft.ACE.OLEDB.12.0;Data Source='F:\\ArchivosPara Evaluar\\RegistroDeProveedores\\EstadoBancarios\\Fuentebanco\\FuenteGeneral\\" + Banco + ".xlsx';Extended Properties=Excel 12.0;");
                MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [Sheet0$]", MyConnection);
                MyCommand.TableMappings.Add("Table", "TestTable");
                DtSet = new System.Data.DataTable();
                //--DtSet.Tables["F3"].Rows[0].Delete();


                MyCommand.Fill(DtSet);
                string CIPs = string.Empty;
                string IDtransferenciaEmpresas = string.Empty;
                int IdTranferencia = 10000;

                foreach (DataRow row in DtSet.Rows)
                {


                    if (!row.IsNull("CIP"))
                    {
                        if (Numero == 1)
                        {
                            if (row["CIP"].ToString().Length == 5)
                            {
                                DateTime Fecha;

                                if (row["Fecha"].ToString() != string.Empty)
                                {

                                    Fecha = DateTime.Parse(row["Fecha"].ToString());
                                }
                                else
                                {

                                    Fecha = DateTime.Now;

                                }


                                IDtransferenciaEmpresas = IdTranferencia + "-" + Fecha.ToString("yyyy-MM-dd") + "-" + row["CodigoOperacion"].ToString().Trim();
                                Listar_Fecha_NumeroOperacions.Enqueue(IDtransferenciaEmpresas);
                                IdTranferencia++;
                            }
                            CIPS_Final = new Queue<string>(Listar_Fecha_NumeroOperacions);


                        }
                        else
                        {
                            if (row["CIP"].ToString().Length == 5)
                            {
                                IDtransferenciaEmpresas = IdTranferencia.ToString();
                                Listar_Fecha_NumeroOperacions.Enqueue(IDtransferenciaEmpresas);
                                IdTranferencia++;

                            }
                            CIPs = row["CIP"].ToString();

                            Listar_Excel.Enqueue(CIPs + '-' + IDtransferenciaEmpresas);

                            CIPS_Final = new Queue<string>(Listar_Excel);

                        }


                    }







                }





                MyConnection.Close();

            }
            catch (NotFiniteNumberException ex)
            {
                throw ex;
            }

            return CIPS_Final;

        }


        public static void Create_Script_Monitoreo_BCP(Queue<string> CIPS_BCP, string FilePath)
        {
            try
            {
                //Creacion Scritp
                Queue<string> CodigoBanco = new Queue<string>();
                string Bcp = string.Empty;
                string CodigoBancos = "02";

                CodigoBanco = ReadTxtFile.Leer_SctiptMonitore(FilePath);//Cadena del Scrip del monitoreo
                string fileName = string.Format(FilePath + "BCP {0}.sql", Guid.NewGuid());


                using (StreamWriter sw = File.CreateText(fileName))
                {
                    string cadena = string.Empty;
                    foreach (string codi in CodigoBanco)
                    {
                        if (codi.Contains("@B1='02'"))
                        {
                            cadena = codi.Substring(0, 5) + CodigoBancos + "'";
                            sw.WriteLine(cadena + "\n");
                        }
                        else if (codi.Contains("VALUES"))
                        {
                            sw.WriteLine(codi + "\n");
                            int n = 1;
                            foreach (string CipsBCP in CIPS_BCP)
                            {


                                if (n == CIPS_BCP.Count)
                                {
                                    sw.WriteLine(CipsBCP.ToString().Substring(0, CipsBCP.Length - 1) + "\n");
                                }
                                else
                                {

                                    sw.WriteLine(CipsBCP + "\n");
                                }
                                n++;
                            }
                        }
                        else
                        {
                            sw.WriteLine(codi + "\n");


                        }
                    }
                }
            }

            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static void 
            Create_Script_Monitoreo_BBVA(Queue<string> CIPS_BBVA, string FilePath)
        {
            try
            {
                //Creacion Scritp
                Queue<string> CodigoBanco = new Queue<string>();
                string Bcp = string.Empty;
                string CodigoBancos = "03";

                CodigoBanco = ReadTxtFile.Leer_SctiptMonitore(FilePath);//Cadena del Scrip del monitoreo
                string fileName = string.Format(FilePath + "BBVA {0}.sql", Guid.NewGuid());


                using (StreamWriter sw = File.CreateText(fileName))
                {
                    string cadena = string.Empty;
                    foreach (string codi in CodigoBanco)
                    {
                        if (codi.Contains("@B1='02'"))
                        {
                            cadena = codi.Substring(0, 5) + CodigoBancos + "'";
                            sw.WriteLine(cadena + "\n");
                        }
                        else if (codi.Contains("VALUES"))
                        {
                            sw.WriteLine(codi + "\n");
                            int n = 1;
                            foreach (string CipsBCP in CIPS_BBVA)
                            {


                                if (n == CIPS_BBVA.Count)
                                {
                                    sw.WriteLine(CipsBCP.ToString().Substring(0, CipsBCP.Length - 1) + "\n");
                                }
                                else
                                {

                                    sw.WriteLine(CipsBCP + "\n");
                                }
                                n++;
                            }
                        }
                        else
                        {
                            sw.WriteLine(codi + "\n");


                        }
                    }
                }
            }

            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static void Create_Script_Monitoreo_IBK(Queue<string> CIPS_IBK, string FilePath)
        {
            try
            {
                //Creacion Scritp
                Queue<string> CodigoBanco = new Queue<string>();
                string Bcp = string.Empty;
                string CodigoBancos = "04";

                CodigoBanco = ReadTxtFile.Leer_SctiptMonitore(FilePath);//Cadena del Scrip del monitoreo
                string fileName = string.Format(FilePath + "IBK {0}.sql", Guid.NewGuid());


                using (StreamWriter sw = File.CreateText(fileName))
                {
                    string cadena = string.Empty;
                    foreach (string codi in CodigoBanco)
                    {
                        if (codi.Contains("@B1='02'"))
                        {
                            cadena = codi.Substring(0, 5) + CodigoBancos + "'";
                            sw.WriteLine(cadena + "\n");
                        }
                        else if (codi.Contains("VALUES"))
                        {
                            sw.WriteLine(codi + "\n");
                            int n = 1;
                            foreach (string CipsBCP in CIPS_IBK)
                            {


                                if (n == CIPS_IBK.Count)
                                {
                                    sw.WriteLine(CipsBCP.ToString().Substring(0, CipsBCP.Length - 1) + "\n");
                                }
                                else
                                {

                                    sw.WriteLine(CipsBCP + "\n");
                                }
                                n++;
                            }
                        }
                        else
                        {
                            sw.WriteLine(codi + "\n");


                        }
                    }
                }
            }

            catch (Exception ex)
            {

                throw ex;
            }

        }
        public static void Create_Script_Monitoreo_SKB(Queue<string> CIPS_SKB, string FilePath)
        {
            try
            {
                //Creacion Scritp
                Queue<string> CodigoBanco = new Queue<string>();
                string Bcp = string.Empty;
                string CodigoBancos = "05";

                CodigoBanco = ReadTxtFile.Leer_SctiptMonitore(FilePath);//Cadena del Scrip del monitoreo
                string fileName = string.Format(FilePath + "SKB {0}.sql", Guid.NewGuid());


                using (StreamWriter sw = File.CreateText(fileName))
                {
                    string cadena = string.Empty;
                    foreach (string codi in CodigoBanco)
                    {
                        if (codi.Contains("@B1='02'"))
                        {
                            cadena = codi.Substring(0, 5) + CodigoBancos + "'";
                            sw.WriteLine(cadena + "\n");
                        }
                        else if (codi.Contains("VALUES"))
                        {
                            sw.WriteLine(codi + "\n");
                            int n = 1;
                            foreach (string CipsBCP in CIPS_SKB)
                            {


                                if (n == CIPS_SKB.Count)
                                {
                                    sw.WriteLine(CipsBCP.ToString().Substring(0, CipsBCP.Length - 1) + "\n");
                                }
                                else
                                {

                                    sw.WriteLine(CipsBCP + "\n");
                                }
                                n++;
                            }
                        }
                        else
                        {
                            sw.WriteLine(codi + "\n");


                        }
                    }
                }
            }

            catch (Exception ex)
            {

                throw ex;
            }
              
        }
        public static Queue<string> Show_Extorno_CIP(Queue<string> get_Cip_Preconcil__)
        {

            Queue<string> get_Cip_Preconcil__1 = new Queue<string>(get_Cip_Preconcil__);
            return get_Cip_Preconcil__1;
        }
    }
}