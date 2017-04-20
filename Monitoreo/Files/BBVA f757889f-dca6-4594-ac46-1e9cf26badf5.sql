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


(6268647,'03'),

(6267233,'03'),

(6268620,'03'),

(6268623,'03'),

(6268223,'03'),

(6268269,'03'),

(6268600,'03'),

(6265764,'03'),

(6267590,'03'),

(6265320,'03'),

(6268535,'03'),

(6259483,'03'),

(6267904,'03'),

(6267672,'03'),

(6266817,'03'),

(6267835,'03'),

(6186291,'03'),

(6268408,'03'),

(6259505,'03'),

(6267340,'03'),

(6264281,'03'),

(6268267,'03'),

(6268263,'03'),

(6266675,'03'),

(6268304,'03'),

(6266741,'03'),

(6266712,'03'),

(6266699,'03'),

(6266644,'03'),

(6236252,'03'),

(6266755,'03'),

(6264524,'03'),

(6268268,'03'),

(6265326,'03'),

(6268008,'03'),

(6268199,'03'),

(6268138,'03'),

(6268144,'03'),

(6268140,'03'),

(6262792,'03'),

(6267274,'03'),

(6264533,'03'),

(6268044,'03'),

(6268022,'03'),

(6233316,'03'),

(6266109,'03'),

(6267530,'03'),

(6267936,'03'),

(6218774,'03'),

(6267930,'03'),

(6267721,'03'),

(6267902,'03'),

(6249741,'03'),

(6267195,'03'),

(6254170,'03'),

(6266946,'03'),

(6267488,'03'),

(6267804,'03'),

(6267567,'03'),

(6267785,'03'),

(6267650,'03'),

(6267772,'03'),

(6266801,'03'),

(6267801,'03'),

(6267448,'03'),

(6267778,'03'),

(6267133,'03'),

(6267263,'03'),

(6263848,'03'),

(6267726,'03'),

(6264920,'03'),

(6267705,'03'),

(6267366,'03'),

(6223637,'03'),

(6267505,'03'),

(6264301,'03'),

(6267437,'03'),

(6267523,'03'),

(6267518,'03'),

(6265656,'03'),

(6267234,'03'),

(6267498,'03'),

(6265692,'03'),

(6266788,'03'),

(6266283,'03'),

(6266783,'03'),

(6267269,'03'),

(6263022,'03'),

(6267477,'03'),

(6260361,'03'),

(6267421,'03'),

(6267413,'03'),

(6267429,'03'),

(6266457,'03'),

(6266957,'03'),

(6267390,'03'),

(6264657,'03'),

(6265220,'03'),

(6267371,'03'),

(6267352,'03'),

(6267327,'03'),

(6267244,'03'),

(6267304,'03'),

(6267254,'03'),

(6267259,'03'),

(6266956,'03'),

(6267235,'03'),

(6265090,'03'),

(6267214,'03'),

(6267001,'03'),

(6264344,'03'),

(6266972,'03'),

(6266982,'03'),

(6266966,'03'),

(6265172,'03'),

(6267186,'03'),

(6265996,'03'),

(6267119,'03'),

(6266923,'03'),

(6267111,'03'),

(6267011,'03'),

(6267057,'03'),

(6267027,'03'),

(6267059,'03'),

(6264402,'03'),

(6266870,'03'),

(6266995,'03'),

(6266958,'03'),

(6266943,'03'),

(6266914,'03'),

(6266883,'03'),

(6265441,'03'),

(6266889,'03'),

(6266795,'03'),

(6261665,'03'),

(6266757,'03'),

(6265550,'03'),

(6266702,'03'),

(6265314,'03'),

(6265867,'03'),

(6262794,'03'),

(6266633,'03'),

(6266583,'03'),

(6265492,'03'),

(6266521,'03'),

(6262957,'03'),

(6265859,'03'),

(6265404,'03'),

(6265286,'03'),

(6265231,'03'),

(6266162,'03'),

(6266147,'03'),

(6266119,'03'),

(6266127,'03'),

(6266125,'03'),

(6265530,'03'),

(6266066,'03'),

(6266033,'03'),

(6266026,'03'),

(6265997,'03'),

(6265307,'03'),

(6265864,'03'),

(6265457,'03'),

(6265911,'03'),

(6265180,'03'),

(6265950,'03'),

(6265888,'03'),

(6267847,'03'),

(6265310,'03'),

(6268444,'03'),

(6267030,'03'),

(6268115,'03'),

(6268087,'03'),

(6268013,'03'),

(6267916,'03'),

(6267827,'03'),

(6267888,'03'),

(6267946,'03'),

(6267724,'03'),

(6267683,'03'),

(6267257,'03'),

(6266629,'03'),

(6265577,'03'),

(6267145,'03'),

(6266929,'03'),

(6266993,'03'),

(6267212,'03'),

(6266822,'03'),

(6266800,'03'),

(6266556,'03'),

(6266549,'03'),

(6265130,'03'),

(6266099,'03'),

(6266064,'03'),

(6266001,'03'),

(6265685,'03'),

(6265471,'03'),

(6265948,'03')










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





