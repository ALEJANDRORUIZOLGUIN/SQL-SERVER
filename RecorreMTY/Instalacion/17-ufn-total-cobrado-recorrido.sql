--- Tema:        PIA - RecorreMTYDB
-- Descripción: Función ufn_totalCobradoRecorrido
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE FUNCTION ufn_totalCobradoRecorrido
(
	@p_NombreRecorrido VARCHAR(50)
)
RETURNS DECIMAL(12,2)
AS
BEGIN
	DECLARE @idRecorrido INT
	DECLARE @total DECIMAL(12,2)

	SELECT @idRecorrido = idRecorrido
	FROM Recorrido
	WHERE Nombre = @p_NombreRecorrido

	IF @idRecorrido IS NULL
		RETURN NULL

	SELECT @total = ISNULL(SUM(PrecioPersonaCobrado * NumPersonas), 0)
	FROM Reservacion
	WHERE idRecorrido = @idRecorrido

	RETURN @total
END
