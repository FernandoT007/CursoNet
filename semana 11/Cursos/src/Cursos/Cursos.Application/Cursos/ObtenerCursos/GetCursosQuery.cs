using Cursos.Application.Absatractions.Messaging;

namespace Cursos.Application.Cursos.ObtenerCursos;

public sealed record GetCursosQuery() : IQuery<ListaCursosResponse>;