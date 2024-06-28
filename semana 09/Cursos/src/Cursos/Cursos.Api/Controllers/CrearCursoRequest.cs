namespace Cursos.Api.Controllers;

public record CrearCursoRequest
(
    string Nombre,
    string Descripcion,
    int Capacidad
);