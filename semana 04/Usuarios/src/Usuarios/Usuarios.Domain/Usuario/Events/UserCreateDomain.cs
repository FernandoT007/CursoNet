using Usuarios.Domain.Abstractions;

namespace Usuarios.Domain.Usuario.Events;
public sealed record UserCreateDomain(Guid UserId) : IDomainEvent;