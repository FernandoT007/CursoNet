namespace Usuarios.Application.Usuarios.GetUsuarios;

public sealed class UsuarioResponse
{
    public Guid Id { get; init; }

    public string? Nombres { get; init; }
    public string? ApellidoPaterno { get; init; }
    public string? ApellidoMaterno { get; init; }

    public string? Rol { get; init; }
    public string? Direcion { get; init; }

    public DateTime FechaNacimiento { get; init; }
    public string? CorreoElectronico { get; init; }
    public int Estado { get; init; }
    public DateTime FechaUltimoCambio { get; init; }

}