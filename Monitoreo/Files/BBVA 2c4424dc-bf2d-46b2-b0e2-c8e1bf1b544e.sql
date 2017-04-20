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


(6263654,'03'),

(6263093,'03'),

(6263489,'03'),

(6261327,'03'),

(6262658,'03'),

(6262699,'03'),

(6263432,'03'),

(6262325,'03'),

(6263333,'03'),

(6260029,'03'),

(6263259,'03'),

(6262437,'03'),

(6262419,'03'),

(6262676,'03'),

(6262859,'03'),

(6262779,'03'),

(6262425,'03'),

(6261409,'03'),

(6261270,'03'),

(6260844,'03'),

(6261701,'03'),

(6262339,'03'),

(6260522,'03'),

(6261812,'03'),

(6262202,'03'),

(6261277,'03'),

(6260248,'03'),

(6261740,'03'),

(6262019,'03'),

(6261328,'03'),

(6261921,'03'),

(6261805,'03'),

(6261869,'03'),

(6261074,'03'),

(6261026,'03'),

(6261150,'03'),

(6261211,'03'),

(6261847,'03'),

(6261259,'03'),

(6261297,'03'),

(6261695,'03'),

(6255759,'03'),

(6261374,'03'),

(6259687,'03'),

(6259875,'03'),

(6260313,'03'),

(6260129,'03'),

(6260198,'03'),

(6260519,'03'),

(6258988,'03'),

(6261045,'03'),

(6260507,'03'),

(6259953,'03'),

(6260921,'03'),

(6260838,'03'),

(6260426,'03'),

(6260343,'03'),

(6260600,'03'),

(6259707,'03'),

(6260540,'03'),

(6260469,'03'),

(6259841,'03'),

(6259816,'03'),

(6258864,'03'),

(6259487,'03'),

(6259948,'03'),

(6259785,'03'),

(6259853,'03'),

(6259533,'03'),

(6259097,'03'),

(6259394,'03'),

(6258326,'03'),

(6259301,'03'),

(6259148,'03'),

(6259062,'03'),

(6258992,'03'),

(6258778,'03'),

(6257714,'03'),

(6258389,'03'),

(6263679,'03'),

(6262294,'03'),

(6219085,'03'),

(6263460,'03'),

(6262012,'03'),

(6260823,'03'),

(6263612,'03'),

(6258318,'03'),

(6263365,'03'),

(6263549,'03'),

(6260933,'03'),

(6261985,'03'),

(6263524,'03'),

(6263096,'03'),

(6263412,'03'),

(6263481,'03'),

(6263086,'03'),

(6247325,'03'),

(6263334,'03'),

(6263367,'03'),

(6261682,'03'),

(6262303,'03'),

(6262523,'03'),

(6255055,'03'),

(6263234,'03'),

(6263298,'03'),

(6263018,'03'),

(6263260,'03'),

(6263164,'03'),

(6263268,'03'),

(6263237,'03'),

(6263267,'03'),

(6263136,'03'),

(6263188,'03'),

(6261494,'03'),

(6260840,'03'),

(6263209,'03'),

(6263192,'03'),

(6256056,'03'),

(6263055,'03'),

(6262999,'03'),

(6255359,'03'),

(6258556,'03'),

(6263067,'03'),

(6262922,'03'),

(6263097,'03'),

(6254385,'03'),

(6253021,'03'),

(6254401,'03'),

(6263030,'03'),

(6263027,'03'),

(6254407,'03'),

(6254340,'03'),

(6248510,'03'),

(6262834,'03'),

(6261993,'03'),

(6262903,'03'),

(6262902,'03'),

(6262271,'03'),

(6262671,'03'),

(6262856,'03'),

(6262659,'03'),

(6254842,'03'),

(6262814,'03'),

(6262795,'03'),

(6261142,'03'),

(6261122,'03'),

(6262669,'03'),

(6262600,'03'),

(6261837,'03'),

(6233342,'03'),

(6261370,'03'),

(6262582,'03'),

(6257740,'03'),

(6262177,'03'),

(6262549,'03'),

(6262531,'03'),

(6257810,'03'),

(6262429,'03'),

(6261995,'03'),

(6260542,'03'),

(6262428,'03'),

(6262389,'03'),

(6253390,'03'),

(6233348,'03'),

(6262391,'03'),

(6262385,'03'),

(6254608,'03'),

(6262319,'03'),

(6262124,'03'),

(6262359,'03'),

(6258503,'03'),

(6262342,'03'),

(6262297,'03'),

(6262296,'03'),

(6262268,'03'),

(6262282,'03'),

(6260067,'03'),

(6262280,'03'),

(6259299,'03'),

(6261239,'03'),

(6262254,'03'),

(6262147,'03'),

(6262228,'03'),

(6262169,'03'),

(6262158,'03'),

(6256306,'03'),

(6262094,'03'),

(6262096,'03'),

(6262109,'03'),

(6262104,'03'),

(6262100,'03'),

(6262113,'03'),

(6262062,'03'),

(6262080,'03'),

(6262057,'03'),

(6262068,'03'),

(6261689,'03'),

(6262037,'03'),

(6262034,'03'),

(6262018,'03'),

(6262009,'03'),

(6261996,'03'),

(6261977,'03'),

(6261886,'03'),

(6261949,'03'),

(6261947,'03'),

(6261930,'03'),

(6261924,'03'),

(6261915,'03'),

(6261875,'03'),

(6261595,'03'),

(6261911,'03'),

(6261832,'03'),

(6261671,'03'),

(6261883,'03'),

(6233302,'03'),

(6261437,'03'),

(6261865,'03'),

(6261813,'03'),

(6261788,'03'),

(6261814,'03'),

(6259298,'03'),

(6261800,'03'),

(6261735,'03'),

(6261743,'03'),

(6261712,'03'),

(6261737,'03'),

(6261752,'03'),

(6261749,'03'),

(6260743,'03'),

(6261738,'03'),

(6261741,'03'),

(6246490,'03'),

(6260833,'03'),

(6261677,'03'),

(6151011,'03'),

(6261660,'03'),

(6261633,'03'),

(6261601,'03'),

(6261592,'03'),

(6259069,'03'),

(6261522,'03'),

(6260537,'03'),

(6259896,'03'),

(6261538,'03'),

(6261543,'03'),

(6261544,'03'),

(6261511,'03'),

(6256189,'03'),

(6261483,'03'),

(6261450,'03'),

(6261476,'03'),

(6261419,'03'),

(6128081,'03'),

(6261337,'03'),

(6238457,'03'),

(6260020,'03'),

(6261355,'03'),

(6259295,'03'),

(6261313,'03'),

(6261272,'03'),

(6260270,'03'),

(6261295,'03'),

(6261212,'03'),

(6259447,'03'),

(6261284,'03'),

(6260920,'03'),

(6261115,'03'),

(6261006,'03'),

(6261202,'03'),

(6259113,'03'),

(6261132,'03'),

(6248681,'03'),

(6261094,'03'),

(6261004,'03'),

(6261068,'03'),

(6260880,'03'),

(6260995,'03'),

(6259489,'03'),

(6260978,'03'),

(6260548,'03'),

(6260904,'03'),

(6234831,'03'),

(6259690,'03'),

(6260831,'03'),

(6260824,'03'),

(6260691,'03'),

(6257935,'03'),

(6260663,'03'),

(6260740,'03'),

(6260706,'03'),

(6260681,'03'),

(6260170,'03'),

(6255313,'03'),

(6260541,'03'),

(6260677,'03'),

(6260624,'03'),

(6260585,'03'),

(6260514,'03'),

(6259099,'03'),

(6260584,'03'),

(6260508,'03'),

(6259043,'03'),

(6260551,'03'),

(6259020,'03'),

(6258990,'03'),

(6258612,'03'),

(6255961,'03'),

(6260490,'03'),

(6260354,'03'),

(6260460,'03'),

(6260452,'03'),

(6260411,'03'),

(6260420,'03'),

(6260311,'03'),

(6260330,'03'),

(6260355,'03'),

(6258188,'03'),

(6259970,'03'),

(6251273,'03'),

(6260264,'03'),

(6259861,'03'),

(6260245,'03'),

(6260223,'03'),

(6257345,'03'),

(6260044,'03'),

(6260045,'03'),

(6258345,'03'),

(6258058,'03'),

(6259784,'03'),

(6260059,'03'),

(6259285,'03'),

(6259885,'03'),

(6259353,'03'),

(6259837,'03'),

(6259436,'03'),

(6259976,'03'),

(6259883,'03'),

(6259923,'03'),

(6259882,'03'),

(6259393,'03'),

(6258163,'03'),

(6259326,'03'),

(6259823,'03'),

(6259810,'03'),

(6258527,'03'),

(6259794,'03'),

(6259805,'03'),

(6259803,'03'),

(6259689,'03'),

(6259811,'03'),

(6259220,'03'),

(6259804,'03'),

(6259460,'03'),

(6259772,'03'),

(6259763,'03'),

(6259658,'03'),

(6259685,'03'),

(6259592,'03'),

(6259153,'03'),

(6259654,'03'),

(6259036,'03'),

(6259624,'03'),

(6253663,'03'),

(6259372,'03'),

(6259572,'03'),

(6259591,'03'),

(6259484,'03'),

(6259541,'03'),

(6259529,'03'),

(6259501,'03'),

(6257667,'03'),

(6257292,'03'),

(6259399,'03'),

(6259417,'03'),

(6257069,'03'),

(6258807,'03'),

(6258093,'03'),

(6259391,'03'),

(6259314,'03'),

(6259348,'03'),

(6259371,'03'),

(6259070,'03'),

(6259297,'03'),

(6259252,'03'),

(6259283,'03'),

(6259241,'03'),

(6254894,'03'),

(6259238,'03'),

(6257486,'03'),

(6259091,'03'),

(6259237,'03'),

(6259195,'03'),

(6259190,'03'),

(6259176,'03'),

(6259158,'03'),

(6259145,'03'),

(6259118,'03'),

(6259132,'03'),

(6259142,'03'),

(6259094,'03'),

(6259103,'03'),

(6258958,'03'),

(6259008,'03'),

(6258945,'03'),

(6258947,'03'),

(6258936,'03'),

(6258898,'03'),

(6258873,'03'),

(6258271,'03'),

(6258815,'03'),

(6258702,'03'),

(6258552,'03'),

(6258419,'03'),

(6258433,'03'),

(6258431,'03'),

(6258402,'03'),

(6258391,'03'),

(6258374,'03'),

(6258321,'03'),

(6258219,'03'),

(6258356,'03')










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





