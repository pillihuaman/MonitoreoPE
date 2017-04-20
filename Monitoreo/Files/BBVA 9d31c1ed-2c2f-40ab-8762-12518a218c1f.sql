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


(6269366,'03'),

(6269879,'03'),

(6269733,'03'),

(6269478,'03'),

(6269703,'03'),

(6269909,'03'),

(6268417,'03'),

(6268354,'03'),

(6268236,'03'),

(6269839,'03'),

(6269887,'03'),

(6268079,'03'),

(6269720,'03'),

(6269570,'03'),

(6269716,'03'),

(6269659,'03'),

(6269601,'03'),

(6269539,'03'),

(6268307,'03'),

(6268459,'03'),

(6267701,'03'),

(6268913,'03'),

(6267982,'03'),

(6267401,'03'),

(6268025,'03'),

(6269018,'03'),

(6267901,'03'),

(6268464,'03'),

(6268907,'03'),

(6268611,'03'),

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

(6265948,'03'),

(6270355,'03'),

(6264611,'03'),

(6269053,'03'),

(6270323,'03'),

(6270310,'03'),

(6270291,'03'),

(6270124,'03'),

(6270228,'03'),

(6260221,'03'),

(6270200,'03'),

(6270057,'03'),

(6269584,'03'),

(6250810,'03'),

(6270003,'03'),

(6270107,'03'),

(6270109,'03'),

(6270132,'03'),

(6270104,'03'),

(6266581,'03'),

(6270065,'03'),

(6266454,'03'),

(6268986,'03'),

(6270007,'03'),

(6269997,'03'),

(6269022,'03'),

(6269961,'03'),

(6269899,'03'),

(6267251,'03'),

(6269950,'03'),

(6269763,'03'),

(6269915,'03'),

(6269868,'03'),

(6269910,'03'),

(6269410,'03'),

(6269837,'03'),

(6268872,'03'),

(6259581,'03'),

(6269795,'03'),

(6266606,'03'),

(6269240,'03'),

(6269856,'03'),

(6265916,'03'),

(6269823,'03'),

(6269810,'03'),

(6269781,'03'),

(6269764,'03'),

(6269692,'03'),

(6269752,'03'),

(6269574,'03'),

(6269559,'03'),

(6264814,'03'),

(6260768,'03'),

(6257579,'03'),

(6269693,'03'),

(6268163,'03'),

(6269711,'03'),

(6269701,'03'),

(6261417,'03'),

(6269667,'03'),

(6260108,'03'),

(6269618,'03'),

(6269593,'03'),

(6269572,'03'),

(6269646,'03'),

(6269515,'03'),

(6269265,'03'),

(6269124,'03'),

(6269631,'03'),

(6269639,'03'),

(6269624,'03'),

(6269597,'03'),

(6269612,'03'),

(6221507,'03'),

(6269536,'03'),

(6269369,'03'),

(6269590,'03'),

(6269569,'03'),

(6269579,'03'),

(6269488,'03'),

(6269552,'03'),

(6269547,'03'),

(6269136,'03'),

(6263840,'03'),

(6269172,'03'),

(6269512,'03'),

(6269067,'03'),

(6268035,'03'),

(6267532,'03'),

(6259575,'03'),

(6267998,'03'),

(6269460,'03'),

(6269465,'03'),

(6269296,'03'),

(6269413,'03'),

(6267323,'03'),

(6269398,'03'),

(6269426,'03'),

(6269035,'03'),

(6269437,'03'),

(6269388,'03'),

(6269419,'03'),

(6269348,'03'),

(6268091,'03'),

(6268916,'03'),

(6269364,'03'),

(6269329,'03'),

(6269241,'03'),

(6269250,'03'),

(6266368,'03'),

(6269107,'03'),

(6268602,'03'),

(6269177,'03'),

(6269165,'03'),

(6269109,'03'),

(6268126,'03'),

(6245175,'03'),

(6269137,'03'),

(6267114,'03'),

(6269132,'03'),

(6268018,'03'),

(6264356,'03'),

(6266206,'03'),

(6269089,'03'),

(6269054,'03'),

(6269071,'03'),

(6269092,'03'),

(6268559,'03'),

(6268799,'03'),

(6268713,'03'),

(6267715,'03'),

(6265117,'03'),

(6268922,'03'),

(6268401,'03'),

(6268187,'03'),

(6268969,'03'),

(6268425,'03'),

(6268884,'03'),

(6268868,'03'),

(6268873,'03'),

(6268586,'03'),

(6268788,'03'),

(6268848,'03'),

(6268815,'03'),

(6265615,'03'),

(6268720,'03'),

(6268749,'03'),

(6265502,'03'),

(6268754,'03'),

(6268607,'03'),

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

(6265888,'03')










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





