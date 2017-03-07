
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace Monitoreo.Models
{
    public class Create_txt_File
    {



        public static Queue<string> SBK(string Banco)
        {
            string fileName = string.Format(@"F:\\Monitoreo\SKB {0}.sql", Guid.NewGuid());
            Queue<string> Final_CIPS = new Queue<string>();
             Queue<string> Final_CIPS_mas_Fechas = new Queue<string>();

            try
            {
                // Check if file already exists. If yes, delete it. 
                if (File.Exists(fileName))
                {
                    File.Delete(fileName);
                }

                // Create a new file 
                using (StreamWriter sw = File.CreateText(fileName))
                {

                    string IDTransferenciaEmpresas = string.Empty;
                    string Fecha = string.Empty;
                    string CodigoOperacion = string.Empty;
                    string CadenaCIPS = string.Empty;
                    int Contador = 0;
                    Queue<string> Cadena_Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(1, Banco));
                    Queue<string> Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(2, Banco) );
                    Queue<string> Cadena_add = new Queue<string>();
                   
                    foreach (string ca in Cadena_Cip)
                    {

                        IDTransferenciaEmpresas = ca.Substring(0, 5);
                        Fecha = ca.Substring(6, 10);
                        CodigoOperacion = ca.Substring(17, (ca.Length - 17));
                        foreach (string CIP in Cip)
                        {
                            if (CIP.Length == 13)
                            {
                                if (CIP.Substring(8, (CIP.Length - 8)) == IDTransferenciaEmpresas)
                                {

                                    Cadena_add.Enqueue(CIP.Substring(0, 7) + ",");
                                    Final_CIPS.Enqueue(CIP.Substring(0, 7));

                                }

                            }

                        }

                        ////////////Creacion de archivo
                        string cadenas = string.Empty;
                        foreach (string cadena in Cadena_add)
                        {

                            cadenas = cadenas + cadena;

                        }

                        //SKB
                        sw.WriteLine("BEGIN TRY");
                        sw.WriteLine("  BEGIN TRANSACTION;");
                        sw.WriteLine("      SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;");
                        sw.WriteLine(" declare @Total" + Contador + " decimal(18,2),@IdDeposito" + Contador + "   int");
                        sw.WriteLine("declare @tabla" + Contador + "  table");
                        sw.WriteLine("(");
                        sw.WriteLine("CIP int, ");
                        sw.WriteLine("total     decimal(18,2),");
                        sw.WriteLine("idconciliacion  int");
                        sw.WriteLine(")");
                        sw.WriteLine("insert into @tabla" + Contador + " ");
                        sw.WriteLine("select IdOrdenPago , Total, IdConciliacionArchivo from PagoEfectivo.OrdenPago where ");
                        sw.WriteLine("IdOrdenPago not in (select IdOrdenPago from PagoEfectivo.DetDeposito) and IdEstado=23 and");
                        sw.WriteLine("IdOrdenPago in ");
                        sw.WriteLine("(");
                        sw.WriteLine(cadenas.Substring(0, (cadenas.Length - 1)));
                        sw.WriteLine(")");
                        sw.WriteLine("set @Total" + Contador + "  = (select SUM(total) from @tabla" + Contador + " )");
                        sw.WriteLine("select @Total" + Contador + " ");
                        sw.WriteLine("if (@Total" + Contador + "   is not null) begin INSERT INTO PagoEfectivo.Deposito (FechaDeposito,MontoDepositado,FechaActualizacion,IdBanco,NroTransaccion,IdUsuarioRegistro) ");
                        sw.WriteLine("VALUES");
                        sw.WriteLine("('" + Fecha + "',--");
                        sw.WriteLine("@Total" + Contador + "  ,GETDATE(),4,");
                        sw.WriteLine("'" + CodigoOperacion + "',");
                        sw.WriteLine("187865)");
                        sw.WriteLine("SET @IdDeposito" + Contador + "   =@@IDENTITY;");
                        sw.WriteLine("insert into PagoEfectivo.DetDeposito ");
                        sw.WriteLine("select @IdDeposito" + Contador + "   ,CIP,0 from @tabla" + Contador + "  ");
                        sw.WriteLine("insert into PagoEfectivo.DepositoConcArch ");
                        sw.WriteLine("select distinct idconciliacion,@IdDeposito" + Contador + "    from @tabla" + Contador + "   end");
                        sw.WriteLine("COMMIT TRANSACTION;");
                        sw.WriteLine("END TRY");
                        sw.WriteLine("BEGIN CATCH");
                        sw.WriteLine("SELECT ");
                        sw.WriteLine("ERROR_NUMBER() AS NUMERO_DE_ERROR,");
                        sw.WriteLine("ERROR_SEVERITY() AS GRAVEDAD_DEL_ERROR,");
                        sw.WriteLine("ERROR_STATE() AS ESTADO_DEL_ERROR,");
                        sw.WriteLine("ERROR_PROCEDURE() AS PROCEDIMIENTO_DEL_ERROR,");
                        sw.WriteLine("ERROR_LINE() AS LINEA_DE_ERROR,");
                        sw.WriteLine("ERROR_MESSAGE() AS MENSAJE_DE_ERROR;");
                        sw.WriteLine("ROLLBACK TRANSACTION");
                        sw.WriteLine("END CATCH");
                        sw.WriteLine("print 'Transacction' ");
                        sw.WriteLine("print @@TRANCOUNT");
                        sw.WriteLine("IF(@@TRANCOUNT!=0)");
                        sw.WriteLine("begin");
                        sw.WriteLine("COMMIT TRANSACTION;");
                        sw.WriteLine("end");
                        sw.WriteLine("print 'Transacction' ");
                        sw.WriteLine("print @@TRANCOUNT");

                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");


                        Contador++;
                        cadenas = string.Empty;
                        Cadena_add.Clear();




                        ///////////////////////////////////


                    }

                    ;
                }




                using (StreamReader sr = File.OpenText(fileName))
                {
                    string s = "";
                    while ((s = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(s);
                    }
                }

            }
               
            catch (Exception Ex)
            {
                Console.WriteLine(Ex.ToString());
            }

            foreach (string final in Final_CIPS)
            {

                Final_CIPS_mas_Fechas.Enqueue(final);
            
            }

            return Final_CIPS_mas_Fechas;
        }



        public static Queue<string> Creates_IBK(string Banco)
        {
            string fileName = string.Format(@"F:\\Monitoreo\IBK_ {0}.sql", Guid.NewGuid());
            Queue<string> Final_CIPS = new Queue<string>();
            Queue<string> Final_CIPS_mas_Fechas = new Queue<string>();
            try
            {
                // Check if file already exists. If yes, delete it. 
                if (File.Exists(fileName))
                {
                    File.Delete(fileName);
                }

                // Create a new file 
                using (StreamWriter sw = File.CreateText(fileName))
                {

                    string IDTransferenciaEmpresas = string.Empty;
                    string Fecha = string.Empty;
                    string CodigoOperacion = string.Empty;
                    string CadenaCIPS = string.Empty;
                    int Contador = 0;

                    string matS = string.Empty;
                    Queue<string> Cadena_Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(1, Banco));
                    Queue<string> Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(2, Banco));
                    Queue<string> Cadena_add = new Queue<string>();


















                    foreach (string ca in Cadena_Cip)
                    {

                        IDTransferenciaEmpresas = ca.Substring(0, 5);
                        Fecha = ca.Substring(6, 10);
                        CodigoOperacion = ca.Substring(17, (ca.Length - 17));


                        foreach (string CIP in Cip)
                        {
                            if (CIP.Length == 13)
                            {
                                if (CIP.Substring(8, (CIP.Length - 8)) == IDTransferenciaEmpresas)
                                {

                                    Cadena_add.Enqueue(CIP.Substring(0, 7) + ",");
                                    Final_CIPS.Enqueue(CIP.Substring(0, 7));

                                }



                            }



                        }

                        ////////////Creacion de archivo
                        string cadenas = string.Empty;


                        foreach (string cadena in Cadena_add)
                        {


                            cadenas = cadenas + cadena;

                        }




                        String Cadena1 = "BEGIN TRY  " + "\n" +
        "BEGIN TRANSACTION; " +
        "SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; " + "\n" +

        "Declare @IdDeposito" + Contador + "  int  " + "\n" +

        "Declare @tabla" + Contador + "  table  " + "\n" +
        "(   " + "\n" +
         " ID					int identity, " + "\n" +
          "idordenpago			int,  " + "\n" +
          "Fecha					date,  " + "\n" +
          "Total					Decimal(18,2),  " + "\n" +
          "Portal				varchar(50),  " + "\n" +
          "IdEmpresaContratante	int,  " + "\n" +
          "ComisionProvedor		Decimal(6,2), " + "\n" +
          "Banco					varchar(max),  " + "\n" +
          "idbanco				int,  " + "\n" +
          "Idmoneda				int, " + "\n" +
          "IdconciliacionArch	int  " + "\n" +
        ")  " + "\n" +

        "insert into @tabla" + Contador + "  (idordenpago,Fecha,Total,Portal,IdEmpresaContratante,ComisionProvedor,Banco,idbanco,Idmoneda,IdconciliacionArch) " + "\n" +
        "SELECT  " + "\n" +
        "distinct " + "\n" +
        "O1.IdOrdenPago,cast(O1.FechaCancelacion as date) 'Fecha' , Total,S1.Nombre,S1.IdEmpresaContratante, " + "\n" +
        "ComisionProvedor = (case when B1.Codigo IN ('05','04') then 0 " + "\n" +
        "				         when B1.Codigo = '06' then (case when O1.idmoneda=1 then (case when O1.Total>200 then 2.5*1.18 else 2*1.18 end) " + "\n" +
                                                            "when O1.idmoneda=2 then (case when 2.75*O1.Total>200 then 2.5*1.18 else 2*1.18  " + "end)  " + "\n" +
                                                            " end) " + "\n" +
                                " when TOC1.Descripcion= 'Full Carga' then 1.8 " + "\n" +
                                " else -1  " + "\n" +
                            "end ), " + "\n" +
        "Banco=(CASE WHEN TOC1.Descripcion= 'Agencia Bancaria' THEN (CASE WHEN B1.Codigo = '02' THEN 'BCP' " + "\n" +
                                                                        " WHEN B1.Codigo = '03' THEN 'BBVA' " + "\n" +
                                                                        " WHEN B1.Codigo = '05' THEN 'SBK' " + "\n" +
                                                                        " WHEN B1.Codigo = '06' THEN 'WU' " + "\n" +
                                                                        " WHEN B1.Codigo = '04' THEN 'IBK'--Nuevo " + "\n" +
                                                            "END) " + "\n" +
                    "WHEN TOC1.Descripcion= 'Full Carga' THEN 'FC' " + "\n" +
                    "WHEN TOC1.Descripcion= 'Monedero Electrónico' THEN 'Monedero' " + "\n" +
                "end), " + "\n" +
        "id_banco=(Case when B1.idbanco IS not null then B1.idbanco else '4' end),  " + "\n" +
        "O1.IdMoneda, O1.IdConciliacionArchivo " + "\n" +
        "FROM  PagoEfectivo.OrdenPago O1 WITH (NOLOCK)  " + "\n" +
        "inner join PagoEfectivo.servicio S1		WITH (NOLOCK) 			on O1.IdServicio				=	S1.IdServicio  " + "\n" +
        "LEFT JOIN PagoEfectivo.ServicioComision SC		WITH (NOLOCK)  	ON S1.IdServicio = SC.idServicio AND SC.idMoneda = O1.IdMoneda  " + "\n" +
        "inner join PagoEfectivo.Movimiento M1		WITH (NOLOCK) 		on O1.IdOrdenPago		=   M1.IdOrdenPago and M1.IdMovimiento=(select top 1  " + "mm.IdMovimiento from pagoefectivo.Movimiento mm where mm.idordenpago= O1.idordenpago order by fechamovimiento desc) " + "\n" +
        "left join PagoEfectivo.AperturaOrigen AO1	WITH (NOLOCK)  		on M1.IdAperturaOrigen			=   AO1.IdAperturaOrigen  " + "\n" +
        "left join PagoEfectivo.TipoOrigenCancelacion TOC1  WITH (NOLOCK) 	on M1.IdTipoOrigenCancelacion	=	TOC1.IdTipoOrigenCancelacion  " + "\n" +
        "left join PagoEfectivo.AgenciaBancaria AB1		WITH (NOLOCK) 	on AO1.IdAgenciaBancaria		=   AB1.IdAgenciaBancaria  " + "\n" +
        "left join PagoEfectivo.Banco B1				WITH (NOLOCK) 		on AB1.IdBanco					=	B1.IdBanco  " + "\n" +
        "where  " +
        "o1.IdEstado =23	and o1.IdOrdenPago not in (select IdOrdenPago  from PagoEfectivo.DetDeposito) " + "\n" +
        "and (o1.IdConciliacionArchivo is not null) and o1.IdOrdenPago in ( ";




                        string cadena2 = ")	order by Banco	  " +

    "INSERT INTO PagoEfectivo.Deposito (FechaDeposito,CodigoOperacion, Comentarios, MontoDepositado, FechaRegistro,  " + "IdBanco,NroTransaccion,IdUsuarioRegistro)  " + "\n" +
    "SELECT distinct  " + "\n" +
    "" + "'" + Fecha + "',--" + " FechaDeposito,--FechaDeposito	  " + "\n" +
    "'' CodigoOperacion, --CodigoOperacion ->	Solo para WU y FC  " + "\n" +
    "'Fixdata' Comentarios,--Comentarios  " + "\n" +
    "Sum(Total)MontoDepositado,--MontoDepositado  " + "\n" +
    "getdate() FechaRegistro,--FechaRegistro  " + "\n" +
    "idbanco,--IdBanco  " + "\n" +
    "'PAG-0735001_PEN_" + Fecha.Replace("-", "") + "',--NroTransaccion	->	Solo para SBK y IBK  " + "\n" +
    "187865 IdUsuarioRegistro--IdUsuarioRegistro	  " + "\n" +
    "FROM @tabla" + Contador + "   " + "\n" +
    "group by idbanco  " + "\n" +

    "SET @IdDeposito" + Contador + "   = @@IDENTITY;  " + "\n" +

    "insert into PagoEfectivo.DepositoConcArch (IdConciliacionArchivo, IdDeposito  )  " + "\n" +
    "select distinct IdconciliacionArch  " + "\n" +
    ",@IdDeposito" + Contador + "     " + "\n" +
    " from @tabla" + Contador + "   " + "\n" +

    "Insert into PagoEfectivo.DetDeposito   " + "\n" +
    "select distinct  " + "\n" +
    "@IdDeposito" + Contador + "  ,  " + "\n" +
    "T.idordenpago,T.ComisionProvedor  " + "\n" +
    "from @tabla" + Contador + "  T   " + "\n" +

    "COMMIT TRANSACTION;  " + "\n" +
"END TRY	  " +
"BEGIN CATCH  " +
    "SELECT   " +
    "	ERROR_NUMBER() AS NUMERO_DE_ERROR,  " + "\n" +
    "	ERROR_SEVERITY() AS GRAVEDAD_DEL_ERROR,  " +
    "	ERROR_STATE() AS ESTADO_DEL_ERROR,  " +
    "ERROR_PROCEDURE() AS PROCEDIMIENTO_DEL_ERROR,  " +
        "ERROR_LINE() AS LINEA_DE_ERROR,  " +
    "	ERROR_MESSAGE() AS MENSAJE_DE_ERROR;  " + "\n" +
    "	ROLLBACK TRANSACTION  " +
"END CATCH  " +

"print 'Transacction'   " + "\n" +
"print @@TRANCOUNT  " +
"IF(@@TRANCOUNT!=0)  " +
"begin  " +
    "COMMIT TRANSACTION;  " +
"end  " +
"print 'Transacction'   " + "\n" +
"print @@TRANCOUNT  ";


                        sw.WriteLine(Cadena1 + "\n");
                        sw.WriteLine(cadenas.Substring(0, (cadenas.Length - 1)) + "\n");
                        sw.WriteLine(cadena2 + "\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");


                        Contador++;
                        cadenas = string.Empty;
                        Cadena_add.Clear();




                        ///////////////////////////////////


                    }

                    ;
                }




                using (StreamReader sr = File.OpenText(fileName))
                {
                    string s = "";
                    while ((s = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(s);
                    }
                }

            }
            catch (Exception Ex)
            {
                Console.WriteLine(Ex.ToString());
            }

            foreach (string final in Final_CIPS)
            {

                Final_CIPS_mas_Fechas.Enqueue(final);

            }

            return Final_CIPS_mas_Fechas;

        }

        public static Queue<string> Creates_FC(string Banco)
        {
            string fileName = string.Format(@"F:\ArchivosPara Evaluar\RegistroDeProveedores\EstadoBancarios\ScriptProveedores\BackUpAllFileProveedores\FC {0}.sql", Guid.NewGuid());

            Queue<string> Final_CIPS = new Queue<string>();
            Queue<string> Final_CIPS_mas_Fechas = new Queue<string>();
            try
            {



                using (StreamWriter sw = File.CreateText(fileName))
                {

                    string IDTransferenciaEmpresas = string.Empty;
                    string Fecha = string.Empty;
                    string CodigoOperacion = string.Empty;
                    string CadenaCIPS = string.Empty;
                    int Contador = 0;
                    string matS = string.Empty;
                    Queue<string> Cadena_Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(1, Banco));
                    Queue<string> Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(2, Banco));
                    Queue<string> Cadena_add = new Queue<string>();

                    //metodo
                    foreach (string ca in Cadena_Cip)
                    {

                        IDTransferenciaEmpresas = ca.Substring(0, 5);
                        Fecha = ca.Substring(6, 10);
                        CodigoOperacion = ca.Substring(17, (ca.Length - 17));


                        foreach (string CIP in Cip)
                        {
                            if (CIP.Length == 13)
                            {
                                if (CIP.Substring(8, (CIP.Length - 8)) == IDTransferenciaEmpresas)
                                {

                                    Cadena_add.Enqueue(CIP.Substring(0, 7) + ",");

                                    Final_CIPS.Enqueue(CIP.Substring(0, 7));
                                }



                            }



                        }


                        string cadenas = string.Empty;


                        foreach (string cadena in Cadena_add)
                        {


                            cadenas = cadenas + cadena;

                        }


                        String Cadena1 = "BEGIN TRY " + "\n" +
"	BEGIN TRANSACTION; " + "\n" +
"	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; " + "\n" +

"	Declare @IdDeposito" + Contador + "  int " + "\n" +

"	Declare @tabla" + Contador + " table (  " + "\n" +

"	  ID					int identity, " + "\n" +
"	  idordenpago			int, " + "\n" +
"	  Fecha					date, " + "\n" +
"	  Total					Decimal(18,2), " + "\n" +
    "  Portal				varchar(max), " + "\n" +
      "IdEmpresaContratante	int, " + "\n" +
    "  ComisionProvedor		Decimal(6,2), " + "\n" +
"	  Banco					varchar(max), " + "\n" +
"	  idbanco				int, " + "\n" +
"	  Idmoneda				int, " + "\n" +
"	  IdconciliacionArch	int " + "\n" +
"	) " + "\n" +

"insert into @tabla" + Contador + " (idordenpago,Fecha,Total,Portal,IdEmpresaContratante,ComisionProvedor,Banco,idbanco,Idmoneda,IdconciliacionArch) " + "\n" +
"	SELECT  " + "\n" +
"	distinct " + "\n" +
"	O1.IdOrdenPago,cast(O1.FechaCancelacion as date) 'Fecha' , Total,S1.Nombre,S1.IdEmpresaContratante, " + "\n" +
"	ComisionProvedor = (case when B1.Codigo IN ('05','04') then 0 " + "\n" +
"				when B1.Codigo = '06' then (case when O1.idmoneda=1 then (case when O1.Total>200 then 2.5*1.18 else 2*1.18 end) " + "\n" +
"					  when O1.idmoneda=2 then (case when 2.75*O1.Total>200 then 2.5*1.18 else 2*1.18 end) " + "\n" +
"														 end) " + "\n" +
"							 when TOC1.Descripcion= 'Full Carga' then 1.8 " + "\n" +
"							 else -1  " + "\n" +
"						end ), " + "\n" +
"	Banco=(CASE WHEN TOC1.Descripcion= 'Agencia Bancaria' THEN (CASE WHEN B1.Codigo = '02' THEN 'BCP' " + "\n" +
"																	 WHEN B1.Codigo = '03' THEN 'BBVA' " + "\n" +
"																	 WHEN B1.Codigo = '05' THEN 'SBK' " + "\n" +
"																	 WHEN B1.Codigo = '06' THEN 'WU' " + "\n" +
"																 WHEN B1.Codigo = '04' THEN 'IBK'--Nuevo " + "\n" +
    "													END) " + "\n" +
"				WHEN TOC1.Descripcion= 'Full Carga' THEN 'FC' " + "\n" +
"				WHEN TOC1.Descripcion= 'Monedero Electrónico' THEN 'Monedero' " + "\n" +
"			end), " + "\n" +
"	id_banco=(Case when B1.idbanco IS not null then B1.idbanco else '3' end),  " + "\n" +
"	O1.IdMoneda, O1.IdConciliacionArchivo " + "\n" +
"	FROM  PagoEfectivo.OrdenPago O1  with (nolock) " + "\n" +
"	inner join PagoEfectivo.servicio S1				with (nolock)	on O1.IdServicio				=	S1.IdServicio  " + "\n" +
"	LEFT JOIN PagoEfectivo.ServicioComision SC	with (nolock)		ON S1.IdServicio = SC.idServicio AND SC.idMoneda = O1.IdMoneda  " + "\n" +
"	inner join PagoEfectivo.Movimiento M1	with (nolock)			on O1.IdOrdenPago				=   M1.IdOrdenPago  " + "\n" +
"	left join PagoEfectivo.AperturaOrigen AO1	with (nolock)		on M1.IdAperturaOrigen			=   AO1.IdAperturaOrigen  " + "\n" +
"	left join PagoEfectivo.TipoOrigenCancelacion TOC1   with (nolock)	on M1.IdTipoOrigenCancelacion	=	TOC1.IdTipoOrigenCancelacion  " + "\n" +
"	left join PagoEfectivo.AgenciaBancaria AB1		with (nolock)	on AO1.IdAgenciaBancaria		=   AB1.IdAgenciaBancaria  " + "\n" +
"	left join PagoEfectivo.Banco B1			with (nolock)			on AB1.IdBanco					=	B1.IdBanco  " + "\n" +
"	where " + "\n" +
"	o1.IdEstado =23	and o1.IdOrdenPago not in (select IdOrdenPago  from PagoEfectivo.DetDeposito) " + "\n" +
"	and (o1.IdConciliacionArchivo is not null) and o1.IdOrdenPago  " + "\n" +
"	in ( " + "\n";

                        string cadena2 =
")	order by Banco " + "\n" +

"	--select * from @tabla" + Contador + " " + "\n" +
"	INSERT INTO PagoEfectivo.Deposito (FechaDeposito,CodigoOperacion, Comentarios, MontoDepositado, FechaRegistro, IdBanco,NroTransaccion,IdUsuarioRegistro) " + "\n" +
"	SELECT distinct " + "\n" +
  "" + "'" + Fecha + "' FechaDeposito,--FechaDeposito	 " + "\n" +
"'" + CodigoOperacion + "' CodigoOperacion, --CodigoOperacion ->	Solo para WU y FC " + "\n" +
"	'Fixdata' Comentarios,--Comentarios " + "\n" +
"	Sum(Total)MontoDepositado,--MontoDepositado " + "\n" +
"	getdate() FechaRegistro,--FechaRegistro " + "\n" +
"	idbanco,--IdBanco " + "\n" +
"	'',--NroTransaccion	->	Solo para SBK y IBK " + "\n" +
"	187865 IdUsuarioRegistro--IdUsuarioRegistro	 " + "\n" +
"	FROM @tabla" + Contador + " " + "\n" +
"	group by idbanco " + "\n" +

"	SET @IdDeposito" + Contador + "  = @@IDENTITY; " + "\n" +

"	insert into PagoEfectivo.DepositoConcArch (IdConciliacionArchivo, IdDeposito ) " + "\n" +
"	select distinct IdconciliacionArch " + "\n" +
"	,@IdDeposito" + Contador + "   " + "\n" +
"	 from @tabla" + Contador + " " + "\n" +

"	Insert into PagoEfectivo.DetDeposito  " + "\n" +
"	select distinct " + "\n" +
"	@IdDeposito" + Contador + " , " + "\n" +
"	T.idordenpago,T.ComisionProvedor  " + "\n" +
"	from @tabla" + Contador + " T  " + "\n" +

"	COMMIT TRANSACTION; " + "\n" +
"END TRY	 " + "\n" +
"BEGIN CATCH " + "\n" +
"	SELECT  " + "\n" +
"		ERROR_NUMBER() AS NUMERO_DE_ERROR, " + "\n" +
"		ERROR_SEVERITY() AS GRAVEDAD_DEL_ERROR, " + "\n" +
"		ERROR_STATE() AS ESTADO_DEL_ERROR, " + "\n" +
"		ERROR_PROCEDURE() AS PROCEDIMIENTO_DEL_ERROR, " + "\n" +
"		ERROR_LINE() AS LINEA_DE_ERROR, " + "\n" +
"		ERROR_MESSAGE() AS MENSAJE_DE_ERROR; " + "\n" +
"		ROLLBACK TRANSACTION " + "\n" +
"END CATCH " + "\n" +

"print 'Transacction'  " + "\n" +
"print @@TRANCOUNT " + "\n" +
"IF(@@TRANCOUNT!=0) " + "\n" +
"begin " + "\n" +
    "COMMIT TRANSACTION; " + "\n" +
"end " + "\n" +
"print 'Transacction'  " + "\n" +
"print @@TRANCOUNT " + "\n";




                        sw.WriteLine(Cadena1 + "\n");
                        sw.WriteLine(cadenas.Substring(0, (cadenas.Length - 1)) + "\n");
                        sw.WriteLine(cadena2 + "\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");


                        Contador++;
                        cadenas = string.Empty;
                        Cadena_add.Clear();




                        ///////////////////////////////////


                    }

                    ;
                }




                using (StreamReader sr = File.OpenText(fileName))
                {
                    string s = "";
                    while ((s = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(s);
                    }
                }

            }
            catch (Exception Ex)
            {
                Console.WriteLine(Ex.ToString());
            }


            foreach (string final in Final_CIPS)
            {

                Final_CIPS_mas_Fechas.Enqueue(final);

            }

            return Final_CIPS_mas_Fechas;

        }

        public static Queue<string> Creates_WU(string Banco)
        {
            string fileName = string.Format(@"F:\\Monitoreo\WU {0}.sql", Guid.NewGuid());
            Queue<string> Final_CIPS = new Queue<string>();
            Queue<string> Final_CIPS_mas_Fechas = new Queue<string>();
            try
            {



                using (StreamWriter sw = File.CreateText(fileName))
                {

                    string IDTransferenciaEmpresas = string.Empty;
                    string Fecha = string.Empty;
                    string CodigoOperacion = string.Empty;
                    string CadenaCIPS = string.Empty;
                    int Contador = 0;
                    string matS = string.Empty;
                    Queue<string> Cadena_Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(1, Banco));
                    Queue<string> Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(2, Banco));
                    Queue<string> Cadena_add = new Queue<string>();

                    //metodo
                    foreach (string ca in Cadena_Cip)
                    {

                        IDTransferenciaEmpresas = ca.Substring(0, 5);
                        Fecha = ca.Substring(6, 10);
                        CodigoOperacion = ca.Substring(17, (ca.Length - 17));


                        foreach (string CIP in Cip)
                        {
                            if (CIP.Length == 13)
                            {
                                if (CIP.Substring(8, (CIP.Length - 8)) == IDTransferenciaEmpresas)
                                {

                                    Cadena_add.Enqueue(CIP.Substring(0, 7) + ",");

                                    Final_CIPS.Enqueue(CIP.Substring(0, 7));
                                }



                            }



                        }


                        string cadenas = string.Empty;


                        foreach (string cadena in Cadena_add)
                        {


                            cadenas = cadenas + cadena;

                        }


                        String Cadena1 = "BEGIN TRY" + "\n" +
     "BEGIN TRANSACTION;" + "\n" +
     "SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;" + "\n" +

     "Declare @IdDeposito" + Contador + "   int" + "\n" +

     "Declare @tabla" + Contador + "  table" + "\n" +
     "( " + "\n" +
      " ID					int identity," + "\n" +
      " idordenpago			int," + "\n" +
       "Fecha					date," + "\n" +
      " Total					Decimal(18,2)," + "\n" +
       "Portal				varchar(max)," + "\n" +
      " IdEmpresaContratante	int," + "\n" +
       "ComisionProvedor		Decimal(6,2)," + "\n" +
       "Banco					varchar(max)," + "\n" +
       "idbanco				int," + "\n" +
       "Idmoneda				int," + "\n" +
       "IdconciliacionArch	int" + "\n" +
     ")" + "\n" +

 "insert into @tabla" + Contador + "  (idordenpago,Fecha,Total,Portal,IdEmpresaContratante,ComisionProvedor,Banco,idbanco,Idmoneda,IdconciliacionArch)" + "\n" +
 "	SELECT " + "\n" +
     "distinct" + "\n" +
     "O1.IdOrdenPago,cast(O1.FechaCancelacion as date) 'Fecha' , Total,S1.Nombre,S1.IdEmpresaContratante," + "\n" +
     "ComisionProvedor = (case when B1.Codigo IN ('05','04') then 0" + "\n" +
         "			  when B1.Codigo = '06' then (case when O1.idmoneda=1 then (case when O1.Total>200 then 2.5*1.18 else 2*1.18 end)" + "\n" +
             "			 when O1.idmoneda=2 then (case when 2.75*O1.Total>200 then 2.5*1.18 else 2*1.18 end)	 end) " + "\n" +
                 "			 when TOC1.Descripcion= 'Full Carga' then 1.8" + "\n" +
                     "		 else -1 " + "\n" +
                         "end )," + "\n" +
     "Banco=(CASE WHEN TOC1.Descripcion= 'Agencia Bancaria' THEN (CASE WHEN B1.Codigo = '02' THEN 'BCP'" + "\n" +
         "															 WHEN B1.Codigo = '03' THEN 'BBVA'" + "\n" +
             "														 WHEN B1.Codigo = '05' THEN 'SBK'" + "\n" +
                 "													 WHEN B1.Codigo = '06' THEN 'WU'" + "\n" +
                     "												 WHEN B1.Codigo = '04' THEN 'IBK'--Nuevo" + "\n" +
                         "								END)" + "\n" +
                 "WHEN TOC1.Descripcion= 'Full Carga' THEN 'FC'" + "\n" +
                 "WHEN TOC1.Descripcion= 'Monedero Electrónico' THEN 'Monedero'" + "\n" +
             "end)," + "\n" +
     "id_banco=(Case when B1.idbanco IS not null then B1.idbanco else '4' end), " + "\n" +
     "O1.IdMoneda, O1.IdConciliacionArchivo" + "\n" +
     "FROM  PagoEfectivo.OrdenPago O1 with(nolock)" + "\n" +
     "inner join PagoEfectivo.servicio S1		with(nolock)			on O1.IdServicio				=	S1.IdServicio " + "\n" +
     "LEFT JOIN PagoEfectivo.ServicioComision SC	with(nolock)		ON S1.IdServicio = SC.idServicio AND SC.idMoneda = O1.IdMoneda " + "\n" +
 "inner join PagoEfectivo.Movimiento M1			with(nolock)	on O1.IdOrdenPago				=  " + "\n" +
 " M1.IdOrdenPago and m1.idmovimiento =" + "\n" +
  "(select top 1 MM.idmovimiento from pagoefectivo.movimiento MM where MM.idordenpago=O1.IdOrdenPago order by fechamovimiento desc)" + "\n" +
 "	left join PagoEfectivo.AperturaOrigen AO1		with(nolock)	on M1.IdAperturaOrigen			=   AO1.IdAperturaOrigen " + "\n" +
     "left join PagoEfectivo.TipoOrigenCancelacion TOC1 with(nolock)	on M1.IdTipoOrigenCancelacion	=	TOC1.IdTipoOrigenCancelacion " + "\n" +
     "left join PagoEfectivo.AgenciaBancaria AB1		with(nolock) 	on AO1.IdAgenciaBancaria		=   AB1.IdAgenciaBancaria " + "\n" +
 "	left join PagoEfectivo.Banco B1				with(nolock)		on AB1.IdBanco					=	B1.IdBanco " + "\n" +
     "where" + "\n" +
     "o1.IdEstado =23	and o1.IdOrdenPago not in (select IdOrdenPago  from PagoEfectivo.DetDeposito)" + "\n" +
     "and (o1.IdConciliacionArchivo is not null) and o1.IdOrdenPago in " + "\n" +
     "(";

                        String cadena2 = "	)" + "\n" +
     "order by Banco" + "\n" +

     "--select * from @tabla" + Contador + " " + "\n" +

 "INSERT INTO PagoEfectivo.Deposito (FechaDeposito,CodigoOperacion, Comentarios, MontoDepositado, FechaRegistro, " + "\n" +
  "IdBanco,NroTransaccion,IdUsuarioRegistro)" + "\n" +
     "SELECT distinct" + "\n" +
      "" + "'" + Fecha + "' FechaDeposito,--FechaDeposito	 " + "\n" +
     "'" + CodigoOperacion + "' CodigoOperacion, --CodigoOperacion ->	Solo para WU y FC " + "\n" +
 "	'Fixdata' Comentarios,--Comentarios" + "\n" +
     "Sum(Total)MontoDepositado,--MontoDepositado" + "\n" +
     "getdate() FechaRegistro,--FechaRegistro" + "\n" +
     "idbanco,--IdBanco" + "\n" +
     "'',--NroTransaccion	->	Solo para SBK y IBK" + "\n" +
     "187865 IdUsuarioRegistro--IdUsuarioRegistro	" + "\n" +
     "FROM @tabla" + Contador + " " + "\n" +
     "group by idbanco" + "\n" +

     "SET @IdDeposito" + Contador + "   = @@IDENTITY;" + "\n" +

     "insert into PagoEfectivo.DepositoConcArch (IdConciliacionArchivo, IdDeposito)" + "\n" +
     "select distinct IdconciliacionArch" + "\n" +
     ",@IdDeposito" + Contador + "   " + "\n" +
     " from @tabla" + Contador + " " + "\n" +

     "Insert into PagoEfectivo.DetDeposito " + "\n" +
     "select distinct" + "\n" +
     "@IdDeposito" + Contador + "  ," + "\n" +
     "T.idordenpago,T.ComisionProvedor " + "\n" +
     "from @tabla" + Contador + "  T " + "\n" +

 "	COMMIT TRANSACTION;" + "\n" +
 "END TRY	" + "\n" +
 "BEGIN CATCH" + "\n" +
     "SELECT " + "\n" +
         "ERROR_NUMBER() AS NUMERO_DE_ERROR," + "\n" +
         "ERROR_SEVERITY() AS GRAVEDAD_DEL_ERROR," + "\n" +
         "ERROR_STATE() AS ESTADO_DEL_ERROR," + "\n" +
         "ERROR_PROCEDURE() AS PROCEDIMIENTO_DEL_ERROR," + "\n" +
         "ERROR_LINE() AS LINEA_DE_ERROR," + "\n" +
         "ERROR_MESSAGE() AS MENSAJE_DE_ERROR;" + "\n" +
         "ROLLBACK TRANSACTION" + "\n" +
 "END CATCH" + "\n" +

 "print 'Transacction' " + "\n" +
 "print @@TRANCOUNT" + "\n" +
 "IF(@@TRANCOUNT!=0)" + "\n" +
 "begin" + "\n" +
     "COMMIT TRANSACTION;" + "\n" +
 "end" + "\n" +
 "print 'Transacction' " + "\n" +
 "print @@TRANCOUNT";




                        sw.WriteLine(Cadena1 + "\n");
                        sw.WriteLine(cadenas.Substring(0, (cadenas.Length - 1)) + "\n");
                        sw.WriteLine(cadena2 + "\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");


                        Contador++;
                        cadenas = string.Empty;
                        Cadena_add.Clear();




                        ///////////////////////////////////


                    }

                    ;
                }




                using (StreamReader sr = File.OpenText(fileName))
                {
                    string s = "";
                    while ((s = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(s);
                    }
                }

            }
            catch (Exception Ex)
            {
                Console.WriteLine(Ex.ToString());
            }

            foreach (string final in Final_CIPS)
            {

                Final_CIPS_mas_Fechas.Enqueue(final);

            }

            return Final_CIPS_mas_Fechas;


        }

        public static Queue<string> Creates_BIF(string Banco)
        {
            string fileName = string.Format(@"F:\\Monitoreo\BIF {0}.sql", Guid.NewGuid());

            Queue<string> Final_CIPS = new Queue<string>();
            Queue<string> Final_CIPS_mas_Fechas = new Queue<string>();
	   
            try
            {



                using (StreamWriter sw = File.CreateText(fileName))
                {

                    string IDTransferenciaEmpresas = string.Empty;
                    string Fecha = string.Empty;
                    string CodigoOperacion = string.Empty;
                    string CadenaCIPS = string.Empty;
                    int Contador = 0;
                    string matS = string.Empty;
                    Queue<string> Cadena_Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(1, Banco));
                    Queue<string> Cip = new Queue<string>(Get_Excel_Values.get_Values_Proveedores(2, Banco));
                    Queue<string> Cadena_add = new Queue<string>();

                    //metodo
                    foreach (string ca in Cadena_Cip)
                    {

                        IDTransferenciaEmpresas = ca.Substring(0, 5);
                        Fecha = ca.Substring(6, 10);
                        CodigoOperacion = ca.Substring(17, (ca.Length - 17));


                        foreach (string CIP in Cip)
                        {
                            if (CIP.Length == 13)
                            {
                                if (CIP.Substring(8, (CIP.Length - 8)) == IDTransferenciaEmpresas)
                                {

                                    Cadena_add.Enqueue(CIP.Substring(0, 7) + ",");

                                    Final_CIPS.Enqueue(CIP.Substring(0, 7));
                                }



                            }



                        }


                        string cadenas = string.Empty;


                        foreach (string cadena in Cadena_add)
                        {


                            cadenas = cadenas + cadena;

                        }


                        String Cadena1 = "BEGIN TRY" + "\n" +
    "BEGIN TRANSACTION;" + "\n" +
    "	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;" + "\n" +

    "	declare @Total" + Contador + "  decimal(18,2),@IdDeposito" + Contador + " int" + "\n" +

    "	declare @tabla" + Contador + "  table" + "\n" +
    "	(" + "\n" +
    "		CIP				int," + "\n" +
    "		total			decimal(18,2)," + "\n" +
    "		idconciliacion	int" + "\n" +
    "	)" + "\n" +
    "	insert into @tabla" + Contador + "" + "\n" +
    "	select IdOrdenPago , Total, IdConciliacionArchivo from PagoEfectivo.OrdenPago where " + "\n" +
    "	IdOrdenPago not in (select IdOrdenPago from PagoEfectivo.DetDeposito) and " + "\n" +
    "	IdOrdenPago in " + "\n" +
"		(";
                        String cadena2 = "		)" + "\n" +
"		set @Total" + Contador + " = (select SUM(total) from @tabla" + Contador + ")" + "\n" +


"if (@Total" + Contador + "  is not null) begin INSERT INTO PagoEfectivo.Deposito " + "\n" +
"(FechaDeposito,MontoDepositado,FechaActualizacion,IdBanco,NroTransaccion,IdUsuarioRegistro) 	VALUES (" + "\n" +
      "" + "'" + Fecha + "' ,-- FechaDeposito,--FechaDeposito	 " + "\n" +
"		@Total" + Contador + " ,GETDATE(),7," + "\n" +
  "'BIF_PEN_" + Fecha.Replace("-", "") + "',--NroTransaccion " + "\n" +

    "	187865)" + "\n" +

    "	SET @IdDeposito" + Contador + " =@@IDENTITY;" + "\n" +

    "	insert into PagoEfectivo.DetDeposito " + "\n" +
    "	select @IdDeposito" + Contador + ",CIP,0 from @tabla" + Contador + "" + "\n" +

    "	insert into PagoEfectivo.DepositoConcArch " + "\n" +
    "	select distinct idconciliacion,@IdDeposito" + Contador + "  from @tabla" + Contador + "  end" + "\n" +

    "COMMIT TRANSACTION;" + "\n" +
"END TRY	" + "\n" +
"BEGIN CATCH" + "\n" +
"	SELECT " + "\n" +
"		ERROR_NUMBER() AS NUMERO_DE_ERROR," + "\n" +
"		ERROR_SEVERITY() AS GRAVEDAD_DEL_ERROR," + "\n" +
"		ERROR_STATE() AS ESTADO_DEL_ERROR," + "\n" +
"		ERROR_PROCEDURE() AS PROCEDIMIENTO_DEL_ERROR," + "\n" +
"		ERROR_LINE() AS LINEA_DE_ERROR," + "\n" +
"		ERROR_MESSAGE() AS MENSAJE_DE_ERROR;" + "\n" +
"		ROLLBACK TRANSACTION" + "\n" +
"END CATCH" + "\n" +

"print 'Transacction' " + "\n" +
"print @@TRANCOUNT" + "\n" +

"IF(@@TRANCOUNT!=0)" + "\n" +
"begin" + "\n" +
"	COMMIT TRANSACTION;" + "\n" +
"end" + "\n" +
"print 'Transacction'" + "\n" +
"print @@TRANCOUNT";




                        sw.WriteLine(Cadena1 + "\n");
                        sw.WriteLine(cadenas.Substring(0, (cadenas.Length - 1)) + "\n");
                        sw.WriteLine(cadena2 + "\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");
                        sw.WriteLine("\n");


                        Contador++;
                        cadenas = string.Empty;
                        Cadena_add.Clear();




                        ///////////////////////////////////


                    }

                    ;
                }




                using (StreamReader sr = File.OpenText(fileName))
                {
                    string s = "";
                    while ((s = sr.ReadLine()) != null)
                    {
                        Console.WriteLine(s);
                    }
                }

            }
            catch (Exception Ex)
            {
                Console.WriteLine(Ex.ToString());
            }

 foreach (string final in Final_CIPS)
            {

                Final_CIPS_mas_Fechas.Enqueue(final);
            
            }

            return Final_CIPS_mas_Fechas;


        }

    }
}