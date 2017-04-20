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


(6262298,'05'),

(6262482,'05'),

(6262441,'05'),

(6262401,'05'),

(6261555,'05'),

(6263515,'05'),

(6256389,'05'),

(6259463,'05'),

(6261414,'05'),

(6261615,'05'),

(6258927,'05'),

(6258866,'05'),

(6261012,'05'),

(6259098,'05'),

(6260408,'05'),

(6263392,'05'),

(6262041,'05'),

(6259656,'05'),

(6259457,'05'),

(6260746,'05'),

(6259759,'05'),

(6262551,'05'),

(6260501,'05'),

(6258535,'05'),

(6259821,'05'),

(6261789,'05'),

(6262267,'05'),

(6258919,'05'),

(6260671,'05'),

(6258759,'05'),

(6258386,'05'),

(6263068,'05'),

(6263128,'05'),

(6230729,'05'),

(6230751,'05'),

(6243827,'05'),

(6257684,'05'),

(6257723,'05'),

(6257737,'05'),

(6257756,'05'),

(6258560,'05'),

(6259106,'05'),

(6260530,'05'),

(6260875,'05'),

(6261070,'05'),

(6261169,'05'),

(6262624,'05'),

(6263111,'05'),

(6263039,'05'),

(6263180,'05'),

(6262645,'05'),

(6259949,'05'),

(6260815,'05'),

(6260019,'05'),

(6259183,'05'),

(6256886,'05'),

(6261871,'05'),

(6254571,'05'),

(6261938,'05'),

(6257013,'05'),

(6262687,'05'),

(6262714,'05'),

(6257113,'05'),

(6263507,'05'),

(6256451,'05'),

(6262079,'05'),

(6257979,'05'),

(6257139,'05'),

(6263297,'05'),

(6259365,'05'),

(6262415,'05'),

(6261642,'05'),

(6257062,'05'),

(6260396,'05'),

(6261363,'05'),

(6259544,'05'),

(6260486,'05'),

(6260653,'05'),

(6261029,'05'),

(6259628,'05'),

(6262483,'05'),

(6252702,'05'),

(6258365,'05'),

(6257958,'05'),

(6257797,'05'),

(6257995,'05'),

(6260987,'05'),

(6261435,'05'),

(6262744,'05'),

(6258140,'05'),

(6261799,'05'),

(6260571,'05'),

(6257695,'05'),

(6263289,'05'),

(6259188,'05'),

(6259225,'05'),

(6262170,'05'),

(6259995,'05'),

(6256268,'05'),

(6260720,'05'),

(6263171,'05'),

(6258070,'05'),

(6261032,'05'),

(6261704,'05'),

(6249806,'05'),

(6261245,'05'),

(6261959,'05'),

(6258122,'05'),

(6260201,'05'),

(6260413,'05'),

(6260909,'05'),

(6262160,'05'),

(6260454,'05'),

(6260617,'05'),

(6261119,'05'),

(6262594,'05'),

(6259914,'05'),

(6261652,'05'),

(6262733,'05'),

(6257738,'05'),

(6256100,'05'),

(6256141,'05'),

(6256174,'05'),

(6258985,'05'),

(6258407,'05'),

(6259653,'05'),

(6258316,'05'),

(6259887,'05'),

(6261134,'05'),

(6262558,'05'),

(6259454,'05'),

(6262665,'05'),

(6261631,'05'),

(6261331,'05'),

(6263661,'05'),

(6257914,'05'),

(6258430,'05'),

(6261189,'05'),

(6260665,'05'),

(6259439,'05'),

(6260989,'05'),

(6260561,'05'),

(6262110,'05'),

(6262013,'05'),

(6259271,'05'),

(6262340,'05'),

(6260676,'05'),

(6253866,'05'),

(6260876,'05'),

(6262866,'05'),

(6261258,'05'),

(6261166,'05'),

(6255300,'05'),

(6255324,'05'),

(6255510,'05'),

(6255640,'05'),

(6262121,'05'),

(6260931,'05'),

(6261541,'05'),

(6257559,'05'),

(6255323,'05'),

(6256988,'05'),

(6261603,'05'),

(6262552,'05'),

(6261433,'05'),

(6260612,'05'),

(6261516,'05'),

(6261203,'05'),

(6256399,'05'),

(6257287,'05'),

(6253036,'05'),

(6253510,'05'),

(6259750,'05'),

(6259538,'05'),

(6262759,'05'),

(6253575,'05'),

(6261934,'05'),

(6263518,'05'),

(6263656,'05'),

(6257689,'05'),

(6257722,'05'),

(6262622,'05'),

(6259527,'05'),

(6259569,'05'),

(6237667,'05'),

(6255699,'05'),

(6255765,'05'),

(6255805,'05'),

(6256011,'05'),

(6255932,'05'),

(6256293,'05'),

(6260952,'05'),

(6262053,'05'),

(6257727,'05'),

(6258317,'05')










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





