use BDPagoEfectivoReplicaCore

select s.Nombre as portal,o.IdOrdenPago,Total,o.FechaCreacion,o.IdMoneda,
Estado = (
case when	o.IdEstado ='22' then 'generado'
when o.IdEstado ='21' then 'expirado'
WHEN o.IdEstado ='25' then 'eliminado'
END ),o.OrderIdComercio,(select Descripcion from pagoefectivo.banco where Codigo= mo.codigobanco) as Banco

FROM PagoEfectivo.OrdenPago o
 inner join PagoEfectivo.Servicio s on o.IdServicio= s.IdServicio 
 left join PagoEfectivo.movimiento  mo on o.IdOrdenPago= mo.IdOrdenPago
 WHERE
o.IdEstado != 23 and o.IdOrdenPago 
in