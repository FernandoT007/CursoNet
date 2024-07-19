using FluentValidation;

namespace Cursos.Application.Cursos.CrearCursos;

public class CrearCursosCommandValidator : AbstractValidator<CrearCursosCommand>
{
    public CrearCursosCommandValidator()
    {
        RuleFor(c => c.NombreCurso.Value).NotEmpty().WithMessage("El nombre del curso no puede ser vacio");
        RuleFor(c => c.DescripcionCurso.Value).NotEmpty();
        RuleFor(c => c.CapacidadCurso.Value).GreaterThan(0);
    }
}