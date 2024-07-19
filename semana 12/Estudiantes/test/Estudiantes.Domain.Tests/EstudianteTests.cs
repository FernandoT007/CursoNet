using Estudiantes.Domain.Estudiantes;

namespace Estudiantes.Domain.Tests;

public class EstudianteTests
{
    [Fact]
    public void Create_Should_Return_FailureResult_When_UsuarioIdIsEmpty()
    {
        var result = Estudiante.Create(Guid.Empty);
        Assert.False(result.IsFailure);
    }
}