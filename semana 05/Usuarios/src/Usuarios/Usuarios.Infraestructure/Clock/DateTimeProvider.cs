using Usuarios.Application.Abstractions.Clock;

namespace Usuarios.Infraestructure.Clock;

internal sealed class DateTimeProvider : IDateTimeProvider
{
    public DateTime CurrentTime => DateTime.UtcNow;
}