--- Tema:        PIA - RecorreMTYDB
-- Descripción: Procedimiento usp_registrarReservacion
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE PROCEDURE usp_registrarReservacion
	@p_NombreRecorrido VARCHAR(50),
	@p_CorreoTurista VARCHAR(100),
	@p_FechaRecorrido DATE,
	@p_Personas INT
AS
BEGIN
	DECLARE @idRecorrido INT
	DECLARE @recorridoActivo BIT
	DECLARE @precioVigente DECIMAL(10,2)
	DECLARE @idTurista INT
	DECLARE @turistaActivo BIT

	SELECT @idRecorrido = idRecorrido, @recorridoActivo = Activo, @precioVigente = PrecioPersona
	FROM Recorrido
	WHERE Nombre = @p_NombreRecorrido

	IF @idRecorrido IS NULL
	BEGIN
		SELECT '000001' AS ErrCodigo, 'El recorrido no existe' AS ErrMensaje
		RETURN
	END

	IF @recorridoActivo = 0
	BEGIN
		SELECT '000002' AS ErrCodigo, 'El recorrido está dado de baja' AS ErrMensaje
		RETURN
	END

	SELECT @idTurista = idTurista, @turistaActivo = Activo
	FROM Turista
	WHERE Correo = @p_CorreoTurista

	IF @idTurista IS NULL
	BEGIN
		SELECT '000003' AS ErrCodigo, 'El turista no existe' AS ErrMensaje
		RETURN
	END

	IF @turistaActivo = 0
	BEGIN
		SELECT '000004' AS ErrCodigo, 'El turista está dado de baja' AS ErrMensaje
		RETURN
	END

	BEGIN TRY
		INSERT INTO Reservacion (idTurista, idRecorrido, FechaRecorrido, NumPersonas, PrecioPersonaCobrado)
		VALUES (@idTurista, @idRecorrido, @p_FechaRecorrido, @p_Personas, @precioVigente)

		SELECT '000000' AS ErrCodigo, 'Reservación registrada' AS ErrMensaje
	END TRY
	BEGIN CATCH
		SELECT '999999' AS ErrCodigo, 'Error ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + ': ' + ERROR_MESSAGE() AS ErrMensaje
	END CATCH
END
