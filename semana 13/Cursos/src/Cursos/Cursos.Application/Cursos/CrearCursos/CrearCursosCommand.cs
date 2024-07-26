using Cursos.Application.Absatractions.Messaging;
using Cursos.Domain.Cursos;

namespace Cursos.Application.Cursos.CrearCursos;

public record CrearCursosCommand(
    NombreCurso NombreCurso,
    DescripcionCurso DescripcionCurso,
    CapacidadCurso CapacidadCurso
) : ICommand<Guid>;
