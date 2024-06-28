using Cursos.Domain.Abtrastions;
using MediatR;

namespace Cursos.Application.Absatractions.Messaging;

public interface ICommand : IRequest<Result>, IBaseCommand
{
    
}

public interface ICommand<TResponse> : IRequest<Result<TResponse>>, IBaseCommand
{

}

public interface IBaseCommand
{

}