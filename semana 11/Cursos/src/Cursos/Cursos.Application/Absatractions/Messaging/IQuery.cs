using Cursos.Domain.Abtrastions;
using MediatR;

namespace Cursos.Application.Absatractions.Messaging;

public interface IQuery<TResponse> : IRequest<Result<TResponse>>
{
    
}
