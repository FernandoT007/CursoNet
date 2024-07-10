namespace Docentes.Application.Services;

public interface IUsuariosService
{
    Task<bool> UsuarioExistAsync(Guid usuarioId, CancellationToken cancellationToken);
}