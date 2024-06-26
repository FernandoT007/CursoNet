using Cursos.Application.Absatractions.Messaging;
using Cursos.Domain.Abtrastions;
using Cursos.Domain.Cursos;

namespace Cursos.Application.Cursos.ObtenerCursos;

public class GetCursosQueryHandler : IQueryHandler<GetCursosQuery, List<CursosResponse>>
{
    private readonly ICursoRepository _cursoRepository;

    public GetCursosQueryHandler(ICursoRepository cursoRepository)
    {
        _cursoRepository = cursoRepository;
    }

    public async Task<Result<List<CursosResponse>>> Handle(GetCursosQuery request, CancellationToken cancellationToken)
    {
       var cursos = await _cursoRepository.GetCursos(cancellationToken);
       var cursosResult = new List<CursosResponse>();

       foreach (var curso in cursos)
       {
            cursosResult.Add(new CursosResponse
            (
                curso.Id,
                curso.NombreCurso!.Value,
                curso.DescripcionCurso!.Value,
                curso.CapacidadCurso!.Value
            ));
       }
       return cursosResult;
    }
}