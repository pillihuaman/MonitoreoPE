use  BDPagoEfectivoReplicaCore


Declare @Fecha date, @B1 char(2),@B2 char(2),@B3 char(2),@B4 char(2),@B5 char(2);


Set @Fecha=getdate()


select	


@B1='04'

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


(6262455,'04'),

(6263798,'04'),

(6262769,'04'),

(6263744,'04'),

(6263707,'04'),

(6263722,'04'),

(6263714,'04'),

(6263721,'04'),

(6263336,'04'),

(6263069,'04'),

(6263668,'04'),

(6257977,'04'),

(6263645,'04'),

(6263042,'04'),

(6263606,'04'),

(6263598,'04'),

(6263521,'04'),

(6263072,'04'),

(6263337,'04'),

(6257788,'04'),

(6263487,'04'),

(6262945,'04'),

(6262685,'04'),

(6258830,'04'),

(6263474,'04'),

(6258812,'04'),

(6263491,'04'),

(6262065,'04'),

(6263363,'04'),

(6263266,'04'),

(6263269,'04'),

(6263189,'04'),

(6254210,'04'),

(6263210,'04'),

(6262564,'04'),

(6263109,'04'),

(6262966,'04'),

(6262898,'04'),

(6257601,'04'),

(6263079,'04'),

(6262574,'04'),

(6263218,'04'),

(6258826,'04'),

(6263191,'04'),

(6263150,'04'),

(6263152,'04'),

(6263145,'04'),

(6263125,'04'),

(6262168,'04'),

(6263110,'04'),

(6263095,'04'),

(6263073,'04'),

(6263057,'04'),

(6263056,'04'),

(6263058,'04'),

(6263051,'04'),

(6237676,'04'),

(6262995,'04'),

(6262988,'04'),

(6262931,'04'),

(6262956,'04'),

(6260862,'04'),

(6261341,'04'),

(6260526,'04'),

(6262709,'04'),

(6262813,'04'),

(6262571,'04'),

(6262067,'04'),

(6262748,'04'),

(6261776,'04'),

(6250357,'04'),

(6262641,'04'),

(6262774,'04'),

(6260276,'04'),

(6262516,'04'),

(6262580,'04'),

(6261343,'04'),

(6251621,'04'),

(6259600,'04'),

(6262612,'04'),

(6262578,'04'),

(6262569,'04'),

(6262511,'04'),

(6262535,'04'),

(6262471,'04'),

(6261786,'04'),

(6262515,'04'),

(6258115,'04'),

(6255412,'04'),

(6256985,'04'),

(6262447,'04'),

(6262427,'04'),

(6262408,'04'),

(6262396,'04'),

(6262407,'04'),

(6261733,'04'),

(6262376,'04'),

(6262386,'04'),

(6262365,'04'),

(6262350,'04'),

(6262328,'04'),

(6261916,'04'),

(6262326,'04'),

(6262286,'04'),

(6262195,'04'),

(6261796,'04'),

(6259231,'04'),

(6247901,'04'),

(6260002,'04'),

(6257966,'04'),

(6262199,'04'),

(6262194,'04'),

(6261567,'04'),

(6259472,'04'),

(6262021,'04'),

(6262033,'04'),

(6261759,'04'),

(6262088,'04'),

(6262084,'04'),

(6262098,'04'),

(6262050,'04'),

(6262066,'04'),

(6262030,'04'),

(6249055,'04'),

(6262073,'04'),

(6261989,'04'),

(6260259,'04'),

(6262055,'04'),

(6262031,'04'),

(6262015,'04'),

(6261920,'04'),

(6262011,'04'),

(6262000,'04'),

(6261874,'04'),

(6261981,'04'),

(6261739,'04'),

(6261944,'04'),

(6261879,'04'),

(6260085,'04'),

(6261953,'04'),

(6261518,'04'),

(6261491,'04'),

(6260199,'04'),

(6261897,'04'),

(6242569,'04'),

(6261504,'04'),

(6261785,'04'),

(6261470,'04'),

(6261858,'04'),

(6261849,'04'),

(6250727,'04'),

(6261661,'04'),

(6261264,'04'),

(6261838,'04'),

(6261795,'04'),

(6261808,'04'),

(6254532,'04'),

(6255874,'04'),

(6258343,'04'),

(6261790,'04'),

(6261654,'04'),

(6261720,'04'),

(6261644,'04'),

(6261177,'04'),

(6256413,'04'),

(6261303,'04'),

(6260761,'04'),

(6259899,'04'),

(6261698,'04'),

(6261688,'04'),

(6261246,'04'),

(6261634,'04'),

(6261641,'04'),

(6260161,'04'),

(6261577,'04'),

(6261587,'04'),

(6261562,'04'),

(6261547,'04'),

(6258116,'04'),

(6260908,'04'),

(6258047,'04'),

(6261539,'04'),

(6261523,'04'),

(6261510,'04'),

(6261487,'04'),

(6261482,'04'),

(6257059,'04'),

(6257105,'04'),

(6261453,'04'),

(6261443,'04'),

(6260747,'04'),

(6261407,'04'),

(6261232,'04'),

(6261346,'04'),

(6260310,'04'),

(6260527,'04'),

(6260304,'04'),

(6261318,'04'),

(6260510,'04'),

(6260569,'04'),

(6258262,'04'),

(6261273,'04'),

(6261276,'04'),

(6260567,'04'),

(6261280,'04'),

(6260084,'04'),

(6259415,'04'),

(6260115,'04'),

(6261260,'04'),

(6261254,'04'),

(6261229,'04'),

(6261227,'04'),

(6261237,'04'),

(6260713,'04'),

(6261219,'04'),

(6261209,'04'),

(6261201,'04'),

(6261213,'04'),

(6259196,'04'),

(6261170,'04'),

(6259703,'04'),

(6260582,'04'),

(6261014,'04'),

(6260887,'04'),

(6260883,'04'),

(6260923,'04'),

(6260943,'04'),

(6259675,'04'),

(6254230,'04'),

(6254739,'04'),

(6260495,'04'),

(6260869,'04'),

(6260855,'04'),

(6260080,'04'),

(6256758,'04'),

(6260816,'04'),

(6260809,'04'),

(6258355,'04'),

(6260771,'04'),

(6257843,'04'),

(6255062,'04'),

(6260580,'04'),

(6260656,'04'),

(6260606,'04'),

(6260701,'04'),

(6260412,'04'),

(6260458,'04'),

(6260566,'04'),

(6259940,'04'),

(6252349,'04'),

(6260041,'04'),

(6254347,'04'),

(6256622,'04'),

(6260497,'04'),

(6260447,'04'),

(6260494,'04'),

(6259310,'04'),

(6260261,'04'),

(6260479,'04'),

(6260461,'04'),

(6260467,'04'),

(6258854,'04'),

(6257803,'04'),

(6260393,'04'),

(6260097,'04'),

(6259531,'04'),

(6260317,'04'),

(6260333,'04'),

(6260256,'04'),

(6257681,'04'),

(6260132,'04'),

(6260053,'04'),

(6257508,'04'),

(6260227,'04'),

(6259400,'04'),

(6259739,'04'),

(6259055,'04'),

(6260012,'04'),

(6260119,'04'),

(6259503,'04'),

(6258296,'04'),

(6260101,'04'),

(6260038,'04'),

(6256134,'04'),

(6259991,'04'),

(6259969,'04'),

(6256125,'04'),

(6258176,'04'),

(6259877,'04'),

(6259906,'04'),

(6259965,'04'),

(6246844,'04'),

(6259620,'04'),

(6258474,'04'),

(6259413,'04'),

(6259854,'04'),

(6257793,'04'),

(6259566,'04'),

(6259678,'04'),

(6259781,'04'),

(6259754,'04'),

(6259320,'04'),

(6251252,'04'),

(6257012,'04'),

(6258582,'04'),

(6259607,'04'),

(6253007,'04'),

(6259613,'04'),

(6259649,'04'),

(6253538,'04'),

(6259632,'04'),

(6259508,'04'),

(6258450,'04'),

(6253988,'04'),

(6259578,'04'),

(6259559,'04'),

(6259550,'04'),

(6258302,'04'),

(6259323,'04'),

(6259469,'04'),

(6259360,'04'),

(6258720,'04'),

(6253569,'04'),

(6258422,'04'),

(6254755,'04'),

(6259280,'04'),

(6259412,'04'),

(6259404,'04'),

(6248613,'04'),

(6259382,'04'),

(6259108,'04'),

(6257175,'04'),

(6259161,'04'),

(6259364,'04'),

(6259352,'04'),

(6252950,'04'),

(6259194,'04'),

(6258530,'04'),

(6259304,'04'),

(6259293,'04'),

(6259265,'04'),

(6259255,'04'),

(6259239,'04'),

(6259168,'04'),

(6259086,'04'),

(6259185,'04'),

(6259179,'04'),

(6259160,'04'),

(6259125,'04'),

(6259120,'04'),

(6259122,'04'),

(6259117,'04'),

(6259126,'04'),

(6259104,'04'),

(6259090,'04'),

(6259044,'04'),

(6258975,'04'),

(6251989,'04'),

(6258920,'04'),

(6258887,'04'),

(6258851,'04'),

(6258853,'04'),

(6258737,'04'),

(6258715,'04'),

(6258716,'04'),

(6258698,'04'),

(6258555,'04'),

(6258526,'04'),

(6258502,'04')










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





