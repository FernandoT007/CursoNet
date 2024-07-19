using Cursos.Application.Absatractions.Messaging;
using Cursos.Application.Cursos.ObtenerCurso;
using Cursos.Domain.Abtrastions;
using Cursos.Domain.Cursos;

namespace Cursos.Application.Cursos.ObtenerCursos;

public class GetCursosQueryHandler : IQueryHandler<GetCursosQuery, ListaCursosResponse>
{
    private readonly ICursoRepository _cursoRepository;

    public GetCursosQueryHandler(ICursoRepository cursoRepository)
    {
        _cursoRepository = cursoRepository;
    }

    public async Task<Result<ListaCursosResponse>> Handle(GetCursosQuery request, CancellationToken cancellationToken)
    {
       var cursos = await _cursoRepository.GetCursos(cancellationToken);
        if  (cursos == null)
        {
            return Result.Failure<ListaCursosResponse>(CursosErrors.NotFound);
        }

        var cursosResponse = cursos.Select(curso => new CursoResponse(
            curso.Id,
            curso.NombreCurso!.Value,
            curso.DescripcionCurso!.Value,
            curso.CapacidadCurso!.Value
        ));

       return Result.Success(new ListaCursosResponse(cursosResponse));
    }
}