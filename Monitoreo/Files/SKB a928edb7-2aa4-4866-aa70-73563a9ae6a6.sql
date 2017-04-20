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


(6267644,'05'),

(6267730,'05'),

(6269380,'05'),

(6269015,'05'),

(6268237,'05'),

(6269234,'05'),

(6269939,'05'),

(6268854,'05'),

(6268565,'05'),

(6268092,'05'),

(6254604,'05'),

(6267768,'05'),

(6267435,'05'),

(6269848,'05'),

(6268131,'05'),

(6267009,'05'),

(6266032,'05'),

(6270351,'05'),

(6266605,'05'),

(6269148,'05'),

(6266927,'05'),

(6267360,'05'),

(6270578,'05'),

(6270206,'05'),

(6268240,'05'),

(6270326,'05'),

(6269424,'05'),

(6269651,'05'),

(6266893,'05'),

(6267961,'05'),

(6267416,'05'),

(6267869,'05'),

(6268344,'05'),

(6268440,'05'),

(6266538,'05'),

(6268402,'05'),

(6264012,'05'),

(6268665,'05'),

(6268930,'05'),

(6269237,'05'),

(6270550,'05'),

(6270924,'05'),

(6219108,'05'),

(6259836,'05'),

(6264695,'05'),

(6265620,'05'),

(6266467,'05'),

(6266676,'05'),

(6267317,'05'),

(6270156,'05'),

(6270163,'05'),

(6270168,'05'),

(6270172,'05'),

(6271304,'05'),

(6271377,'05'),

(6267450,'05'),

(6266922,'05'),

(6270039,'05'),

(6266707,'05'),

(6268203,'05'),

(6269578,'05'),

(6270209,'05'),

(6268480,'05'),

(6254438,'05'),

(6267642,'05'),

(6266830,'05'),

(6266069,'05'),

(6267334,'05'),

(6269078,'05'),

(6269286,'05'),

(6257118,'05'),

(6268449,'05'),

(6268536,'05'),

(6268612,'05'),

(6264383,'05'),

(6269481,'05'),

(6271285,'05'),

(6270643,'05'),

(6259406,'05'),

(6265269,'05'),

(6270947,'05'),

(6264134,'05'),

(6264571,'05'),

(6270738,'05'),

(6264700,'05'),

(6264717,'05'),

(6235698,'05'),

(6267656,'05'),

(6267619,'05'),

(6268377,'05'),

(6267972,'05'),

(6265511,'05'),

(6265541,'05'),

(6270304,'05'),

(6268847,'05'),

(6267044,'05'),

(6269339,'05'),

(6269600,'05'),

(6271004,'05'),

(6267651,'05'),

(6250347,'05'),

(6267822,'05'),

(6267081,'05'),

(6263649,'05'),

(6269517,'05'),

(6269615,'05'),

(6267744,'05'),

(6269327,'05'),

(6265673,'05'),

(6266758,'05'),

(6268383,'05'),

(6267521,'05'),

(6271293,'05'),

(6258215,'05'),

(6270072,'05'),

(6269253,'05'),

(6264956,'05'),

(6260290,'05'),

(6257079,'05'),

(6262312,'05'),

(6270154,'05'),

(6270208,'05'),

(6270001,'05'),

(6265568,'05'),

(6265719,'05'),

(6265896,'05'),

(6268443,'05'),

(6267129,'05'),

(6256540,'05'),

(6264674,'05'),

(6267172,'05'),

(6267181,'05'),

(6269819,'05'),

(6270343,'05'),

(6268933,'05'),

(6268601,'05'),

(6267238,'05'),

(6268689,'05'),

(6268434,'05'),

(6270944,'05'),

(6267455,'05'),

(6268498,'05'),

(6266892,'05'),

(6269694,'05'),

(6264111,'05'),

(6243137,'05'),

(6269495,'05'),

(6270068,'05'),

(6270093,'05'),

(6264086,'05'),

(6270409,'05'),

(6222551,'05'),

(6268286,'05'),

(6267177,'05'),

(6270325,'05'),

(6270743,'05'),

(6267215,'05'),

(6271297,'05'),

(6265484,'05'),

(6267813,'05'),

(6267345,'05'),

(6269397,'05'),

(6268951,'05'),

(6265285,'05'),

(6265391,'05'),

(6270417,'05'),

(6267870,'05'),

(6269912,'05'),

(6267210,'05'),

(6269201,'05'),

(6271349,'05'),

(6270140,'05'),

(6261831,'05'),

(6268113,'05'),

(6270048,'05'),

(6268962,'05'),

(6268947,'05'),

(6252675,'05'),

(6266155,'05'),

(6268162,'05'),

(6268146,'05'),

(6269159,'05'),

(6267368,'05'),

(6269629,'05'),

(6264774,'05'),

(6267420,'05'),

(6269048,'05'),

(6271378,'05'),

(6271189,'05'),

(6269194,'05'),

(6265981,'05'),

(6266044,'05'),

(6265770,'05'),

(6265862,'05'),

(6268061,'05'),

(6269742,'05'),

(6268709,'05'),

(6267321,'05'),

(6264218,'05'),

(6268897,'05'),

(6265335,'05'),

(6264684,'05'),

(6265767,'05'),

(6265906,'05'),

(6268100,'05'),

(6269134,'05'),

(6265836,'05'),

(6270755,'05'),

(6267399,'05'),

(6270688,'05'),

(6269235,'05'),

(6269934,'05'),

(6265834,'05'),

(6270708,'05'),

(6265809,'05'),

(6259835,'05'),

(6269753,'05'),

(6270227,'05'),

(6269655,'05'),

(6269553,'05'),

(6271242,'05'),

(6267659,'05'),

(6267849,'05'),

(6271346,'05'),

(6266582,'05'),

(6268125,'05'),

(6264504,'05'),

(6268495,'05'),

(6269361,'05'),

(6265327,'05'),

(6269627,'05'),

(6252738,'05'),

(6265806,'05'),

(6265914,'05'),

(6252417,'05'),

(6254072,'05'),

(6269548,'05'),

(6268711,'05')










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





