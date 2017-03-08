use  BDPagoEfectivoReplicaCore


Declare @Fecha date, @B1 char(2),@B2 char(2),@B3 char(2),@B4 char(2),@B5 char(2);


Set @Fecha=getdate()


select	


@B1='05'

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


(6004159,'05'),

(6002591,'05'),

(6006930,'05'),

(6001317,'05'),

(6005822,'05'),

(6005423,'05'),

(6004320,'05'),

(6004518,'05'),

(6005425,'05'),

(6003712,'05'),

(6002597,'05'),

(6005782,'05'),

(6003564,'05'),

(6001503,'05'),

(6003950,'05'),

(6004687,'05'),

(6002068,'05'),

(6005800,'05'),

(6005639,'05'),

(6003933,'05'),

(6006832,'05'),

(6004829,'05'),

(6005669,'05'),

(6002573,'05'),

(6001227,'05'),

(6002034,'05'),

(6003106,'05'),

(6005469,'05'),

(6005765,'05'),

(6005865,'05'),

(6005926,'05'),

(5915017,'05'),

(5962866,'05'),

(5968874,'05'),

(5987423,'05'),

(6001758,'05'),

(6002070,'05'),

(6002257,'05'),

(6002266,'05'),

(6002281,'05'),

(6002397,'05'),

(6002709,'05'),

(6003785,'05'),

(6004427,'05'),

(6006167,'05'),

(6004529,'05'),

(6004863,'05'),

(6003413,'05'),

(6003946,'05'),

(6004249,'05'),

(6005019,'05'),

(6003494,'05'),

(6006679,'05'),

(6006108,'05'),

(6006464,'05'),

(5999328,'05'),

(6002080,'05'),

(6002952,'05'),

(6002980,'05'),

(6000741,'05'),

(6006490,'05'),

(6004480,'05'),

(6004251,'05'),

(6003927,'05'),

(6006400,'05'),

(5998674,'05'),

(6004030,'05'),

(6005471,'05'),

(5999469,'05'),

(6005308,'05'),

(5997309,'05'),

(6003878,'05'),

(6004996,'05'),

(5999583,'05'),

(5999677,'05'),

(6002100,'05'),

(6000388,'05'),

(6001673,'05'),

(6005260,'05'),

(6005663,'05'),

(6006322,'05'),

(6006354,'05'),

(6002386,'05'),

(6006863,'05'),

(6006097,'05'),

(6002093,'05'),

(6002816,'05'),

(5989793,'05'),

(6003254,'05'),

(6001516,'05'),

(6003746,'05'),

(6002178,'05'),

(6002320,'05'),

(6003876,'05'),

(6002040,'05'),

(6003655,'05'),

(6005055,'05'),

(6001126,'05'),

(6000353,'05'),

(6004935,'05'),

(6003243,'05'),

(6004747,'05'),

(6003989,'05'),

(6002224,'05'),

(6001283,'05'),

(6005878,'05'),

(6003796,'05'),

(5999440,'05'),

(6006387,'05'),

(6001371,'05'),

(6006110,'05'),

(6006545,'05'),

(6006650,'05'),

(6006859,'05'),

(6006336,'05'),

(6002513,'05'),

(6005452,'05'),

(6003590,'05'),

(6001400,'05'),

(6006597,'05'),

(6002782,'05'),

(6004774,'05'),

(6006880,'05'),

(5990601,'05'),

(6001976,'05'),

(6006335,'05'),

(6003123,'05'),

(6003760,'05'),

(6002715,'05'),

(6004650,'05'),

(6000077,'05'),

(6006892,'05'),

(5998402,'05'),

(5998432,'05'),

(5998459,'05'),

(5998579,'05'),

(5998726,'05'),

(5998800,'05'),

(5998824,'05'),

(6005670,'05'),

(6003337,'05'),

(6003055,'05'),

(5997961,'05'),

(6004216,'05'),

(6004456,'05'),

(6002843,'05'),

(6002844,'05'),

(6005387,'05'),

(6002613,'05'),

(6004541,'05'),

(6005382,'05'),

(6002157,'05'),

(6006502,'05'),

(6001529,'05'),

(6004945,'05'),

(6004224,'05'),

(6005739,'05'),

(6005998,'05'),

(6002905,'05'),

(6001019,'05'),

(5954299,'05'),

(6002610,'05'),

(6006677,'05'),

(5997931,'05'),

(5998272,'05'),

(5998301,'05'),

(5994739,'05'),

(6005104,'05'),

(6004340,'05'),

(6003041,'05'),

(6004157,'05'),

(6001243,'05'),

(6002786,'05'),

(6004899,'05'),

(6006809,'05'),

(6003271,'05'),

(6004956,'05'),

(5992155,'05'),

(6001950,'05'),

(6005656,'05'),

(6005454,'05'),

(6001923,'05'),

(6003276,'05'),

(6002710,'05'),

(5996993,'05'),

(6003554,'05'),

(6005393,'05'),

(6003885,'05'),

(6000866,'05'),

(6001156,'05'),

(6001603,'05'),

(6001571,'05'),

(6006357,'05'),

(6001837,'05'),

(6004114,'05'),

(6003509,'05'),

(6006949,'05'),

(6004622,'05'),

(6004635,'05'),

(5999443,'05'),

(6002694,'05'),

(6002545,'05'),

(6005519,'05'),

(6005733,'05'),

(6001395,'05')










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





