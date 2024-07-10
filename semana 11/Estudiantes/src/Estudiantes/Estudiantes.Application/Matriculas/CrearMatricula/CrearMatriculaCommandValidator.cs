using FluentValidation;

namespace Estudiantes.Application.Matriculas.CrearMatricula;

public class CrearMatriculaCommandValidator : AbstractValidator<CrearMatriculaCommand>
{
    public CrearMatriculaCommandValidator()
    {
        RuleFor(d => d.EstudianteId).NotEmpty();
        RuleFor(d => d.CursoId).NotEmpty();
        RuleFor(d => d.DocenteId).NotEmpty();
    }
}