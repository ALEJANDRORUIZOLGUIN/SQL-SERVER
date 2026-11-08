-- Tema:        PIA - RecorreMTYDB
-- Descripción: Trigger trg_registrarHistoricoPrecio
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE TRIGGER trg_registrarHistoricoPrecio
ON Recorrido
AFTER UPDATE
AS
BEGIN
	INSERT INTO HistoricoPrecio (idRecorrido, PrecioAnterior, PrecioNuevo, FechaCambio)
	SELECT d.idRecorrido, d.PrecioPersona, i.PrecioPersona, GETDATE()
	FROM deleted d
	INNER JOIN inserted i ON i.idRecorrido = d.idRecorrido
	WHERE d.PrecioPersona <> i.PrecioPersona
END
