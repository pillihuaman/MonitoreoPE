
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using Excel = Microsoft.Office.Interop.Excel;


namespace Monitoreo.Models
{
    public class cl_HelpMethod
    {


        public static Queue<string> get_Cip_Preconciliacion_Fisrt_Step(string Path, int intento)
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


        public static Queue<string> Metodo_Second_Step(Queue<string> get_Cip_Preconciliacion, string CodigoBuscar)
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

        private static Queue<int> CalcularPromedio()
        {

          

            SqlDataReader dr = null;
            SqlConnection cn = null;
            //SqlCommand cmd = null;
            Queue<int> Lista_CIPS = new Queue<int>();
            String Conexio_String = ConfigurationManager.ConnectionStrings["cnBD"].ConnectionString;



            try
            {




                using (SqlConnection con = new SqlConnection(Conexio_String))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("sp_calcular_Cips_promedios", con))
                        {

                        

                            dr = cmd.ExecuteReader();
                          

                            while (dr.Read())
                            {
                              Lista_CIPS.Enqueue( int.Parse(dr["IDORDENPAGO"].ToString()));
                              

                            }
                        }
                        dr.Close();

                      
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }


            return Lista_CIPS;
        }
        private static int NumeroBuscar(Queue<int> Cips)
        {
            Queue<int> NuList = new Queue<int>();

            NuList.Enqueue(5);
            NuList.Enqueue(7);
            NuList.Enqueue(8);


             int FinalNumber = 0;
            foreach (int s in Cips)
            {
                NuList.Enqueue(int.Parse( s.ToString().Substring(0, s.ToString().Length - 6)));
        
            
            }
            var ListUnico = NuList.Distinct().ToArray();

            int contador = 0;
            foreach (int s in ListUnico)
            {

                foreach (int ss in NuList)
                {
                    if (s == ss)
                    {
                        contador++;
                    
                    }
                }

                if (contador >= 60)
                {

                    FinalNumber = s;
                    break;
                }
            
            
            }


            return FinalNumber;
        
        }
        public static Queue<string> GetTableMonitoreoFile(string FileName, string FilePath)
        {

            try
            {
                Queue<string> Semi = new Queue<string>();
                System.Data.DataTable TBL = new System.Data.DataTable();
                string KeyFindBookCell = string.Empty;
                string MessaError = string.Empty;
                KeyFindBookCell = FileName.Trim();
                System.Data.OleDb.OleDbConnection MyConnection;
                //System.Data.DataTable DtSet;
                System.Data.OleDb.OleDbDataAdapter MyCommand;
                MyConnection = new System.Data.OleDb.OleDbConnection
                 ("provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + FilePath + FileName.ToString() + "';Extended Properties=Excel 8.0;");

                //BBVA
                if (KeyFindBookCell.Contains("BBVA") || KeyFindBookCell.Contains("BB") || KeyFindBookCell.Contains("bbva") || KeyFindBookCell.Contains("bb"))
                {
                    //BBVA soles
                    if (KeyFindBookCell.Contains("SOLES") || KeyFindBookCell.Contains("SOL") || KeyFindBookCell.Contains("soles") || KeyFindBookCell.Contains("sol"))
                    { //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_BBVA(TBL);
                    }
                    //BBVA Dolares
                    else if (KeyFindBookCell.Contains("DOLAR") || KeyFindBookCell.Contains("DOL") || KeyFindBookCell.Contains("dolar") || KeyFindBookCell.Contains("dol"))
                    {
                        //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_BBVA(TBL);
                    }
                    //Know
                    else
                    {
                        MessaError = " There is a cell to BBVA files";
                        Semi.Enqueue(MessaError);


                    }


                }

                //////////////////////////////
                //BCP
                if (KeyFindBookCell.Contains("BCP") || KeyFindBookCell.Contains("bcp") || KeyFindBookCell.Contains("Bcp") || KeyFindBookCell.Contains("bcP"))
                {
                    //BCP soles
                    if (KeyFindBookCell.Contains("SOLES") || KeyFindBookCell.Contains("soles") || KeyFindBookCell.Contains("sol"))
                    {
                        //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_BCP(TBL);
                    }
                    //BCP Dolares
                    else if (KeyFindBookCell.Contains("DOLARES") || KeyFindBookCell.Contains("dolar") || KeyFindBookCell.Contains("dol"))
                    {

                        //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_BCP(TBL);
                    }
                    //Know
                    else
                    {

                        //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_BCP(TBL);

                        MessaError = " There is a cell to BCP1 files";
                        Semi.Enqueue(MessaError);


                    }


                }

                //////////////////////////////

                //////////////////////////////
                //IBK
                if (KeyFindBookCell.Contains("IBK") || KeyFindBookCell.Contains("IB") || KeyFindBookCell.Contains("ibk") || KeyFindBookCell.Contains("ib"))
                {
                    //IBK soles
                    if (KeyFindBookCell.Contains("IBK") || KeyFindBookCell.Contains("IB") || KeyFindBookCell.Contains("ibk"))
                    {
                        //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_IBK(TBL);
                    }

                    //Know
                    else
                    {
                        MessaError = " There is a cell to BCP1 files";
                        Semi.Enqueue(MessaError);


                    }


                }

                //////////////////////////////

                //SKB
                if (KeyFindBookCell.Contains("SBK") || KeyFindBookCell.Contains("SB") || KeyFindBookCell.Contains("sbk") || KeyFindBookCell.Contains("Sbk"))
                {
                    //BBVA soles
                    if (KeyFindBookCell.Contains("SOLES") || KeyFindBookCell.Contains("SOL") || KeyFindBookCell.Contains("soles") || KeyFindBookCell.Contains("sol"))
                    {


                        //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_SKB(TBL);
                    }
                    //BBVA Dolares
                    else if (KeyFindBookCell.Contains("DOLAR") || KeyFindBookCell.Contains("DOL") || KeyFindBookCell.Contains("dolar") || KeyFindBookCell.Contains("dol"))
                    {
                        //Queue<string> GetExcelNameSheet = new Queue<string>();
                        string GetExcelNameSheet = string.Empty;
                        GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                        MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                        MyCommand.TableMappings.Add("Table", "TestTable");
                        TBL = new System.Data.DataTable();
                        MyCommand.Fill(TBL);

                        Semi = Monitoreio_SKB(TBL);
                    }
                    //Know
                    else
                    {
                        MessaError = " There is a cell to BBVA files";
                        Semi.Enqueue(MessaError);


                    }


                }

                //////////////////////////////


                //MyConnection.Close();

                return Semi;
            }


            catch (Exception ex)
            {


                throw ex;


            }


        }
            public static Queue<string> GetTable_TotalMonitoreoFile(string FileName, string FilePath)
        { 
            Queue<string> Semi = new Queue<string>();
            try
            {

                System.Data.DataTable TBL = new System.Data.DataTable();
                string KeyFindBookCell = string.Empty;
                string MessaError = string.Empty;
                KeyFindBookCell = FileName.Trim();
                System.Data.OleDb.OleDbConnection MyConnection;
                //System.Data.DataTable DtSet;
                System.Data.OleDb.OleDbDataAdapter MyCommand;
                MyConnection = new System.Data.OleDb.OleDbConnection
                 ("provider=Microsoft.ACE.OLEDB.12.0;Data Source='" + FilePath + FileName.ToString() + "';Extended Properties=Excel 8.0;");

                string GetExcelNameSheet = string.Empty;
                GetExcelNameSheet = cl_HelpMethod.Get_Excel_Sheet_Name(MyConnection.ConnectionString.ToString());
                MyCommand = new System.Data.OleDb.OleDbDataAdapter("select * from [" + GetExcelNameSheet + "]", MyConnection);
                MyCommand.TableMappings.Add("Table", "TestTable");
                TBL = new System.Data.DataTable();
                MyCommand.Fill(TBL);
   
                String[] ColumnaName = TBL.Columns.Cast<DataColumn>().Select(x => x.ColumnName).ToArray();
                foreach (string columna in ColumnaName)
                {

                    foreach (DataRow row in TBL.Rows)
                    {
                        //if (!row.IsNull(columna))
                        //{




             

                        Semi.Enqueue(row[columna].ToString());                         
                    //    }
                    //}



                  

                }


            }}

            catch (Exception ex)
            {
                throw ex;

            }
            
        return Semi;
        
            }
      
     public  static Queue<string> Monitoreio_BBVA(System.Data.DataTable DtSet)
        {


            Queue<int> Numero = new Queue<int>();
            Queue<string> Listar_CIP = new Queue<string>();
            Queue<string> Copias_Cip = new Queue<String>();
            List<CIP> UsuarioOperacion = new List<CIP>();
            Queue<string> Colafin = new Queue<string>();
            Queue<string> SemiFinal = new Queue<string>();
            Queue<string> Semi = new Queue<string>();
            CIP OBJ;

            foreach (DataRow row in DtSet.Rows)
            {
                if (!row.IsNull("F5"))
                {

                    OBJ = new CIP();
                    OBJ.CIP1 = row["F5"].ToString().Trim();
                    UsuarioOperacion.Add(OBJ);
                }
            }

            foreach (CIP lista in UsuarioOperacion)
            {
                string cadena = string.Empty;
                cadena = lista.CIP1.ToString();
                Regex re = new Regex(@"^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$");
                Match mat = re.Match(cadena);
                if (mat.Success)
                {
                    string matFirst = string.Empty;
                    matFirst = mat.Value.ToString();

                    if (matFirst.Contains("."))
                    {
                        matFirst = Decimal.Parse(matFirst, System.Globalization.NumberStyles.Any).ToString();
                    }

                    Listar_CIP.Enqueue(matFirst);

                }
                else
                {

                    //Regex re = new Regex(@"^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$");
                    Regex res = new Regex(@"\d+");
                    Match matt = res.Match(cadena);
                    if (matt.Success)
                    {
                        string matSSecond = string.Empty;
                        matSSecond = matt.Value.ToString();

                        Listar_CIP.Enqueue(matSSecond);

                    }


                }
            }
            var listRemoveNull = Listar_CIP.Where(x => x != "").ToArray();
            Colafin = new Queue<string>(listRemoveNull);

            foreach (string CqueNewFilter in Colafin)
            {
                string NewFilter = string.Empty;
                NewFilter = CqueNewFilter;
                if (NewFilter.Contains("00000000000000"))
                {


                    SemiFinal.Enqueue(NewFilter.Replace("00000000000000", ""));
                }
                else if (NewFilter.Contains("0000000") || NewFilter.Contains("0000000"))
                {

                    SemiFinal.Enqueue(NewFilter.Replace("0000000", ""));
                }
                else
                {
                    SemiFinal.Enqueue(NewFilter);

                }


            }

            var SemifiMasDe7 = SemiFinal.Where(t => t.Length >= 7).ToArray();
            //var Semifal7 = SemiFinal.Where(t => t.Length == 7).ToArray();


            foreach (string ss in SemifiMasDe7)
            {
                string Conten = string.Empty;
                Conten = ss;
                if (Conten.Length == 7)
                {

                    Semi.Enqueue(Conten.ToString());
                }
                else if (Conten.Length >= 7)
                {

                    Semi.Enqueue(Conten.Substring(0, 7).ToString());
                }



            }

            return Semi;
        }
        public static Queue<string> Monitoreio_BCP(System.Data.DataTable DtSet)
        {


            Queue<int> Numero = new Queue<int>();
            Queue<string> Listar_CIP = new Queue<string>();
            Queue<string> Copias_Cip = new Queue<String>();
            List<CIP> UsuarioOperacion = new List<CIP>();
            Queue<string> Colafin = new Queue<string>();
            Queue<string> SemiFinal = new Queue<string>();
            Queue<string> Semi = new Queue<string>();
            Queue<string> CodigoUsuario = new Queue<string>();
            Queue<string> Monto = new Queue<string>();
            Queue<string> MontoCodigoUsarioCIPS = new Queue<string>();
            Queue<string> Extorno = new Queue<string>();
            Queue<string> AnalisisExtonroExtorno = new Queue<string>();
            CIP OBJ;

            String[] ColumnaName = DtSet.Columns.Cast<DataColumn>().Select(x => x.ColumnName).ToArray();
            string CadenaNameColumna = string.Empty;
            string CadenaNameMonto = string.Empty;
            string CadenaNameCodigoUsuario = string.Empty;
            foreach (string ColumanName in ColumnaName)
            {
                if (ColumanName.Contains("F3")) { CadenaNameColumna = ColumanName; }
                else if (ColumanName.Contains("F4")) { CadenaNameMonto = ColumanName; }
                else if (ColumanName.Contains("F7")) { CadenaNameCodigoUsuario = ColumanName; }
                else if (ColumanName.Contains("Monto")) { CadenaNameMonto = ColumanName; }
                else if (ColumanName.Contains("Usuario")) { CadenaNameCodigoUsuario = ColumanName; }
                else if (ColumanName.Contains("Descripción operación")) { CadenaNameColumna = ColumanName; }
     

            }
            foreach (DataRow row in DtSet.Rows)
            {
                if (!row.IsNull(CadenaNameColumna))
                {
                    string Montos = string.Empty;
                    string Codigousuario = string.Empty;

                    OBJ = new CIP();
                    OBJ.CIP1 = row[CadenaNameColumna].ToString().Trim();
                    Montos = row[CadenaNameMonto].ToString().Trim();
                    Codigousuario = row[CadenaNameCodigoUsuario].ToString().Trim();
                    if (OBJ.CIP1.ToString().Contains("EXTOR"))
                    {
                        Extorno.Enqueue(OBJ.CIP1.ToString() + "////" + Montos + "@@@" + Codigousuario);
                        UsuarioOperacion.Add(OBJ);
                        Monto.Enqueue(Montos);
                        CodigoUsuario.Enqueue(Codigousuario);

                    }
                    else
                    {
                        UsuarioOperacion.Add(OBJ);
                        Monto.Enqueue(Montos);
                        //CodigoUsuario.Enqueue(Codigousuario);
                        MontoCodigoUsarioCIPS.Enqueue(OBJ.CIP1 + "////////" + Montos + "@@@@@@" + Codigousuario);

                    }

                }
            }

            foreach (CIP lista in UsuarioOperacion)
            {
                string cadena = string.Empty;
                cadena = lista.CIP1.ToString();
                Regex re = new Regex(@"^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$");
                Match mat = re.Match(cadena);
                if (mat.Success)
                {
                    string matFirst = string.Empty;
                    matFirst = mat.Value.ToString();

                    if (matFirst.Contains("."))
                    {
                        matFirst = Decimal.Parse(matFirst, System.Globalization.NumberStyles.Any).ToString();
                    }

                    Listar_CIP.Enqueue(matFirst);

                }
                else
                {

                    //Regex re = new Regex(@"^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$");
                    Regex res = new Regex(@"\d+");
                    Match matt = res.Match(cadena);
                    if (matt.Success)
                    {
                        string matSSecond = string.Empty;
                        matSSecond = matt.Value.ToString();

                        Listar_CIP.Enqueue(matSSecond);

                    }


                }
            }
            var listRemoveNull = Listar_CIP.Where(x => x != "").ToArray();
            Colafin = new Queue<string>(listRemoveNull);

            foreach (string CqueNewFilter in Colafin)
            {
                string NewFilter = string.Empty;
                NewFilter = CqueNewFilter;
                if (NewFilter.Contains("00000000000000"))
                {


                    SemiFinal.Enqueue(NewFilter.Replace("00000000000000", ""));
                }
                else if (NewFilter.Contains("0000000") || NewFilter.Contains("0000000"))
                {

                    SemiFinal.Enqueue(NewFilter.Replace("0000000", ""));
                }

                else if (NewFilter.Contains("000") || NewFilter.Contains("0000000"))
                {

                    SemiFinal.Enqueue(NewFilter.Replace("000", ""));
                }
                else
                {
                    SemiFinal.Enqueue(NewFilter);

                }


            }

            var SemifiMasDe7 = SemiFinal.Where(t => t.Length >= 7).ToArray();
            //var Semifal7 = SemiFinal.Where(t => t.Length == 7).ToArray();


            foreach (string ss in SemifiMasDe7)
            {
                string Conten = string.Empty;
                Conten = ss;
                if (Conten.Length == 7)
                {

                    Semi.Enqueue(Conten.ToString());
                }
                else if (Conten.Length >= 7)
                {

                    Semi.Enqueue(Conten.Substring(0, 7).ToString());
                }



            }
            if (Extorno.Count > 0) {
                foreach (string codigosuario in CodigoUsuario)
                {
                    foreach (string TresValue in MontoCodigoUsarioCIPS) 
                    {
                        if (TresValue.Contains(codigosuario))
                        {
                            AnalisisExtonroExtorno.Enqueue(TresValue);
                        
                        }
                    
                    
                    }
                
                }

                foreach (string extornoCadena in Extorno) 
                {
                    Semi.Enqueue(extornoCadena+"       extorno");
                }

                foreach (string extornoCadena in AnalisisExtonroExtorno)
                {
                    Semi.Enqueue(extornoCadena);
                }
            }
            

            return Semi;
        }

        public static Queue<string> Monitoreio_IBK(System.Data.DataTable DtSet)
        {


            Queue<int> Numero = new Queue<int>();
            Queue<string> Listar_CIP = new Queue<string>();
            Queue<string> Copias_Cip = new Queue<String>();
            List<CIP> UsuarioOperacion = new List<CIP>();
            Queue<string> Colafin = new Queue<string>();
            Queue<string> SemiFinal = new Queue<string>();
            Queue<string> Semi = new Queue<string>();
            CIP OBJ;

            foreach (DataRow row in DtSet.Rows)
            {
                if (!row.IsNull("F6"))
                {

                    OBJ = new CIP();
                    OBJ.CIP1 = row["F6"].ToString().Trim();
                    UsuarioOperacion.Add(OBJ);
                }
            }

            foreach (CIP lista in UsuarioOperacion)
            {
                string cadena = string.Empty;
                cadena = lista.CIP1.ToString();

                //Regex re = new Regex(@"^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$");
                Regex res = new Regex(@"\d+");
                Match matt = res.Match(cadena);
                if (matt.Success)
                {
                    string matSSecond = string.Empty;
                    matSSecond = matt.Value.ToString();

                    Listar_CIP.Enqueue(matSSecond);

                }



            }
            var listRemoveNull = Listar_CIP.Where(x => x != "").ToArray();
            Colafin = new Queue<string>(listRemoveNull);

            foreach (string CqueNewFilter in Colafin)
            {
                string NewFilter = string.Empty;
                NewFilter = CqueNewFilter;
                if (NewFilter.Contains("0000000"))
                {


                    SemiFinal.Enqueue(NewFilter.Replace("0000000", ""));
                }
                //else if (NewFilter.Contains("0000000") || NewFilter.Contains("0000000"))
                //{

                //    SemiFinal.Enqueue(NewFilter.Replace("0000000", ""));
                //}
                else
                {
                    SemiFinal.Enqueue(NewFilter);

                }


            }

            var SemifiMasDe7 = SemiFinal.Where(t => t.Length >= 7).ToArray();
            //var Semifal7 = SemiFinal.Where(t => t.Length == 7).ToArray();


            foreach (string ss in SemifiMasDe7)
            {
                string Conten = string.Empty;
                Conten = ss;
                if (Conten.Length == 7)
                {

                    Semi.Enqueue(Conten.ToString());
                }
                else if (Conten.Length >= 7)
                {

                    Semi.Enqueue(Conten.Substring(0, 7).ToString());
                }



            }

            return Semi;
        }

        public static Queue<string> Monitoreio_SKB(System.Data.DataTable DtSet)
        {


            Queue<int> Numero = new Queue<int>();
            Queue<string> Listar_CIP = new Queue<string>();
            Queue<string> Copias_Cip = new Queue<String>();
            List<CIP> UsuarioOperacion = new List<CIP>();
            Queue<string> Colafin = new Queue<string>();
            Queue<string> SemiFinal = new Queue<string>();
            Queue<string> Semi = new Queue<string>();
            CIP OBJ;

            foreach (DataRow row in DtSet.Rows)
            {
                if (!row.IsNull("F4"))
                {

                    OBJ = new CIP();
                    OBJ.CIP1 = row["F4"].ToString().Trim();
                    UsuarioOperacion.Add(OBJ);
                }
            }

            foreach (CIP lista in UsuarioOperacion)
            {
                string cadena = string.Empty;
                cadena = lista.CIP1.ToString();
                Regex re = new Regex(@"^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$");
                Match mat = re.Match(cadena);
                if (mat.Success)
                {
                    string matFirst = string.Empty;
                    matFirst = mat.Value.ToString();

                    if (matFirst.Contains("."))
                    {
                        matFirst = Decimal.Parse(matFirst, System.Globalization.NumberStyles.Any).ToString();
                    }

                    Listar_CIP.Enqueue(matFirst);

                }
                else
                {

                    //Regex re = new Regex(@"^[+-]?([0-9]*\.?[0-9]+|[0-9]+\.?[0-9]*)([eE][+-]?[0-9]+)?$");
                    Regex res = new Regex(@"\d+");
                    Match matt = res.Match(cadena);
                    if (matt.Success)
                    {
                        string matSSecond = string.Empty;
                        matSSecond = matt.Value.ToString();

                        Listar_CIP.Enqueue(matSSecond);

                    }


                }
            }
            var listRemoveNull = Listar_CIP.Where(x => x != "").ToArray();
            Colafin = new Queue<string>(listRemoveNull);

            foreach (string CqueNewFilter in Colafin)
            {
                string NewFilter = string.Empty;
                NewFilter = CqueNewFilter;
                if (NewFilter.Contains("0000000"))
                {


                    SemiFinal.Enqueue(NewFilter.Replace("0000000", ""));
                }

                else if (NewFilter.Contains("000000"))
                {


                    SemiFinal.Enqueue(NewFilter.Replace("000000", ""));
                }


                else
                {
                    SemiFinal.Enqueue(NewFilter);

                }


            }

            var SemifiMasDe7 = SemiFinal.Where(t => t.Length >= 7).ToArray();
            //var Semifal7 = SemiFinal.Where(t => t.Length == 7).ToArray();


            foreach (string ss in SemifiMasDe7)
            {
                string Conten = string.Empty;
                Conten = ss;
                if (Conten.Length == 7)
                {

                    Semi.Enqueue(Conten.ToString());
                }
                else if (Conten.Length >= 7)
                {

                    Semi.Enqueue(Conten.Substring(0, 7).ToString());
                }



            }

            return Semi;
        }

        public static string Get_Excel_Sheet_Name(string ConectionToExcelFile)
        {


            Queue<string> GetExcelNameSheet = new Queue<string>();
            string NombreSheet = string.Empty;
            System.Data.OleDb.OleDbConnection conn = new System.Data.OleDb.OleDbConnection(ConectionToExcelFile);
            conn.Open();
            System.Data.DataTable dtSheet = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            foreach (DataRow sheet in dtSheet.Rows)
            {

                if (sheet["TABLE_NAME"].ToString().Contains("$"))
                {

                    GetExcelNameSheet.Enqueue(sheet["TABLE_NAME"].ToString());
                    NombreSheet = sheet["TABLE_NAME"].ToString();

                }




            }
            conn.Close();
            return NombreSheet;

        }

    }
}