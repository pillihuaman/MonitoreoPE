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


(6004009,'02'),

(6003009,'02'),

(6003225,'02'),

(6002763,'02'),

(6002803,'02'),

(6002672,'02'),

(6002209,'02'),

(6002271,'02'),

(6002440,'02'),

(6001086,'02'),

(6002001,'02'),

(6004011,'02'),

(6003965,'02'),

(6003025,'02'),

(6002202,'02'),

(6002159,'02'),

(6002854,'02'),

(6002083,'02'),

(6004130,'02'),

(6004067,'02'),

(6002197,'02'),

(6003804,'02'),

(6002703,'02'),

(6002391,'02'),

(6001612,'02'),

(6003339,'02'),

(6002306,'02'),

(6004057,'02'),

(6003909,'02'),

(6002664,'02'),

(6002470,'02'),

(6002788,'02'),

(6002551,'02'),

(6002538,'02'),

(6002517,'02'),

(6002730,'02'),

(6003261,'02'),

(6002773,'02'),

(6002338,'02'),

(6002144,'02'),

(6002829,'02'),

(6002581,'02'),

(6002258,'02'),

(6002407,'02'),

(6002016,'02'),

(6001995,'02'),

(6002379,'02'),

(6003428,'02'),

(6002727,'02'),

(6003162,'02'),

(6003196,'02'),

(6002898,'02'),

(6001999,'02'),

(6001962,'02'),

(6001836,'02'),

(6001977,'02'),

(6002289,'02'),

(6001916,'02'),

(6003755,'02'),

(6003063,'02'),

(6002226,'02'),

(6002344,'02'),

(6002758,'02'),

(6002936,'02'),

(6002217,'02'),

(6002595,'02'),

(6002362,'02'),

(6003289,'02'),

(6002726,'02'),

(6002561,'02'),

(6001699,'02'),

(6003698,'02'),

(6003342,'02'),

(6003612,'02'),

(6002026,'02'),

(6002827,'02'),

(6001937,'02'),

(6001953,'02'),

(6002231,'02'),

(6002635,'02'),

(5996967,'02'),

(5995144,'02'),

(5996668,'02'),

(6001973,'02'),

(5998609,'02'),

(6003565,'02'),

(6003619,'02'),

(6002432,'02'),

(5997996,'02'),

(5999059,'02'),

(6004052,'02'),

(6002416,'02'),

(6001755,'02'),

(6001754,'02'),

(6003275,'02'),

(6002692,'02'),

(6003754,'02'),

(6003644,'02'),

(6002650,'02'),

(6003452,'02'),

(6002523,'02'),

(6002276,'02'),

(6003549,'02'),

(6002092,'02'),

(5999856,'02'),

(6003030,'02'),

(6003148,'02'),

(6002831,'02'),

(6002746,'02'),

(6002558,'02'),

(6001068,'02'),

(6002535,'02'),

(5995472,'02'),

(6002480,'02'),

(6002195,'02'),

(6002253,'02'),

(6002124,'02'),

(6002005,'02'),

(6003450,'02'),

(6003948,'02'),

(6003302,'02'),

(6004073,'02'),

(6003806,'02'),

(6003335,'02'),

(6003513,'02'),

(6002246,'02'),

(6003662,'02'),

(6003750,'02'),

(6003118,'02'),

(6003572,'02'),

(6003519,'02'),

(6003487,'02'),

(6003181,'02'),

(6003267,'02'),

(6003111,'02'),

(6003028,'02'),

(6002748,'02'),

(6002424,'02'),

(6002772,'02'),

(6002717,'02'),

(6002644,'02'),

(5999021,'02'),

(6002466,'02'),

(6002358,'02'),

(6002155,'02'),

(5994956,'02'),

(6001438,'02'),

(6002003,'02'),

(6001981,'02'),

(6003173,'02'),

(6002109,'02'),

(6003956,'02'),

(5982720,'02'),

(6003591,'02'),

(6003768,'02'),

(6003044,'02'),

(6003141,'02'),

(6002165,'02'),

(6000125,'02'),

(6001326,'02'),

(6002967,'02'),

(6002942,'02'),

(6002208,'02'),

(5999776,'02'),

(6002120,'02'),

(6002060,'02'),

(5996979,'02'),

(6002849,'02'),

(6003694,'02'),

(6002938,'02'),

(6003581,'02'),

(6000459,'02'),

(6003352,'02'),

(6003432,'02'),

(6003525,'02'),

(6003401,'02'),

(6000175,'02'),

(6003381,'02'),

(6003206,'02'),

(5999900,'02'),

(6002392,'02'),

(6002501,'02'),

(6002913,'02'),

(6002636,'02'),

(6002508,'02'),

(6002143,'02'),

(6002632,'02'),

(6002444,'02'),

(6002555,'02'),

(5996792,'02'),

(6002430,'02'),

(6001742,'02'),

(6003021,'02'),

(6003489,'02'),

(6002769,'02'),

(6002825,'02'),

(5999736,'02'),

(6001676,'02'),

(6003583,'02'),

(6002871,'02'),

(6002620,'02'),

(6002412,'02'),

(6002339,'02'),

(6003836,'02'),

(6003882,'02'),

(6003528,'02'),

(6003015,'02'),

(6002571,'02'),

(5996373,'02'),

(6004039,'02'),

(6003277,'02'),

(6004051,'02'),

(6003287,'02'),

(6002899,'02'),

(5998813,'02'),

(6002801,'02'),

(6003499,'02'),

(6002586,'02'),

(6003555,'02'),

(6003772,'02'),

(6003255,'02'),

(6003340,'02'),

(6003122,'02'),

(6001687,'02'),

(6002590,'02'),

(5988121,'02'),

(6002968,'02'),

(6000087,'02'),

(5994620,'02'),

(6001566,'02'),

(6002453,'02'),

(6003003,'02'),

(6002013,'02'),

(6001367,'02'),

(6003440,'02'),

(6000510,'02'),

(6001125,'02'),

(6001730,'02'),

(6003738,'02'),

(6003518,'02'),

(6002646,'02'),

(6002098,'02'),

(6004019,'02'),

(6002909,'02'),

(6003820,'02'),

(6003604,'02'),

(6003855,'02'),

(6003822,'02'),

(6003791,'02'),

(6003553,'02'),

(6003152,'02'),

(6003407,'02'),

(6003308,'02'),

(6003034,'02'),

(6003033,'02'),

(6003081,'02'),

(6003076,'02'),

(6002296,'02'),

(6002940,'02'),

(6002880,'02'),

(6002514,'02'),

(6002770,'02'),

(6002385,'02'),

(6002485,'02'),

(6002283,'02'),

(6001007,'02'),

(6002022,'02'),

(6001901,'02'),

(6003437,'02'),

(6003288,'02'),

(6002937,'02'),

(6003256,'02'),

(6002578,'02'),

(5985545,'02'),

(6002542,'02'),

(5998284,'02'),

(5974916,'02'),

(5978567,'02'),

(6001750,'02'),

(5971180,'02'),

(5978526,'02'),

(5897656,'02'),

(6003249,'02'),

(5973496,'02'),

(5971139,'02'),

(5984669,'02'),

(6003521,'02'),

(5984403,'02'),

(6002956,'02'),

(6003232,'02'),

(6003247,'02'),

(6001795,'02'),

(5952558,'02'),

(5999466,'02'),

(5893220,'02'),

(5999771,'02'),

(5972471,'02'),

(5955580,'02'),

(6002484,'02'),

(6001638,'02'),

(5993222,'02'),

(6001801,'02'),

(5990482,'02'),

(6002389,'02'),

(6003859,'02'),

(6003600,'02'),

(6002811,'02'),

(6002310,'02'),

(6002249,'02'),

(6003664,'02'),

(6003797,'02'),

(6003642,'02'),

(6003239,'02'),

(6003053,'02'),

(6003290,'02'),

(6002268,'02'),

(5995536,'02'),

(6000483,'02'),

(6003434,'02'),

(6003718,'02'),

(6003406,'02'),

(6003187,'02'),

(6002567,'02'),

(6002163,'02'),

(6001942,'02'),

(6002255,'02'),

(6002963,'02'),

(6002423,'02'),

(6002203,'02'),

(6002522,'02'),

(6003056,'02'),

(5999326,'02'),

(6002463,'02'),

(6003459,'02'),

(6002233,'02'),

(6002248,'02'),

(6002718,'02'),

(5997225,'02'),

(6002460,'02'),

(5999477,'02'),

(6002360,'02'),

(6003363,'02'),

(6002182,'02'),

(6002731,'02'),

(6003204,'02'),

(6002982,'02'),

(6002673,'02'),

(6002970,'02'),

(6001669,'02'),

(6001713,'02'),

(5996437,'02'),

(6003103,'02'),

(6003665,'02'),

(6002702,'02'),

(6000711,'02'),

(6004078,'02'),

(6003906,'02'),

(6002805,'02'),

(6003802,'02'),

(6003861,'02'),

(6003623,'02'),

(6003389,'02'),

(6003805,'02'),

(6001497,'02'),

(6002543,'02'),

(6000681,'02'),

(6003140,'02'),

(6002624,'02'),

(5999616,'02'),

(6000394,'02'),

(6002721,'02'),

(6002287,'02'),

(6002089,'02'),

(6001194,'02'),

(6002288,'02'),

(6002448,'02'),

(6002204,'02'),

(6002194,'02'),

(6001618,'02'),

(6002033,'02'),

(6003160,'02'),

(6003171,'02'),

(6002556,'02'),

(5998686,'02'),

(6002273,'02'),

(6002148,'02'),

(6003456,'02'),

(6003745,'02'),

(6003736,'02'),

(6003438,'02'),

(6003426,'02'),

(6003080,'02'),

(6002614,'02'),

(6002348,'02'),

(6003016,'02'),

(6002225,'02'),

(6002892,'02'),

(6002552,'02'),

(5998963,'02'),

(6001822,'02'),

(5992750,'02'),

(5984465,'02'),

(5992621,'02'),

(5986321,'02'),

(5998634,'02'),

(6001896,'02'),

(5991108,'02'),

(6001862,'02'),

(5998254,'02'),

(5962896,'02'),

(6001090,'02'),

(5987825,'02'),

(5998856,'02'),

(5998267,'02'),

(6003527,'02'),

(6002986,'02'),

(6002229,'02'),

(6003142,'02'),

(6003929,'02'),

(6002112,'02'),

(6002277,'02'),

(6004063,'02'),

(6002836,'02'),

(6003376,'02'),

(6002628,'02'),

(6003567,'02'),

(5999786,'02'),

(6002978,'02'),

(6002817,'02'),

(599832,'02'),

(6003264,'02'),

(6003331,'02'),

(6002259,'02'),

(6002323,'02'),

(6000989,'02'),

(6002108,'02'),

(6001715,'02'),

(6003005,'02'),

(6002511,'02'),

(6002201,'02'),

(5976799,'02'),

(6003074,'02'),

(6002875,'02'),

(6002094,'02'),

(6002328,'02'),

(6003238,'02'),

(6004076,'02'),

(6003544,'02'),

(6003520,'02'),

(6003809,'02'),

(6000831,'02'),

(5996466,'02'),

(6002930,'02'),

(5997542,'02'),

(5997527,'02'),

(5993569,'02'),

(6001452,'02'),

(6002174,'02'),

(5992242,'02'),

(6003472,'02'),

(6003099,'02'),

(6004070,'02'),

(6004025,'02'),

(6003546,'02'),

(6002985,'02'),

(6002893,'02'),

(5995888,'02'),

(5961498,'02'),

(6002422,'02'),

(6003994,'02'),

(6002821,'02'),

(6002200,'02'),

(6003336,'02'),

(6003545,'02'),

(5998613,'02'),

(6003435,'02'),

(6002574,'02'),

(6001562,'02'),

(6000124,'02'),

(6002451,'02'),

(5996055,'02'),

(5994930,'02'),

(6002658,'02'),

(6000938,'02'),

(5998239,'02'),

(5998855,'02'),

(6001080,'02'),

(6003585,'02'),

(6002637,'02'),

(6002216,'02'),

(6002747,'02'),

(6001021,'02'),

(6002822,'02'),

(6003451,'02'),

(6000637,'02'),

(5999893,'02'),

(6004054,'02'),

(6001138,'02'),

(5995727,'02'),

(6001744,'02'),

(6002450,'02'),

(5998040,'02'),

(6002885,'02'),

(6003725,'02'),

(6002945,'02'),

(6001309,'02'),

(6002369,'02'),

(6002317,'02'),

(6002284,'02'),

(6001616,'02'),

(5996460,'02'),

(6000092,'02'),

(6000745,'02'),

(6002220,'02'),

(5998413,'02'),

(6003666,'02'),

(6001991,'02'),

(5996286,'02'),

(5998113,'02'),

(6000922,'02'),

(6002743,'02'),

(6002500,'02'),

(6004008,'02'),

(6002751,'02'),

(5997131,'02'),

(5999950,'02')










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





