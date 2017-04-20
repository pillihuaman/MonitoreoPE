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


(6271145,'02'),

(6270732,'02'),

(6269855,'02'),

(6269575,'02'),

(6266806,'02'),

(6267510,'02'),

(6267912,'02'),

(6270761,'02'),

(6266648,'02'),

(6268881,'02'),

(6268660,'02'),

(6271032,'02'),

(6270308,'02'),

(6270009,'02'),

(6269485,'02'),

(6268909,'02'),

(6268739,'02'),

(6262426,'02'),

(6265644,'02'),

(6268373,'02'),

(6266813,'02'),

(6266470,'02'),

(6266224,'02'),

(6266205,'02'),

(6269755,'02'),

(6268993,'02'),

(6271314,'02'),

(6270674,'02'),

(6270515,'02'),

(6269860,'02'),

(6268861,'02'),

(6268707,'02'),

(6270644,'02'),

(6270165,'02'),

(6269954,'02'),

(6269744,'02'),

(6269741,'02'),

(6269188,'02'),

(6269138,'02'),

(6268857,'02'),

(6268816,'02'),

(6267840,'02'),

(6267638,'02'),

(6266748,'02'),

(6266411,'02'),

(6271433,'02'),

(6266761,'02'),

(6270577,'02'),

(6270822,'02'),

(6270220,'02'),

(6269403,'02'),

(6267899,'02'),

(6267646,'02'),

(6270824,'02'),

(6270906,'02'),

(6270257,'02'),

(6271294,'02'),

(6268652,'02'),

(6269647,'02'),

(6271147,'02'),

(6269859,'02'),

(6266679,'02'),

(6270600,'02'),

(6268338,'02'),

(6267874,'02'),

(6267894,'02'),

(6267559,'02'),

(6270731,'02'),

(6267717,'02'),

(6266766,'02'),

(6270907,'02'),

(6267094,'02'),

(6266990,'02'),

(6267092,'02'),

(6270434,'02'),

(6267809,'02'),

(6266764,'02'),

(6271049,'02'),

(6270573,'02'),

(6270069,'02'),

(6270095,'02'),

(6269267,'02'),

(6267708,'02'),

(6267290,'02'),

(6266265,'02'),

(6269690,'02'),

(6268577,'02'),

(6267550,'02'),

(6267603,'02'),

(6270568,'02'),

(6268606,'02'),

(6270499,'02'),

(6268997,'02'),

(6271315,'02'),

(6270477,'02'),

(6269635,'02'),

(6266769,'02'),

(6266250,'02'),

(6269161,'02'),

(6269206,'02'),

(6266657,'02'),

(6268770,'02'),

(6269094,'02'),

(6266759,'02'),

(6267694,'02'),

(6266849,'02'),

(6267828,'02'),

(6267464,'02'),

(6270627,'02'),

(6268212,'02'),

(6267268,'02'),

(6267857,'02'),

(6267748,'02'),

(6268492,'02'),

(6267734,'02'),

(6266495,'02'),

(6271024,'02'),

(6270401,'02'),

(6269824,'02'),

(6269449,'02'),

(6269239,'02'),

(6266765,'02'),

(6270022,'02'),

(6269931,'02'),

(6269156,'02'),

(6267453,'02'),

(6266871,'02'),

(6266846,'02'),

(6266814,'02'),

(6267967,'02'),

(6266850,'02'),

(6268626,'02'),

(6270281,'02'),

(6269300,'02'),

(6271079,'02'),

(6266747,'02'),

(6267354,'02'),

(6270014,'02'),

(6270519,'02'),

(6266834,'02'),

(6267148,'02'),

(6267085,'02'),

(6270807,'02'),

(6267050,'02'),

(6268796,'02'),

(6270078,'02'),

(6267482,'02'),

(6270100,'02'),

(6267470,'02'),

(6267759,'02'),

(6271277,'02'),

(6271139,'02'),

(6267072,'02'),

(6269264,'02'),

(6266827,'02'),

(6269093,'02'),

(6271194,'02'),

(6268249,'02'),

(6268264,'02'),

(6270704,'02'),

(6268000,'02'),

(6267037,'02'),

(6270470,'02'),

(6269057,'02'),

(6267637,'02'),

(6267601,'02'),

(6267388,'02'),

(6264830,'02'),

(6267843,'02'),

(6268209,'02'),

(6267676,'02'),

(6270059,'02'),

(6267344,'02'),

(6266444,'02'),

(6268538,'02'),

(6267867,'02'),

(6270556,'02'),

(6267844,'02'),

(6269679,'02'),

(6266053,'02'),

(6270853,'02'),

(6267209,'02'),

(6268180,'02'),

(6267763,'02'),

(6268418,'02'),

(6268174,'02'),

(6267664,'02'),

(6268217,'02'),

(6270998,'02'),

(6269490,'02'),

(6270415,'02'),

(6270855,'02'),

(6268358,'02'),

(6269589,'02'),

(6268106,'02'),

(6267794,'02'),

(6270256,'02'),

(6270289,'02'),

(6267790,'02'),

(6270839,'02'),

(6260727,'02'),

(6260721,'02'),

(6267353,'02'),

(6270435,'02'),

(6265954,'02'),

(6266864,'02'),

(6271145,'02'),

(6270732,'02'),

(6269855,'02'),

(6269575,'02'),

(6266806,'02'),

(6267510,'02'),

(6267912,'02'),

(6270761,'02'),

(6266648,'02'),

(6268881,'02'),

(6268660,'02'),

(6271032,'02'),

(6270308,'02'),

(6270009,'02'),

(6269485,'02'),

(6268909,'02'),

(6268739,'02'),

(6262426,'02'),

(6265644,'02'),

(6268373,'02'),

(6266813,'02'),

(6266470,'02'),

(6266224,'02'),

(6266205,'02'),

(6269755,'02'),

(6268993,'02'),

(6271314,'02'),

(6270674,'02'),

(6270515,'02'),

(6269860,'02'),

(6268861,'02'),

(6268707,'02'),

(6270644,'02'),

(6270165,'02'),

(6269954,'02'),

(6269744,'02'),

(6269741,'02'),

(6269188,'02'),

(6269138,'02'),

(6268857,'02'),

(6268816,'02'),

(6267840,'02'),

(6267638,'02'),

(6266748,'02'),

(6266411,'02'),

(6271433,'02'),

(6266761,'02'),

(6270577,'02'),

(6270822,'02'),

(6270220,'02'),

(6269403,'02'),

(6267899,'02'),

(6267646,'02'),

(6270824,'02'),

(6270906,'02'),

(6270257,'02'),

(6271294,'02'),

(6268652,'02'),

(6269647,'02'),

(6271147,'02'),

(6269859,'02'),

(6266679,'02'),

(6270600,'02'),

(6268338,'02'),

(6267874,'02'),

(6267894,'02'),

(6267559,'02'),

(6270731,'02'),

(6267717,'02'),

(6266766,'02'),

(6270907,'02'),

(6267094,'02'),

(6266990,'02'),

(6267092,'02'),

(6270434,'02'),

(6267809,'02'),

(6266764,'02'),

(6271049,'02'),

(6270573,'02'),

(6270069,'02'),

(6270095,'02'),

(6269267,'02'),

(6267708,'02'),

(6267290,'02'),

(6266265,'02'),

(6269690,'02'),

(6268577,'02'),

(6267550,'02'),

(6267603,'02'),

(6270568,'02'),

(6268606,'02'),

(6270499,'02'),

(6268997,'02'),

(6271315,'02'),

(6270477,'02'),

(6269635,'02'),

(6266769,'02'),

(6266250,'02'),

(6269161,'02'),

(6269206,'02'),

(6266657,'02'),

(6268770,'02'),

(6269094,'02'),

(6266759,'02'),

(6267694,'02'),

(6266849,'02'),

(6267828,'02'),

(6267464,'02'),

(6270627,'02'),

(6268212,'02'),

(6267268,'02'),

(6267857,'02'),

(6267748,'02'),

(6268492,'02'),

(6267734,'02'),

(6266495,'02'),

(6271024,'02'),

(6270401,'02'),

(6269824,'02'),

(6269449,'02'),

(6269239,'02'),

(6266765,'02'),

(6270022,'02'),

(6269931,'02'),

(6269156,'02'),

(6267453,'02'),

(6266871,'02'),

(6266846,'02'),

(6266814,'02'),

(6267967,'02'),

(6266850,'02'),

(6268626,'02'),

(6270281,'02'),

(6269300,'02'),

(6271079,'02'),

(6266747,'02'),

(6267354,'02'),

(6270014,'02'),

(6270519,'02'),

(6266834,'02'),

(6267148,'02'),

(6267085,'02'),

(6270807,'02'),

(6267050,'02'),

(6268796,'02'),

(6270078,'02'),

(6267482,'02'),

(6270100,'02'),

(6267470,'02'),

(6267759,'02'),

(6271277,'02'),

(6271139,'02'),

(6267072,'02'),

(6269264,'02'),

(6266827,'02'),

(6269093,'02'),

(6271194,'02'),

(6268249,'02'),

(6268264,'02'),

(6270704,'02'),

(6268000,'02'),

(6267037,'02'),

(6270470,'02'),

(6269057,'02'),

(6267637,'02'),

(6267601,'02'),

(6267388,'02'),

(6264830,'02'),

(6267843,'02'),

(6268209,'02'),

(6267676,'02'),

(6270059,'02'),

(6267344,'02'),

(6266444,'02'),

(6268538,'02'),

(6267867,'02'),

(6270556,'02'),

(6267844,'02'),

(6269679,'02'),

(6266053,'02'),

(6270853,'02'),

(6267209,'02'),

(6268180,'02'),

(6267763,'02'),

(6268418,'02'),

(6268174,'02'),

(6267664,'02'),

(6268217,'02'),

(6270998,'02'),

(6269490,'02'),

(6270415,'02'),

(6270855,'02'),

(6268358,'02'),

(6269589,'02'),

(6268106,'02'),

(6267794,'02'),

(6270256,'02'),

(6270289,'02'),

(6267790,'02'),

(6270839,'02'),

(6260727,'02'),

(6260721,'02'),

(6267353,'02'),

(6270435,'02'),

(6265954,'02'),

(6266864,'02')










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





