using Estudiantes.Application.Abstractions.Clock;
using Estudiantes.Application.Abstractions.Messaging;
using Estudiantes.Application.Matriculas.CrearMatricula;
using Estudiantes.Application.Services;
using Estudiantes.Domain.Abstractions;
using Estudiantes.Domain.Estudiantes;
using Estudiantes.Domain.Matriculas;

namespace Estudiantes.Application.Estudiantes.CrearEstudiante;

internal sealed class CrearMatriculaCommandHandler :
ICommandHandler<CrearMatriculaCommand, Guid>
{
    private readonly IMatriculaRepository _matriculaRepository;
    private readonly IEstudianteRepository _estudianteRepository;
    private readonly IUnitOfWork _unitOfWork;
    private readonly ICursosService _cursoService;
    private readonly ICacheService _cacheService;
    private readonly IDocentesService _docenteService;
    private readonly IDateTimeProvider _dateTimeProvider;

    public CrearMatriculaCommandHandler(IMatriculaRepository matriculaRepository, IEstudianteRepository estudianteRepository, IUnitOfWork unitOfWork, ICursosService cursoService, ICacheService cacheService, IDocentesService docenteService, IDateTimeProvider dateTimeProvider)
    {
        _matriculaRepository = matriculaRepository;
        _estudianteRepository = estudianteRepository;
        _unitOfWork = unitOfWork;
        _cursoService = cursoService;
        _cacheService = cacheService;
        _docenteService = docenteService;
        _dateTimeProvider = dateTimeProvider;
    }

    public async Task<Result<Guid>> Handle(CrearMatriculaCommand request, CancellationToken cancellationToken)
    {
        if (await _estudianteRepository.GetByIdAsync(request.EstudianteId, cancellationToken) is null)
        {
            return Result.Failure<Guid>(new Error("EstudianteNotFound", "Estudiante no encontrado"));
        }
        if (!await _docenteService.DocenteExistsAsync(request.DocenteId, cancellationToken))
        {
            return Result.Failure<Guid>(new Error("DocenteNotFound", "Docente no encontrado"));
        }

        var cacheKey = $"curso_{request.CursoId}";
        var cursoExists = await _cacheService.GetCacheValueAsync<bool>(cacheKey);

        if (!cursoExists)
        {
            cursoExists = await _cursoService.CursoExistsAsync(request.CursoId, cancellationToken);
            var expirationTime = TimeSpan.FromMinutes(3);
            await _cacheService.SetCacheValueAsync(cacheKey, cursoExists,expirationTime);
        }

        if (!cursoExists)
        {
            return Result.Failure<Guid>(new Error("CursoNotFound", "Curso no encontrado"));
        }

        var matricula = Matricula.Create(
            request.EstudianteId,
            request.CursoId,
            request.DocenteId,
            _dateTimeProvider.CurrentTime
         );

        _matriculaRepository.Add(matricula.Value);

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return matricula.Value.Id;
    }
}