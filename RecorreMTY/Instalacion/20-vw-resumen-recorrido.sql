--- Tema:        PIA - RecorreMTYDB
-- Descripción: Vista vw_ResumenRecorrido
-- Autor:       Ruiz Olguin Alejandro (2253555)

CREATE VIEW vw_ResumenRecorrido
AS
SELECT rec.Nombre AS Recorrido, rec.PrecioPersona AS PrecioPorPersona, COUNT(r.idReservacion) AS TotalReservaciones, ISNULL(SUM(r.PrecioPersonaCobrado * r.NumPersonas), 0) AS TotalCobrado, MAX(r.FechaRecorrido) AS UltimaReservacion
FROM Recorrido rec
LEFT JOIN Reservacion r ON r.idRecorrido = rec.idRecorrido
GROUP BY rec.idRecorrido, rec.Nombre, rec.PrecioPersona;
