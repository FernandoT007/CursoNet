using Docentes.Application.Abstractions.Messaging;
using Docentes.Application.Services;
using Docentes.Domain.Abstractions;
using Docentes.Domain.Docentes;

namespace Docentes.Application.Docentes.CrearDocente;

internal sealed class CrearDocenteCommandHandler :
ICommandHandler<CrearDocenteCommand, Guid>
{
    private readonly IDocenteRepository _docenteRepository;
    private readonly IUnitOfWork _unitOfWork;
    private readonly IUsuariosService _usuariosService;
    private readonly ICursosService _cursosService;
    private readonly ICacheService _cacheService;

    public CrearDocenteCommandHandler(IDocenteRepository docenteRepository, IUnitOfWork unitOfWork, IUsuariosService usuariosService, ICursosService cursosService, ICacheService cacheService)
    {
        _docenteRepository = docenteRepository;
        _unitOfWork = unitOfWork;
        _usuariosService = usuariosService;
        _cursosService = cursosService;
        _cacheService = cacheService;
    }

    public async Task<Result<Guid>> Handle(CrearDocenteCommand request, CancellationToken cancellationToken)
    {
        if (!await _usuariosService.UsuarioExistAsync(request.usuarioId,cancellationToken))
        {
            return Result.Failure<Guid>(new Error("UsuarioNotFound","El usuario con ese id no existe"));
        }
        
        var cacheKey = $"curso_{request.especialidadId}";
        var cursoExist = await _cacheService.GetCacheValueAsync<bool>(cacheKey);
        if (!cursoExist)
        {
            cursoExist = await _cursosService.CursoExisteAsync(request.especialidadId,cancellationToken);
            var expirationTime = TimeSpan.FromMinutes(10);
            await _cacheService.SetCacheValueAsync(cacheKey,cursoExist, expirationTime);
        }
        if (!cursoExist)
        {
            return Result.Failure<Guid>(new Error("CursoNotFound","El curso con ese id no existe"));
        }

        var docente = Docente.Create(
            request.usuarioId,
            request.especialidadId
         );

        _docenteRepository.Add(docente.Value);

        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return docente.Value.Id;


    }
}