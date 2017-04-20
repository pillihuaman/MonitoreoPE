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


(6271281,'04'),

(6256231,'04'),

(6271437,'04'),

(6269464,'04'),

(6271373,'04'),

(6271363,'04'),

(6271335,'04'),

(6252246,'04'),

(6271343,'04'),

(6269442,'04'),

(6271287,'04'),

(6270169,'04'),

(6268616,'04'),

(6271247,'04'),

(6268745,'04'),

(6271177,'04'),

(6267155,'04'),

(6270455,'04'),

(6271061,'04'),

(6270025,'04'),

(6271042,'04'),

(6267427,'04'),

(6271071,'04'),

(6265515,'04'),

(6271057,'04'),

(6271043,'04'),

(6269979,'04'),

(6270878,'04'),

(6271019,'04'),

(6269117,'04'),

(6270996,'04'),

(6266998,'04'),

(6270979,'04'),

(6270914,'04'),

(6270953,'04'),

(6266167,'04'),

(6266468,'04'),

(6270838,'04'),

(6270709,'04'),

(6263319,'04'),

(6270296,'04'),

(6270869,'04'),

(6270851,'04'),

(6268309,'04'),

(6270399,'04'),

(6270811,'04'),

(6270778,'04'),

(6270713,'04'),

(6269301,'04'),

(6270379,'04'),

(6264655,'04'),

(6269335,'04'),

(6270446,'04'),

(6270722,'04'),

(6270689,'04'),

(6270726,'04'),

(6185339,'04'),

(6264824,'04'),

(6269770,'04'),

(6270676,'04'),

(6213338,'04'),

(6270614,'04'),

(6270077,'04'),

(6264560,'04'),

(6270523,'04'),

(6270566,'04'),

(6268311,'04'),

(6264815,'04'),

(6270182,'04'),

(6270513,'04'),

(6267983,'04'),

(6268919,'04'),

(6269563,'04'),

(6268272,'04'),

(6269506,'04'),

(6261162,'04'),

(6269538,'04'),

(6268423,'04'),

(6265765,'04'),

(6270105,'04'),

(6269870,'04'),

(6270369,'04'),

(6270387,'04'),

(6270254,'04'),

(6269532,'04'),

(6268488,'04'),

(6268205,'04'),

(6270266,'04'),

(6270264,'04'),

(6269145,'04'),

(6269922,'04'),

(6270222,'04'),

(6269983,'04'),

(6270197,'04'),

(6268337,'04'),

(6270179,'04'),

(6268763,'04'),

(6260951,'04'),

(6269836,'04'),

(6269793,'04'),

(6268006,'04'),

(6267975,'04'),

(6270103,'04'),

(6270071,'04'),

(6267236,'04'),

(6270054,'04'),

(6269715,'04'),

(6270041,'04'),

(6268228,'04'),

(6270043,'04'),

(6270019,'04'),

(6259424,'04'),

(6264676,'04'),

(6269990,'04'),

(6270026,'04'),

(6269769,'04'),

(6269745,'04'),

(6269933,'04'),

(6260679,'04'),

(6269900,'04'),

(6268850,'04'),

(6269940,'04'),

(6269511,'04'),

(6269923,'04'),

(6269893,'04'),

(6269857,'04'),

(6269794,'04'),

(6266520,'04'),

(6269827,'04'),

(6269829,'04'),

(6269826,'04'),

(6268529,'04'),

(6268474,'04'),

(6269783,'04'),

(6268830,'04'),

(6269777,'04'),

(6269775,'04'),

(6267891,'04'),

(6269773,'04'),

(6269766,'04'),

(6269480,'04'),

(6267917,'04'),

(6269739,'04'),

(6269685,'04'),

(6269754,'04'),

(6269736,'04'),

(6268557,'04'),

(6269672,'04'),

(6269017,'04'),

(6269653,'04'),

(6269625,'04'),

(6269660,'04'),

(6269375,'04'),

(6269066,'04'),

(6269585,'04'),

(6269522,'04'),

(6269545,'04'),

(6267075,'04'),

(6269493,'04'),

(6269402,'04'),

(6269497,'04'),

(6269483,'04'),

(6269457,'04'),

(6265614,'04'),

(6268437,'04'),

(6269444,'04'),

(6269417,'04'),

(6263510,'04'),

(6269059,'04'),

(6265092,'04'),

(6269382,'04'),

(6269193,'04'),

(6257219,'04'),

(6250625,'04'),

(6269372,'04'),

(6269311,'04'),

(6269262,'04'),

(6269319,'04'),

(6269255,'04'),

(6268871,'04'),

(6269153,'04'),

(6269232,'04'),

(6268574,'04'),

(6269166,'04'),

(6264178,'04'),

(6268905,'04'),

(6269215,'04'),

(6269216,'04'),

(6269210,'04'),

(6269200,'04'),

(6267951,'04'),

(6269100,'04'),

(6269163,'04'),

(6268515,'04'),

(6269113,'04'),

(6269142,'04'),

(6269104,'04'),

(6268732,'04'),

(6265727,'04'),

(6269123,'04'),

(6269062,'04'),

(6268028,'04'),

(6269051,'04'),

(6268708,'04'),

(6269070,'04'),

(6268258,'04'),

(6268740,'04'),

(6268959,'04'),

(6269024,'04'),

(6255410,'04'),

(6267640,'04'),

(6268979,'04'),

(6268644,'04'),

(6268921,'04'),

(6268811,'04'),

(6268865,'04'),

(6268700,'04'),

(6268862,'04'),

(6268858,'04'),

(6268133,'04'),

(6268315,'04'),

(6268803,'04'),

(6268810,'04'),

(6267805,'04'),

(6268760,'04'),

(6268426,'04'),

(6268697,'04'),

(6268741,'04'),

(6268629,'04'),

(6268664,'04'),

(6267185,'04'),

(6264472,'04'),

(6268637,'04'),

(6268585,'04'),

(6268581,'04'),

(6268587,'04'),

(6268573,'04'),

(6268580,'04'),

(6268081,'04'),

(6268289,'04'),

(6263993,'04'),

(6268556,'04'),

(6268094,'04'),

(6267735,'04'),

(6267442,'04'),

(6267444,'04'),

(6268502,'04'),

(6268484,'04'),

(6268491,'04'),

(6268058,'04'),

(6268485,'04'),

(6268445,'04'),

(6268168,'04'),

(6267915,'04'),

(6268415,'04'),

(6263726,'04'),

(6267132,'04'),

(6268364,'04'),

(6266477,'04'),

(6267404,'04'),

(6268356,'04'),

(6268314,'04'),

(6260988,'04'),

(6267478,'04'),

(6268129,'04'),

(6267609,'04'),

(6261403,'04'),

(6264043,'04'),

(6268072,'04'),

(6267861,'04'),

(6266782,'04'),

(6176097,'04'),

(6258600,'04'),

(6268005,'04'),

(6268024,'04'),

(6265898,'04'),

(6267204,'04'),

(6268053,'04'),

(6268057,'04'),

(6268033,'04'),

(6264683,'04'),

(6267981,'04'),

(6212483,'04'),

(6267641,'04'),

(6266690,'04'),

(6267632,'04'),

(6267754,'04'),

(6267913,'04'),

(6267063,'04'),

(6259495,'04'),

(6267890,'04'),

(6266854,'04'),

(6267839,'04'),

(6267657,'04'),

(6267718,'04'),

(6267699,'04'),

(6267528,'04'),

(6233449,'04'),

(6267564,'04'),

(6267473,'04'),

(6267678,'04'),

(6262664,'04'),

(6267639,'04'),

(6267597,'04'),

(6267598,'04'),

(6267593,'04'),

(6267589,'04'),

(6267378,'04'),

(6193077,'04'),

(6267425,'04'),

(6267158,'04'),

(6267447,'04'),

(6267537,'04'),

(6267373,'04'),

(6236433,'04'),

(6267324,'04'),

(6267433,'04'),

(6267142,'04'),

(6267067,'04'),

(6267330,'04'),

(6266682,'04'),

(6260169,'04'),

(6267346,'04'),

(6267293,'04'),

(6267311,'04'),

(6266554,'04'),

(6266774,'04'),

(6267277,'04'),

(6265785,'04'),

(6266502,'04'),

(6260440,'04'),

(6253335,'04'),

(6267221,'04'),

(6267207,'04'),

(6267171,'04'),

(6266694,'04'),

(6267143,'04'),

(6266738,'04'),

(6266877,'04'),

(6259744,'04'),

(6253858,'04'),

(6267096,'04'),

(6266828,'04'),

(6265943,'04'),

(6267019,'04'),

(6266901,'04'),

(6266855,'04'),

(6266842,'04'),

(6266808,'04'),

(6266767,'04'),

(6266820,'04'),

(6266778,'04'),

(6266742,'04'),

(6266772,'04'),

(6266686,'04'),

(6266668,'04'),

(6266666,'04'),

(6266656,'04'),

(6266634,'04'),

(6207564,'04'),

(6264188,'04'),

(6266615,'04'),

(6266607,'04'),

(6266608,'04'),

(6266588,'04'),

(6266579,'04'),

(6266564,'04'),

(6266507,'04'),

(6265779,'04'),

(6266150,'04'),

(6266089,'04')










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





