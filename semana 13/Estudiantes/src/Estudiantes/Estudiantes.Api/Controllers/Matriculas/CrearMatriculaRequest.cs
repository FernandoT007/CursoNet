namespace Docentes.api.Controllers.Docentes;

public record CrearMatriculaRequest 
(
    Guid EstudianteId,
    Guid CursoId,
    Guid DocenteId
);