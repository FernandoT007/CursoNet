using Estudiantes.Domain.Abstractions;
using Estudiantes.Domain.Estudiantes;

namespace Estudiantes.Domain.Matriculas;

public sealed class Matricula : Entity
{
    private Matricula(
        Guid id,
        Guid estudianteId, 
        Guid cursoId, 
        Guid docenteId,
        DateTime fechaMatricula
        ) : base (id)
    {
        EstudianteId = estudianteId;
        CursoId = cursoId;
        FechaMatricula = fechaMatricula;
        DocenteId = docenteId;
    }

    public Guid EstudianteId { get; private set; }
    public Guid CursoId { get; private set; }
    public Guid DocenteId { get; private set; }
    public Estudiante? Estudiante { get; private set; }
    public DateTime FechaMatricula { get; private set; }

    public static Result<Matricula> Create(
        Guid estudianteId,
        Guid cursoId, 
        Guid docenteId,
        DateTime fechaMatricula
    )
    {
        var matricula = new Matricula(
            Guid.NewGuid(),
          estudianteId,
          cursoId,
          docenteId,
          fechaMatricula
        );

        return matricula;
    }
}