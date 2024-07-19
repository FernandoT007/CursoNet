using Cursos.Application.Absatractions.Messaging;

namespace Cursos.Application.Cursos.ObtenerCurso;

public sealed record GetCursoQuery(Guid CursoId) : IQuery<CursoResponse>;
