using Usuarios.Application.Abstractions.Email;
using Usuarios.Domain.Usuarios;

namespace Usuarios.Infraestructure.Email;

public class EmailServices : IEmailService
{
    public Task SendAsnyc(CorreoElectronico correoElectronico, string subject, string body)
    {
        return Task.CompletedTask;
    }
}