--- Tema:        PIA - RecorreMTYDB
-- Descripción: Procedimiento usp_insertarTurista
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE PROCEDURE usp_insertarTurista
	@p_NombrePais VARCHAR(50),
	@p_Nombre VARCHAR(100),
	@p_CorreoElectronico VARCHAR(100),
	@p_FechaRegistro DATE
AS
BEGIN
	DECLARE @idPais INT
	DECLARE @paisActivo BIT
	DECLARE @idTuristaExistente INT

	SELECT @idPais = idPais
	FROM Pais
	WHERE Nombre = @p_NombrePais

	IF @idPais IS NULL
	BEGIN
		SELECT '000001' AS ErrCodigo, 'El país no existe' AS ErrMensaje
		RETURN
	END

	SELECT @paisActivo = Activo
	FROM Pais
	WHERE idPais = @idPais

	IF @paisActivo = 0
	BEGIN
		SELECT '000002' AS ErrCodigo, 'El país está dado de baja' AS ErrMensaje
		RETURN
	END

	SELECT @idTuristaExistente = idTurista
	FROM Turista
	WHERE Correo = @p_CorreoElectronico

	IF @idTuristaExistente IS NOT NULL
	BEGIN
		SELECT '000003' AS ErrCodigo, 'El correo electrónico ya está registrado' AS ErrMensaje
		RETURN
	END

	INSERT INTO Turista (Nombre, Correo, FechaRegistro, idPais, Activo)
	VALUES (@p_Nombre, @p_CorreoElectronico, @p_FechaRegistro, @idPais, 1)

	SELECT '000000' AS ErrCodigo, 'Turista registrado' AS ErrMensaje
END
