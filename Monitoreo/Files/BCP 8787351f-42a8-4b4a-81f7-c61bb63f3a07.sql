use  BDPagoEfectivoReplicaCore


Declare @Fecha date, @B1 char(2),@B2 char(2),@B3 char(2),@B4 char(2),@B5 char(2);


Set @Fecha=getdate()


select	


@B1='02'

,@b5='dd'


DECLARE @TABLA TABLE


(	IdOrdenPago			INT,


	Banco				INT


)


INSERT INTO @TABLA 


(


IdOrdenPago,Banco


)


VALUES 


(6266806,'02'),

(6267912,'02'),

(6266648,'02'),

(6268660,'02'),

(6262426,'02'),

(6265644,'02'),

(6268373,'02'),

(6266813,'02'),

(6266470,'02'),

(6266224,'02'),

(6266205,'02'),

(6267840,'02'),

(6267638,'02'),

(6266748,'02'),

(6266411,'02'),

(6266761,'02'),

(6267899,'02'),

(6267646,'02'),

(6268652,'02'),

(6266679,'02'),

(6267874,'02'),

(6267894,'02'),

(6267559,'02'),

(6267717,'02'),

(6266766,'02'),

(6267094,'02'),

(6266990,'02'),

(6267092,'02'),

(6266764,'02'),

(6266265,'02'),

(6267550,'02'),

(6267603,'02'),

(6266769,'02'),

(6266250,'02'),

(6266657,'02'),

(6266759,'02'),

(6267694,'02'),

(6266849,'02'),

(6267828,'02'),

(6267857,'02'),

(6267734,'02'),

(6266495,'02'),

(6266765,'02'),

(6266871,'02'),

(6266846,'02'),

(6266814,'02'),

(6266850,'02'),

(6266747,'02'),

(6267354,'02'),

(6266834,'02'),

(6267148,'02'),

(6267085,'02'),

(6267050,'02'),

(6267470,'02'),

(6267072,'02'),

(6266827,'02'),

(6268000,'02'),

(6267037,'02'),

(6267637,'02'),

(6268209,'02'),

(6267344,'02'),

(6266444,'02'),

(6268538,'02'),

(6267867,'02'),

(6267844,'02'),

(6266053,'02'),

(6268180,'02'),

(6267763,'02'),

(6267664,'02'),

(6268217,'02'),

(6268358,'02'),

(6268106,'02'),

(6260727,'02'),

(6260721,'02'),

(6265954,'02'),

(6266864,'02'),

(6267248,'02'),

(6259105,'02'),

(6267674,'02'),

(6267811,'02'),

(6267956,'02'),

(6267539,'02'),

(6268666,'02'),

(6267252,'02'),

(6267121,'02'),

(6266945,'02'),

(6268477,'02'),

(6268098,'02'),

(6265858,'02'),

(6268419,'02'),

(6267796,'02'),

(6267430,'02'),

(6262764,'02'),

(6267829,'02'),

(6267820,'02'),

(6267749,'02'),

(6265998,'02'),

(6233568,'02'),

(6267511,'02'),

(6267356,'02'),

(6261084,'02'),

(6265319,'02'),

(6266709,'02'),

(6267349,'02'),

(6268102,'02'),

(6266810,'02'),

(6268483,'02'),

(6268674,'02'),

(6268636,'02'),

(6268550,'02'),

(6268566,'02'),

(6268551,'02'),

(6268475,'02'),

(6268436,'02'),

(6268254,'02'),

(6268181,'02'),

(6268255,'02'),

(6267625,'02'),

(6268250,'02'),

(6267775,'02'),

(6268019,'02'),

(6267950,'02'),

(6267948,'02'),

(6267797,'02'),

(6267900,'02'),

(6266662,'02'),

(6267706,'02'),

(6267747,'02'),

(6267731,'02'),

(6266630,'02'),

(6267026,'02'),

(6267671,'02'),

(6267604,'02'),

(6267572,'02'),

(6267265,'02'),

(6267410,'02'),

(6267386,'02'),

(6267229,'02'),

(6267200,'02'),

(6267190,'02'),

(6266939,'02'),

(6267055,'02'),

(6266716,'02'),

(6266874,'02'),

(6266953,'02'),

(6266960,'02'),

(6266962,'02'),

(6266869,'02'),

(6266617,'02'),

(6266616,'02'),

(6266594,'02'),

(6267365,'02'),

(6258131,'02'),

(6266661,'02'),

(6266968,'02'),

(6268570,'02'),

(6268213,'02'),

(6266705,'02'),

(6262450,'02'),

(6266847,'02'),

(6268568,'02'),

(6268273,'02'),

(6267925,'02'),

(6267189,'02'),

(6267264,'02'),

(6266784,'02'),

(6268308,'02'),

(6267793,'02'),

(6267025,'02'),

(6267098,'02'),

(6268447,'02'),

(6267719,'02'),

(6267985,'02'),

(6266704,'02'),

(6268076,'02'),

(6268608,'02'),

(6268466,'02'),

(6268332,'02'),

(6268438,'02'),

(6268553,'02'),

(6268517,'02'),

(6268284,'02'),

(6268186,'02'),

(6266701,'02'),

(6268120,'02'),

(6268207,'02'),

(6268130,'02'),

(6267752,'02'),

(6267940,'02'),

(6267848,'02'),

(6263439,'02'),

(6266476,'02'),

(6267436,'02'),

(6267655,'02'),

(6267628,'02'),

(6266123,'02'),

(6267463,'02'),

(6266638,'02'),

(6267385,'02'),

(6267364,'02'),

(6267363,'02'),

(6266925,'02'),

(6266898,'02'),

(6266896,'02'),

(6258385,'02'),

(6266970,'02'),

(6267924,'02'),

(6248980,'02'),

(6267008,'02'),

(6266718,'02'),

(6266228,'02'),

(6258243,'02'),

(6268239,'02'),

(6268453,'02'),

(6268546,'02'),

(6268296,'02'),

(6268261,'02'),

(6268127,'02'),

(6267909,'02'),

(6267959,'02'),

(6267923,'02'),

(6266919,'02'),

(6267358,'02'),

(6267260,'02'),

(6266632,'02'),

(6267104,'02'),

(6266975,'02'),

(6266484,'02'),

(6264887,'02'),

(6267508,'02'),

(6266887,'02'),

(6261937,'02'),

(6268029,'02'),

(6268670,'02'),

(6268441,'02'),

(6268503,'02'),

(6268597,'02'),

(6266713,'02'),

(6268259,'02'),

(6267679,'02'),

(6264129,'02'),

(6268385,'02'),

(6268294,'02'),

(6268155,'02'),

(6267716,'02'),

(6267976,'02'),

(6267993,'02'),

(6267897,'02'),

(6267618,'02'),

(6249920,'02'),

(6267745,'02'),

(6267013,'02'),

(6263448,'02'),

(6267359,'02'),

(6267066,'02'),

(6267047,'02'),

(6266432,'02'),

(6266035,'02'),

(6267182,'02'),

(6268361,'02'),

(6267402,'02'),

(6267575,'02'),

(6266612,'02'),

(6259915,'02'),

(6256210,'02'),

(6260942,'02'),

(6256220,'02'),

(6229415,'02'),

(6267662,'02'),

(6251594,'02'),

(6267989,'02'),

(6267005,'02'),

(6259546,'02'),

(6260697,'02'),

(6230504,'02'),

(6226151,'02'),

(6267064,'02'),

(6267107,'02'),

(6266176,'02'),

(6266604,'02'),

(6268051,'02'),

(6265704,'02'),

(6266036,'02'),

(6267298,'02'),

(6268412,'02'),

(6268619,'02'),

(6268479,'02'),

(6268470,'02'),

(6267282,'02'),

(6267241,'02'),

(6266706,'02'),

(6266878,'02'),

(6267090,'02'),

(6264484,'02'),

(6267751,'02'),

(6254914,'02'),

(6267315,'02'),

(6260063,'02'),

(6266836,'02'),

(6266681,'02'),

(6267417,'02'),

(6263623,'02'),

(6268206,'02'),

(6267818,'02'),

(6268065,'02'),

(6267457,'02'),

(6267411,'02'),

(6267506,'02'),

(6264602,'02'),

(6266037,'02'),

(6267109,'02'),

(6267873,'02'),

(6267636,'02'),

(6260307,'02'),

(6268248,'02'),

(6268154,'02'),

(6267830,'02'),

(6267795,'02'),

(6267677,'02'),

(6267147,'02'),

(6268183,'02'),

(6263584,'02'),

(6262873,'02'),

(6264355,'02'),

(6266978,'02'),

(6266937,'02'),

(6268494,'02'),

(6268014,'02'),

(6261542,'02'),

(6267779,'02'),

(6267440,'02'),

(6267445,'02'),

(6267226,'02'),

(6267041,'02'),

(6264205,'02'),

(6267906,'02'),

(6267549,'02'),

(6266976,'02'),

(6268278,'02'),

(6268539,'02'),

(6267596,'02'),

(6267569,'02'),

(6266894,'02'),

(6268489,'02'),

(6267276,'02'),

(6268442,'02'),

(6268242,'02'),

(6268202,'02'),

(6267736,'02'),

(6267919,'02'),

(6267921,'02'),

(6267918,'02'),

(6265847,'02'),

(6267377,'02'),

(6267396,'02'),

(6264353,'02'),

(6267331,'02'),

(6267338,'02'),

(6267099,'02'),

(6266777,'02'),

(6266717,'02'),

(6266664,'02'),

(6266649,'02'),

(6262509,'02'),

(6268085,'02'),

(6268476,'02'),

(6267645,'02'),

(6268509,'02'),

(6268211,'02'),

(6267634,'02'),

(6267514,'02'),

(6267468,'02'),

(6267262,'02'),

(6267117,'02'),

(6266623,'02'),

(6267060,'02'),

(6267629,'02'),

(6266981,'02'),

(6266989,'02'),

(6267084,'02'),

(6267561,'02'),

(6245708,'02'),

(6258686,'02'),

(6239287,'02'),

(6266319,'02'),

(6173936,'02'),

(6266460,'02'),

(6233487,'02'),

(6266397,'02'),

(6266307,'02'),

(6268657,'02'),

(6267856,'02'),

(6267591,'02'),

(6267886,'02'),

(6267896,'02'),

(6253093,'02'),

(6257696,'02'),

(6214327,'02'),

(6268371,'02'),

(6266986,'02'),

(6262603,'02'),

(6265887,'02'),

(6267741,'02'),

(6267266,'02'),

(6263551,'02'),

(6267492,'02'),

(6264551,'02'),

(6267758,'02'),

(6267666,'02'),

(6267406,'02'),

(6266816,'02'),

(6268099,'02'),

(6268469,'02'),

(6259024,'02'),

(6267403,'02'),

(6266597,'02'),

(6266835,'02'),

(6259636,'02'),

(6268317,'02'),

(6268397,'02'),

(6267174,'02'),

(6268009,'02'),

(6267723,'02'),

(6242507,'02'),

(6266459,'02'),

(6265621,'02'),

(6266318,'02'),

(6184503,'02'),

(6267369,'02'),

(6267126,'02'),

(6266863,'02'),

(6268004,'02'),

(6267534,'02'),

(6267287,'02'),

(6256546,'02'),

(6268561,'02'),

(6267871,'02'),

(6268215,'02'),

(6268112,'02'),

(6263284,'02'),

(6263261,'02'),

(6263252,'02'),

(6263241,'02'),

(6263275,'02'),

(6267560,'02'),

(6267302,'02'),

(6264570,'02'),

(6268040,'02'),

(6267086,'02'),

(6267954,'02'),

(6256097,'02'),

(6267285,'02'),

(6268639,'02'),

(6266131,'02'),

(6117165,'02'),

(6267202,'02'),

(6267574,'02'),

(6268604,'02'),

(6266967,'02'),

(6267872,'02'),

(6267667,'02'),

(6268038,'02'),

(6267213,'02'),

(6267176,'02'),

(6265876,'02'),

(6265688,'02'),

(6267733,'02'),

(6265902,'02'),

(6263088,'02'),

(6268622,'02'),

(6266600,'02'),

(6268404,'02'),

(6268257,'02'),

(6265454,'02'),

(6267223,'02'),

(6266843,'02'),

(6263658,'02'),

(6264895,'02'),

(6267022,'02'),

(6268310,'02'),

(6268234,'02'),

(6267942,'02'),

(6267093,'02'),

(6267714,'02'),

(6262310,'02'),

(6265822,'02'),

(6258336,'02'),

(6266988,'02'),

(6267937,'02'),

(6267279,'02'),

(6265562,'02'),

(6265912,'02'),

(6268274,'02'),

(6267592,'02'),

(6264082,'02'),

(6266237,'02'),

(6268230,'02'),

(6266961,'02'),

(6268353,'02'),

(6267742,'02'),

(6267622,'02'),

(6266174,'02'),

(6267101,'02'),

(6266955,'02'),

(6266773,'02'),

(6266977,'02'),

(6268499,'02'),

(6266725,'02'),

(6267146,'02'),

(6265104,'02'),

(6267002,'02'),

(6266909,'02'),

(6262117,'02'),

(6264428,'02'),

(6268042,'02'),

(6265706,'02'),

(6257802,'02'),

(6261027,'02'),

(6261512,'02'),

(6268074,'02'),

(6267357,'02'),

(6263013,'02'),

(6267760,'02'),

(6268424,'02'),

(6259693,'02'),

(6267782,'02'),

(6266792,'02'),

(6267670,'02'),

(6266959,'02'),

(6267698,'02'),

(6268226,'02')










Select * from 


(Select CIP=(CASE WHEN A.IdOrdenPago=B.IdOrdenPago AND A.Estado=B.Estado  THEN 1


				 WHEN B.IdOrdenPago IS NULL THEN A.IdOrdenPago


				 WHEN A.IdOrdenPago IS NULL THEN B.IdOrdenPago


				 WHEN A.IdOrdenPago=B.IdOrdenPago THEN A.IdOrdenPago 


				 else 25 END),


				 


	    Total_Pago=(CASE 


					WHEN B.Total=A.Total THEN B.Total


					WHEN B.Total IS NULL THEN A.Total


					WHEN A.Total IS NULL THEN B.Total 


					else '25' END),


	   Moneda=(CASE 


					WHEN B.Moneda=A.Moneda THEN B.Moneda


					WHEN B.Moneda IS NULL THEN A.Moneda


					WHEN A.Moneda IS NULL THEN B.Moneda 


					else '25' END),


	   Banco=(CASE WHEN B.Banco =A.Banco THEN A.Banco


				   WHEN B.Banco IS NULL THEN A.Banco


				   WHEN A.Banco IS NULL THEN B.Banco 


				   else '25' END),


	   Portal=(CASE WHEN B.Servicio =A.Servicio THEN A.Servicio


				   WHEN B.Servicio IS NULL THEN A.Servicio


				   WHEN A.Servicio IS NULL THEN B.Servicio 


				   else '25' END),


	   Estado=(CASE WHEN B.Estado =A.Estado THEN A.Estado


				   WHEN B.Estado IS NULL THEN A.Estado


				   WHEN A.Estado IS NULL THEN B.Estado 


				   else '25' END),


	   FechaPago=(CASE WHEN B.FechaCancelacion =A.FechaCancelacion THEN A.FechaCancelacion


				   WHEN B.FechaCancelacion IS NULL THEN A.FechaCancelacion


				   WHEN A.FechaCancelacion IS NULL THEN B.FechaCancelacion 


				   else '22' END),


	  Observacion=(CASE WHEN A.IdOrdenPago=B.IdOrdenPago AND A.Estado=B.Estado THEN '1'


					   WHEN A.Estado='Cancelado' and (B.Estado!='Cancelado' OR B.Estado IS NULL) THEN 'Extornar'


					   WHEN B.Estado!='Cancelado' THEN 'Pagar'


					   else '22' END)


					   ,


					   OrderIdComercio1 =A.OrderIdComercio,


					   OrderIdComercio2 =B.OrderIdComercio


FROM


(SELECT  


		distinct


		O1.IdOrdenPago,


		Moneda=(case when O1.idmoneda=1 then 'Soles'


					 when O1.idmoneda=2 then 'Dolares'


				end),


		Banco=(CASE WHEN TOC1.Descripcion= 'Agencia Bancaria' THEN (CASE WHEN B1.Codigo = '02' THEN 'BCP'


																		 WHEN B1.Codigo = '03' THEN 'BBVA'


																		 WHEN B1.Codigo = '05' THEN 'SBK'


																		 WHEN B1.Codigo = '06' THEN 'WU'


																		 WHEN B1.Codigo = '04' THEN 'IBK'--Nuevo


																	END)


					WHEN TOC1.Descripcion= 'Full Carga' THEN 'FC'


					WHEN TOC1.Descripcion= 'Monedero Electr�nico' THEN 'Monedero'


				end),


		Estado=(CASE										


				WHEN O1.IdEstado=23 THEN 'Cancelado'		


				WHEN O1.IdEstado=21 THEN 'Expirado'			


				WHEN O1.IdEstado=25 THEN 'Eliminado'		


				WHEN O1.IdEstado=22 THEN 'Generado'			


				END),										


		S1.Nombre as Servicio,	


		O1.Total, 


		O1.FechaCancelacion


		,


		O1.OrderIdComercio


FROM  PagoEfectivo.OrdenPago O1  (nolock)


inner join PagoEfectivo.servicio S1	  (nolock)				on O1.IdServicio				=	S1.IdServicio 


inner join PagoEfectivo.Movimiento M1 (nolock)				on O1.IdOrdenPago				=   M1.IdOrdenPago and m1.idmovimiento =(select top 1 MM.idmovimiento from pagoefectivo.movimiento MM where MM.idordenpago=O1.IdOrdenPago order by fechamovimiento desc)


left join PagoEfectivo.AperturaOrigen AO1 (nolock)			on M1.IdAperturaOrigen			=   AO1.IdAperturaOrigen 


left join PagoEfectivo.TipoOrigenCancelacion TOC1  (nolock)	on M1.IdTipoOrigenCancelacion	=	TOC1.IdTipoOrigenCancelacion 


left join PagoEfectivo.AgenciaBancaria AB1	 (nolock)		on AO1.IdAgenciaBancaria		=   AB1.IdAgenciaBancaria 


left join PagoEfectivo.Banco B1		 (nolock)				on AB1.IdBanco					=	B1.IdBanco 


where 


cast(O1.FechaCancelacion as date)=@Fecha and O1.IdEstado=23 and 


B1.Codigo in (@B1,@B2,@B3,@B4) and


O1.IdConciliacionArchivo is null) A


FULL JOIN 


(Select distinct


		IdOrdenPago=(CASE WHEN O.IdOrdenPago=T.IdOrdenPago  THEN O.IdOrdenPago


				 WHEN O.IdOrdenPago IS NULL THEN T.IdOrdenPago


				 WHEN T.IdOrdenPago IS NULL THEN O.IdOrdenPago END),


		Moneda=(case when O.idmoneda=1 then 'Soles'


					 when O.idmoneda=2 then 'Dolares'


				end),


		Banco=(CASE WHEN T.Banco= '02' then 'BCP'


					WHEN T.Banco= '03' then 'BBVA'


					WHEN T.Banco= '04' then 'IBK'


					WHEN T.Banco= '05' then 'SBK'					


				end),


		Estado=(CASE								


				WHEN O.IdEstado=23 THEN 'Cancelado'	


				WHEN O.IdEstado=21 THEN 'Expirado'	


				WHEN O.IdEstado=25 THEN 'Eliminado'	


				WHEN O.IdEstado=22 THEN 'Generado'	


				END),								


		S.Nombre as Servicio,	


		O.Total, 


		O.FechaCancelacion,


		o.orderidcomercio


FROM  PagoEfectivo.OrdenPago O  (nolock)


inner join PagoEfectivo.servicio S		 (nolock)			on O.IdServicio			=	S.IdServicio 


RIGHT join  @Tabla				T	 				on O.IdOrdenPago		=	T.IdOrdenPago 


where O.IdConciliacionArchivo is null


)B


ON A.IdOrdenPago=B.IdOrdenPago


) K


where K.CIP!=1


ORDER BY K.Banco,K.FechaPago, K.Observacion




