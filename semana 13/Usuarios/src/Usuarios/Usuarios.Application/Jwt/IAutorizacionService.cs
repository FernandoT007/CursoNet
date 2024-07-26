namespace Usuarios.Application.Jwt;

public interface IAutorizacionService
{
    Task<AutorizacionResponse> DevolverToken(AutorizacionRequest autorizacion, CancellationToken cancellationToken);
}