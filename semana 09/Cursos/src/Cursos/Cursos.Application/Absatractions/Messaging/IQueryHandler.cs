using Cursos.Domain.Abtrastions;
using MediatR;

namespace Cursos.Application.Absatractions.Messaging;

public interface IQueryHandler<TQuery,TResponse> 
: IRequestHandler<TQuery,Result<TResponse>>
where TQuery : IQuery<TResponse>
{
    
}