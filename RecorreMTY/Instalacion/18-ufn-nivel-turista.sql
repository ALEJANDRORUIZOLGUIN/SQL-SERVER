--- Tema:        PIA - RecorreMTYDB
-- Descripción: Función ufn_nivelTurista
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE FUNCTION ufn_nivelTurista
(
	@p_CorreoTurista VARCHAR(100)
)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @idTurista INT
	DECLARE @totalReservaciones INT
	DECLARE @nivel VARCHAR(20)

	SELECT @idTurista = idTurista
	FROM Turista
	WHERE Correo = @p_CorreoTurista

	IF @idTurista IS NULL
		RETURN NULL

	SELECT @totalReservaciones = COUNT(*)
	FROM Reservacion
	WHERE idTurista = @idTurista

	IF @totalReservaciones = 0
		SET @nivel = 'Sin reservaciones'
	ELSE IF @totalReservaciones <= 2
		SET @nivel = 'Ocasional'
	ELSE
		SET @nivel = 'Frecuente'

	RETURN @nivel
END
