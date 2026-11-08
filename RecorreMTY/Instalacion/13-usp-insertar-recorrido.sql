--- Tema:        PIA - RecorreMTYDB
-- Descripción: Procedimiento usp_insertarRecorrido
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE PROCEDURE usp_insertarRecorrido
	@p_Nombre VARCHAR(50),
	@p_DuracionHoras DECIMAL(3,1),
	@p_PrecioPorPersona DECIMAL(10,2)
AS
BEGIN
	DECLARE @idRecorridoExistente INT

	SELECT @idRecorridoExistente = idRecorrido
	FROM Recorrido
	WHERE Nombre = @p_Nombre

	IF @idRecorridoExistente IS NOT NULL
	BEGIN
		SELECT '000001' AS ErrCodigo, 'El nombre de recorrido ya existe' AS ErrMensaje
		RETURN
	END

	IF @p_DuracionHoras <= 0
	BEGIN
		SELECT '000002' AS ErrCodigo, 'La duración debe ser mayor a cero' AS ErrMensaje
		RETURN
	END

	IF @p_PrecioPorPersona <= 0
	BEGIN
		SELECT '000003' AS ErrCodigo, 'El precio por persona debe ser mayor a cero' AS ErrMensaje
		RETURN
	END

	INSERT INTO Recorrido (Nombre, DuracionHoras, PrecioPersona, Activo)
	VALUES (@p_Nombre, @p_DuracionHoras, @p_PrecioPorPersona, 1)

	SELECT '000000' AS ErrCodigo, 'Recorrido registrado' AS ErrMensaje
END
