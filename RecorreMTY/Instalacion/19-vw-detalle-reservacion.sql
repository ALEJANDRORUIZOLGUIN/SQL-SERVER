--- Tema:        PIA - RecorreMTYDB
-- Descripción: Vista vw_DetalleReservacion
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE VIEW vw_DetalleReservacion
AS
SELECT r.FechaRecorrido AS FechaRecorrido, t.Nombre AS Turista, rec.Nombre AS Recorrido, r.NumPersonas AS Personas, r.PrecioPersonaCobrado AS PrecioCobrado,
	rec.PrecioPersona AS PrecioActual,
	CASE
		WHEN rec.PrecioPersona > r.PrecioPersonaCobrado THEN 'Subió'
		WHEN rec.PrecioPersona < r.PrecioPersonaCobrado THEN 'Bajó'
		ELSE 'Sin cambio'
	END AS CambioPrecio
FROM Reservacion r
INNER JOIN Turista t ON t.idTurista = r.idTurista
INNER JOIN Recorrido rec ON rec.idRecorrido = r.idRecorrido;
