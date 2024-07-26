using Estudiantes.Application.Abstractions.Messaging;

namespace Estudiantes.Application.Matriculas.CrearMatricula;

public record CrearMatriculaCommand
(
    Guid EstudianteId,
    Guid CursoId,
    Guid DocenteId
) : ICommand<Guid> ;