using Cursos.Application.Cursos.ObtenerCurso;

namespace Cursos.Application.Cursos.ObtenerCursos;

public sealed record ListaCursosResponse
(
    IEnumerable<CursoResponse>? Cursos
);