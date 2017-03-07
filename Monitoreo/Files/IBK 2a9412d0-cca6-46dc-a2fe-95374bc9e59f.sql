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


(6004107,'04'),

(5993148,'04'),

(6004064,'04'),

(6004034,'04'),

(6004083,'04'),

(6003663,'04'),

(6003531,'04'),

(6003689,'04'),

(6004043,'04'),

(6004012,'04'),

(6003734,'04'),

(5998655,'04'),

(5961598,'04'),

(6003984,'04'),

(6001843,'04'),

(5978145,'04'),

(6003735,'04'),

(6003007,'04'),

(6003979,'04'),

(6003977,'04'),

(6003920,'04'),

(5999093,'04'),

(6003686,'04'),

(6003889,'04'),

(6003850,'04'),

(6000324,'04'),

(5998161,'04'),

(5996174,'04'),

(6002405,'04'),

(6003026,'04'),

(6003110,'04'),

(6003593,'04'),

(5999924,'04'),

(6003183,'04'),

(6003635,'04'),

(6003298,'04'),

(5999199,'04'),

(6003562,'04'),

(5998234,'04'),

(6002754,'04'),

(6002443,'04'),

(6003422,'04'),

(6003617,'04'),

(6003580,'04'),

(6003523,'04'),

(6002969,'04'),

(5983144,'04'),

(6003506,'04'),

(6002510,'04'),

(6002366,'04'),

(5999622,'04'),

(6003094,'04'),

(5963979,'04'),

(6003464,'04'),

(5999790,'04'),

(6002519,'04'),

(6003380,'04'),

(5999363,'04'),

(6003309,'04'),

(6003071,'04'),

(6003319,'04'),

(6002455,'04'),

(6002901,'04'),

(5997076,'04'),

(6003156,'04'),

(6003136,'04'),

(6003115,'04'),

(6003108,'04'),

(5995984,'04'),

(5993369,'04'),

(6002976,'04'),

(6002950,'04'),

(5998303,'04'),

(6002921,'04'),

(6002166,'04'),

(6002712,'04'),

(6002873,'04'),

(5997215,'04'),

(6002528,'04'),

(5998318,'04'),

(6002903,'04'),

(6002598,'04'),

(6002792,'04'),

(6002750,'04'),

(6002593,'04'),

(6002813,'04'),

(6002599,'04'),

(6002790,'04'),

(5998957,'04'),

(6001028,'04'),

(5890612,'04'),

(6002116,'04'),

(6002642,'04'),

(6002433,'04'),

(6002660,'04'),

(6002566,'04'),

(6002546,'04'),

(6000795,'04'),

(6002518,'04'),

(5999597,'04'),

(6002504,'04'),

(6002130,'04'),

(6002117,'04'),

(6002438,'04'),

(6002406,'04'),

(6000159,'04'),

(6001219,'04'),

(6002396,'04'),

(6001869,'04'),

(6002332,'04'),

(6002324,'04'),

(5999425,'04'),

(6002305,'04'),

(6002252,'04'),

(6002227,'04'),

(6002207,'04'),

(6002147,'04'),

(6002162,'04'),

(6002128,'04'),

(6002122,'04'),

(6002118,'04'),

(6001705,'04'),

(6001520,'04'),

(6002049,'04'),

(6002015,'04'),

(5999747,'04'),

(6001651,'04'),

(5999678,'04'),

(6001993,'04'),

(6001541,'04'),

(6001695,'04')










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





