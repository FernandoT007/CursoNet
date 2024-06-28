namespace Cursos.Application.Cursos.ObtenerCurso;

public sealed record CursoResponse
(
    Guid IdCurso,
    string Nombre,
    string Descricion,
    int Capacidad
);