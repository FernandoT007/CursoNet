using Cursos.Application.Absatractions.Messaging;
using Cursos.Domain.Abtrastions;
using Cursos.Domain.Cursos;

namespace Cursos.Application.Cursos.CrearCursos;

internal sealed class CrearCursosCommandHandler : ICommandHandler<CrearCursosCommand, Guid>
{
    private readonly ICursoRepository _cursoRepository;

    public CrearCursosCommandHandler(ICursoRepository cursoRepository)
    {
        _cursoRepository = cursoRepository;
    }

    public async Task<Result<Guid>> Handle(CrearCursosCommand request, CancellationToken cancellationToken)
    {
        var curso = Curso.Create(request.NombreCurso,request.DescripcionCurso,request.CapacidadCurso);
        await _cursoRepository.AddAsync(curso);
        return Result.Success(curso.Id);
    }
}