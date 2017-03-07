BEGIN TRY
	BEGIN TRANSACTION;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		DECLARE @IdTransferenciaEmpresas INT = 
		DECLARE @IdEmpresa int =  
		DECLARE @Total decimal(8,2),@Comision decimal(8,2),@ComisionSinIGV decimal(8,2),@Operaciones int
		declare @Tabla table
		(
			Id					int identity,
			CIP					int,
			TipoComision		int,
			MontoComision		decimal(6,2),  
			TotalComision		decimal(6,2),
			TotalComisionSinIGV	decimal(6,2),
			total				decimal(6,2)
		)

		insert into @Tabla
		SELECT  
		DISTINCT
		O1.IdOrdenPago as CIP,
		SC.idTipoComision,
		MontoComision=(case  when SC.idTipoComision =550 then SC.ValorPorc
			   when SC.idTipoComision =551 then SC.ValorFijo
			   when SC.idTipoComision =552 then (case when O1.total>=SC.Montolimite then SC.valorporc else sc.valorfijo end)
			   end
		),
		
		TotalComision=ROUND((PagoEfectivo.fn_ObtenerComision(SC.idTipoComision,O1.Total,SC.ValorFijo,SC.ValorPorc,SC.MontoLimite,SC.MontoLimitePorc) * 1.18),2),
		TotalComisionSinIGV=ROUND((PagoEfectivo.fn_ObtenerComision(SC.idTipoComision,O1.Total,SC.ValorFijo,SC.ValorPorc,SC.MontoLimite,SC.MontoLimitePorc)),2),
		O1.Total	
		FROM  PagoEfectivo.OrdenPago O1
		inner join PagoEfectivo.servicio S1					on O1.IdServicio				=	S1.IdServicio 
		LEFT JOIN PagoEfectivo.ServicioComision SC			ON S1.IdServicio = SC.idServicio AND SC.idMoneda = O1.IdMoneda 
		where O1.IdOrdenPago in (


) and O1.idordenpago not in (select DTE.IdOrdenPago from PagoEfectivo.DetTransferenciaEmpresa DTE)

		and O1.IdEstado=23
		and S1.IdEmpresaContratante=@IdEmpresa

		select @Total=SUM(total),@Comision=SUM(TotalComision), @ComisionSinIGV=SUM(TotalComisionSinIGV),@Operaciones=COUNT(CIP) from @Tabla
		INSERT INTO pagoefectivo.DetTransferenciaEmpresa 
		SELECT @IdTransferenciaEmpresas,CIP,TipoComision,MontoComision,TotalComision,TotalComisionSinIGV FROM @Tabla
		UPDATE PagoEfectivo.TransferenciaEmpresas
		SET 
		TotalPago=TotalPago+@Total,
		TotalComision=TotalComision+@Comision,
		TotalComisionSinIGV=TotalComisionSinIGV+@ComisionSinIGV,
		TotalOperaciones=TotalOperaciones+@Operaciones,
		FechaActualizacion =GETDATE()
		WHERE IdTransfenciaEmpresas=@IdTransferenciaEmpresas
		AND IdEmpresa=@IdEmpresa

	COMMIT TRANSACTION;
END TRY	
BEGIN CATCH
	SELECT 
		ERROR_NUMBER() AS NUMERO_DE_ERROR,
		ERROR_SEVERITY() AS GRAVEDAD_DEL_ERROR,
		ERROR_STATE() AS ESTADO_DEL_ERROR,
		ERROR_PROCEDURE() AS PROCEDIMIENTO_DEL_ERROR,
		ERROR_LINE() AS LINEA_DE_ERROR,
		ERROR_MESSAGE() AS MENSAJE_DE_ERROR;
		ROLLBACK TRANSACTION
END CATCH

	print 'Transacction' 
	print @@TRANCOUNT

	IF(@@TRANCOUNT!=0)
	begin
		COMMIT TRANSACTION;
	end

	print 'Transacction' 
	print @@TRANCOUNT


