--- Tema:        PIA - RecorreMTYDB
-- Descripción: Procedimiento usp_darDeBajaTurista
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE PROCEDURE usp_darDeBajaTurista
	@p_CorreoTurista VARCHAR(100)
AS
BEGIN
	DECLARE @idTurista INT
	DECLARE @turistaActivo BIT

	SELECT @idTurista = idTurista, @turistaActivo = Activo
	FROM Turista
	WHERE Correo = @p_CorreoTurista

	IF @idTurista IS NULL
	BEGIN
		SELECT '000001' AS ErrCodigo, 'El turista no existe' AS ErrMensaje
		RETURN
	END

	IF @turistaActivo = 0
	BEGIN
		SELECT '000002' AS ErrCodigo, 'El turista ya está dado de baja' AS ErrMensaje
		RETURN
	END

	UPDATE Turista
	SET Activo = 0
	WHERE idTurista = @idTurista

	SELECT '000000' AS ErrCodigo, 'Turista dado de baja' AS ErrMensaje
END
