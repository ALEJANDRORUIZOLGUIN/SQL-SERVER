--- Tema:        PIA - RecorreMTYDB
-- Descripción: Procedimiento usp_actualizarPrecioRecorrido
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE PROCEDURE usp_actualizarPrecioRecorrido
	@p_NombreRecorrido VARCHAR(50),
	@p_PrecioNuevo DECIMAL(10,2)
AS
BEGIN
	DECLARE @idRecorrido INT
	DECLARE @precioActual DECIMAL(10,2)

	SELECT @idRecorrido = idRecorrido, @precioActual = PrecioPersona
	FROM Recorrido
	WHERE Nombre = @p_NombreRecorrido

	IF @idRecorrido IS NULL
	BEGIN
		SELECT '000001' AS ErrCodigo, 'El recorrido no existe' AS ErrMensaje
		RETURN
	END

	IF @p_PrecioNuevo <= 0
	BEGIN
		SELECT '000002' AS ErrCodigo, 'El precio por persona debe ser mayor a cero' AS ErrMensaje
		RETURN
	END

	IF @p_PrecioNuevo = @precioActual
	BEGIN
		SELECT '000003' AS ErrCodigo, 'El precio por persona nuevo es igual al actual' AS ErrMensaje
		RETURN
	END

	UPDATE Recorrido
	SET PrecioPersona = @p_PrecioNuevo
	WHERE idRecorrido = @idRecorrido

	SELECT '000000' AS ErrCodigo, 'Precio por persona actualizado' AS ErrMensaje
END
