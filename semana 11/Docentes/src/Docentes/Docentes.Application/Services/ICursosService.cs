namespace Docentes.Application.Services;

public interface ICursosService
{
    Task<bool> CursoExisteAsync(Guid cursoId, CancellationToken cancellationToken);
}