using Cursos.Domain.Abtrastions;

namespace Cursos.Domain.Cursos;

public static class CursosErrors
{
    public static Error NotFound = new
    (
        "Cursos.NotFound",
        "No existe un curso con ese ID"
    );
}