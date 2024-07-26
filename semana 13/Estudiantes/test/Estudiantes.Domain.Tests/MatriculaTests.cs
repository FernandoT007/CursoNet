using Estudiantes.Domain.Matriculas;

namespace Estudiantes.Domain.Tests;

public class MatriculaTests
{
    [Fact]
    public void Create_Should_Return_SuccesResultWithMatricula()
    {
        var estudianteId = Guid.NewGuid();
        var cursoId = Guid.NewGuid();
        var docenteId = Guid.NewGuid();
        var fechaMatricula = DateTime.UtcNow;

        var result = Matricula.Create(
            estudianteId,
            cursoId,
            docenteId,
            fechaMatricula
        );

        Assert.True(result.IsSuccess);
        Assert.NotNull(result.Value);
        Assert.Equal(estudianteId,result.Value.EstudianteId);
        Assert.Equal(cursoId,result.Value.CursoId);
        Assert.Equal(docenteId,result.Value.DocenteId);
        Assert.Equal(fechaMatricula,result.Value.FechaMatricula);
    }
}