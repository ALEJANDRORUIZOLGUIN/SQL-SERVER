--- Tema:        PIA - RecorreMTYDB
-- Descripción: Procedimiento usp_obtenerReservacionesPorFecha
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE PROCEDURE usp_obtenerReservacionesPorFecha
	@p_FechaInicio DATE,
	@p_FechaFin DATE
AS
BEGIN
	IF @p_FechaInicio > @p_FechaFin
	BEGIN
		SELECT '000001' AS ErrCodigo, 'La fecha inicial es posterior a la fecha final' AS ErrMensaje
		RETURN
	END

	SELECT r.FechaRecorrido AS FechaRecorrido, rec.Nombre AS Recorrido, t.Nombre AS Turista, r.NumPersonas AS Personas, r.PrecioPersonaCobrado AS PrecioCobrado
	FROM Reservacion r
	INNER JOIN Recorrido rec ON rec.idRecorrido = r.idRecorrido
	INNER JOIN Turista t ON t.idTurista = r.idTurista
	WHERE r.FechaRecorrido BETWEEN @p_FechaInicio AND @p_FechaFin
	ORDER BY r.FechaRecorrido, rec.Nombre
END
