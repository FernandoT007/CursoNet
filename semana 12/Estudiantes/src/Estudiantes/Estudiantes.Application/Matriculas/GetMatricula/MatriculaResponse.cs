namespace Estudiantes.Application.Matriculas.GetMatricula;

public sealed record MatriculaResponse
(
    Guid Id,
    Guid EstudianteId,
    Guid CursoId,
    Guid DocenteId,
    DateTime FechaMatricula
   // string NombrecompletoEstudiante
);