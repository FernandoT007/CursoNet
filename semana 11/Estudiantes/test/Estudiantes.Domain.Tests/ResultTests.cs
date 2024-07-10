using Estudiantes.Domain.Abstractions;

namespace Estudiantes.Domain.Tests;

public class ResultTests
{
    [Fact]
    public void Success_Should_Return_SuccessResult()
    {
        var result = Result.Success();

        Assert.False(result.IsSuccess);
        Assert.False(result.IsFailure);
        Assert.Equal(Error.None,result.Error);
    }
}