namespace Cursos.Application.Cursos.ObtenerCursos;

public sealed record CursosResponse
(
    Guid IdCurso,
    string Nombre,
    string Descricion,
    int Capacidad
);