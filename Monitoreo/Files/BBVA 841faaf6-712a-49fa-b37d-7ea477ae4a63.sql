use  BDPagoEfectivoReplicaCore


Declare @Fecha date, @B1 char(2),@B2 char(2),@B3 char(2),@B4 char(2),@B5 char(2);


Set @Fecha=getdate()


select	


@B1='03'

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


(6006540,'03'),

(6001556,'03'),

(6005988,'03'),

(6007033,'03'),

(6006988,'03'),

(6006132,'03'),

(6006664,'03'),

(6005334,'03'),

(6006474,'03'),

(6006582,'03'),

(6006231,'03'),

(6006529,'03'),

(6006366,'03'),

(6004108,'03'),

(6005570,'03'),

(6005442,'03'),

(6005400,'03'),

(6005944,'03'),

(6005835,'03'),

(6005798,'03'),

(6003069,'03'),

(6005586,'03'),

(6005596,'03'),

(6005551,'03'),

(6005461,'03'),

(6004605,'03'),

(6004580,'03'),

(6004250,'03'),

(6003840,'03'),

(6005240,'03'),

(6005193,'03'),

(6005100,'03'),

(6003963,'03'),

(6004647,'03'),

(6003817,'03'),

(6003961,'03'),

(6004678,'03'),

(6004675,'03'),

(6004642,'03'),

(6004577,'03'),

(6004540,'03'),

(6004191,'03'),

(6003998,'03'),

(6004328,'03'),

(6002009,'03'),

(6004015,'03'),

(6003182,'03'),

(6004031,'03'),

(6003385,'03'),

(6002757,'03'),

(6002171,'03'),

(6002531,'03'),

(6003540,'03'),

(6002074,'03'),

(6003510,'03'),

(6002608,'03'),

(6003391,'03'),

(6002886,'03'),

(6003027,'03'),

(6002780,'03'),

(6003207,'03'),

(6002793,'03'),

(6002652,'03'),

(6002826,'03'),

(6002308,'03'),

(6002742,'03'),

(6002336,'03'),

(6002378,'03'),

(6002036,'03'),

(6001975,'03'),

(6001927,'03'),

(6001599,'03'),

(6000462,'03'),

(6006703,'03'),

(6006795,'03'),

(6006286,'03'),

(6004626,'03'),

(6006143,'03'),

(6007000,'03'),

(6006969,'03'),

(6007006,'03'),

(6006889,'03'),

(5997585,'03'),

(6006114,'03'),

(6006494,'03'),

(6006885,'03'),

(6006843,'03'),

(6006849,'03'),

(6006804,'03'),

(6006402,'03'),

(6006692,'03'),

(6006713,'03'),

(6006504,'03'),

(6006438,'03'),

(5999938,'03'),

(6006659,'03'),

(6000826,'03'),

(6000849,'03'),

(5999662,'03'),

(6005381,'03'),

(6006475,'03'),

(5999253,'03'),

(6006277,'03'),

(6006526,'03'),

(6004104,'03'),

(6006116,'03'),

(6006457,'03'),

(5994616,'03'),

(6003064,'03'),

(5990909,'03'),

(6004429,'03'),

(6005828,'03'),

(6006417,'03'),

(6006243,'03'),

(6006379,'03'),

(6005746,'03'),

(6006288,'03'),

(6006291,'03'),

(6006061,'03'),

(6006264,'03'),

(6004781,'03'),

(6006037,'03'),

(6005783,'03'),

(6006195,'03'),

(6006189,'03'),

(6006103,'03'),

(6006162,'03'),

(5994607,'03'),

(6006047,'03'),

(6006041,'03'),

(6006135,'03'),

(6005968,'03'),

(6005729,'03'),

(6006096,'03'),

(6004317,'03'),

(6000164,'03'),

(6006101,'03'),

(6001201,'03'),

(6004042,'03'),

(6006052,'03'),

(6006032,'03'),

(6006022,'03'),

(6005999,'03'),

(6004037,'03'),

(6005548,'03'),

(6005964,'03'),

(6005543,'03'),

(6005936,'03'),

(5966823,'03'),

(6004181,'03'),

(6005845,'03'),

(6005846,'03'),

(6005383,'03'),

(6005120,'03'),

(6005820,'03'),

(6005772,'03'),

(6005788,'03'),

(6005716,'03'),

(6004697,'03'),

(5954072,'03'),

(5999495,'03'),

(6005699,'03'),

(6005542,'03'),

(6005625,'03'),

(5927438,'03'),

(6005601,'03'),

(6005578,'03'),

(6003563,'03'),

(6005563,'03'),

(6005568,'03'),

(6005466,'03'),

(6004575,'03'),

(5966458,'03'),

(5984476,'03'),

(6005406,'03'),

(6004682,'03'),

(6005390,'03'),

(6005177,'03'),

(6005344,'03'),

(6004976,'03'),

(6005342,'03'),

(6002222,'03'),

(5998461,'03'),

(6005285,'03'),

(6005248,'03'),

(6005030,'03'),

(6005255,'03'),

(6005275,'03'),

(6002223,'03'),

(5989392,'03'),

(6005245,'03'),

(6005077,'03'),

(6005202,'03'),

(6003640,'03'),

(6005151,'03'),

(6000554,'03'),

(6000141,'03'),

(5993753,'03'),

(6005152,'03'),

(6005114,'03'),

(6004309,'03'),

(6005032,'03'),

(6004632,'03'),

(6005052,'03'),

(6003462,'03'),

(6004656,'03'),

(6002889,'03'),

(6004780,'03'),

(6004539,'03'),

(6003931,'03'),

(6004916,'03'),

(6004872,'03'),

(6004908,'03'),

(6001596,'03'),

(6000964,'03'),

(6004837,'03'),

(6004851,'03'),

(6004849,'03'),

(6004844,'03'),

(6003268,'03'),

(6004705,'03'),

(6004753,'03'),

(5999954,'03'),

(6004707,'03'),

(5995037,'03'),

(6003127,'03'),

(6004526,'03'),

(6004352,'03'),

(6004691,'03'),

(6003643,'03'),

(6004202,'03'),

(6004219,'03'),

(6004617,'03'),

(6002991,'03'),

(6004386,'03'),

(6004474,'03'),

(6003659,'03'),

(6004544,'03'),

(6004468,'03'),

(5990137,'03'),

(5996407,'03'),

(6004332,'03'),

(6004373,'03'),

(6004357,'03'),

(6000362,'03'),

(6000351,'03'),

(6002478,'03'),

(6004327,'03'),

(6003784,'03'),

(6004293,'03'),

(6004256,'03'),

(6004089,'03'),

(6004176,'03'),

(6003558,'03'),

(6004160,'03'),

(6003875,'03'),

(6002766,'03'),

(6003902,'03'),

(6002755,'03'),

(6002939,'03'),

(6002741,'03'),

(6004066,'03'),

(5999483,'03'),

(6003985,'03'),

(6003311,'03'),

(6004040,'03'),

(6000644,'03'),

(6003594,'03'),

(5990541,'03'),

(6003606,'03'),

(6003971,'03'),

(5942428,'03'),

(6003937,'03'),

(5998327,'03'),

(6003128,'03'),

(6003890,'03'),

(6003073,'03'),

(6003928,'03'),

(5995111,'03'),

(5984896,'03'),

(5995123,'03'),

(6003688,'03'),

(5984980,'03'),

(6003786,'03'),

(6003415,'03'),

(6003484,'03'),

(6003752,'03'),

(6003753,'03'),

(6003639,'03'),

(5977441,'03'),

(6003684,'03'),

(6003641,'03'),

(6003375,'03'),

(6003625,'03'),

(6000869,'03'),

(6003675,'03'),

(6003700,'03'),

(6001209,'03'),

(6003654,'03'),

(6003667,'03'),

(6003425,'03'),

(6003638,'03'),

(6003279,'03'),

(6003539,'03'),

(6003622,'03'),

(6002797,'03'),

(6003609,'03'),

(6003613,'03'),

(5999751,'03'),

(6003269,'03'),

(6003461,'03'),

(6003313,'03'),

(6003455,'03'),

(5989291,'03'),

(6003107,'03'),

(6003457,'03'),

(6003417,'03'),

(6003347,'03'),

(6003419,'03'),

(6003368,'03'),

(6003332,'03'),

(6003351,'03'),

(6003023,'03'),

(6002521,'03'),

(6003175,'03'),

(5999116,'03'),

(5999309,'03'),

(6003237,'03'),

(5974556,'03'),

(6002872,'03'),

(6003048,'03'),

(6003165,'03'),

(6003147,'03'),

(6003119,'03'),

(6003133,'03'),

(6002931,'03'),

(6003087,'03'),

(6003091,'03'),

(5996559,'03'),

(6002807,'03'),

(6000186,'03'),

(6000339,'03'),

(6002601,'03'),

(6003000,'03'),

(5959652,'03'),

(6002199,'03'),

(6003013,'03'),

(6002990,'03'),

(6002020,'03'),

(6002962,'03'),

(5988893,'03'),

(6002761,'03'),

(6002890,'03'),

(6002883,'03'),

(6002808,'03'),

(6002066,'03'),

(6002815,'03'),

(6002683,'03'),

(6002352,'03'),

(5988051,'03'),

(6002764,'03'),

(6002640,'03'),

(6002749,'03'),

(6002734,'03'),

(6002548,'03'),

(6002439,'03'),

(5933421,'03'),

(6002693,'03'),

(6002686,'03'),

(6001445,'03'),

(5996252,'03'),

(6002623,'03'),

(6002587,'03'),

(6002585,'03'),

(6002468,'03'),

(6002333,'03'),

(6002329,'03'),

(6002394,'03'),

(6002375,'03'),

(6002242,'03'),

(6000722,'03'),

(6000785,'03'),

(6002173,'03'),

(6002186,'03'),

(6002126,'03'),

(6002150,'03'),

(6002132,'03'),

(5997067,'03'),

(6002107,'03'),

(6002081,'03'),

(6002055,'03'),

(6002061,'03'),

(6001994,'03'),

(6001978,'03'),

(6001970,'03'),

(6001952,'03'),

(6001913,'03'),

(6001776,'03'),

(6001752,'03'),

(6001739,'03'),

(6001718,'03'),

(6001680,'03'),

(6001542,'03')










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





