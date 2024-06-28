using Cursos.Application.Absatractions.Messaging;
using Cursos.Domain.Abtrastions;
using Cursos.Domain.Cursos;

namespace Cursos.Application.Cursos.ObtenerCurso;

public class GetCursoQueryHandler: IQueryHandler<GetCursoQuery,CursoResponse>
{
    private readonly ICursoRepository _cursoRepository;

    public GetCursoQueryHandler(ICursoRepository cursoRepository)
    {
        _cursoRepository = cursoRepository;
    }

    public async Task<Result<CursoResponse>> Handle(GetCursoQuery request, CancellationToken cancellationToken)
    {
       var cursoResult = await _cursoRepository.GetByIdAsync(request.CursoId,cancellationToken);
       if (cursoResult == null)
       {
             return Result.Failure<CursoResponse>(CursosErrors.NotFound);
       }
        return Result.Success(new CursoResponse(
            cursoResult.Id,
            cursoResult.NombreCurso!.Value,
            cursoResult.DescripcionCurso!.Value,
            cursoResult.CapacidadCurso!.Value
        ));      

    }
}