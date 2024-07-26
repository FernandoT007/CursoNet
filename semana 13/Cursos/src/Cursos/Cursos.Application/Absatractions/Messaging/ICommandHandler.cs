using Cursos.Domain.Abtrastions;
using MediatR;

namespace Cursos.Application.Absatractions.Messaging;

public interface ICommandHandler<TCommand> : IRequestHandler<TCommand,Result>
where TCommand : ICommand
{
    
}

public interface ICommandHandler<TCommand,TResponse> : IRequestHandler<TCommand,Result<TResponse>>
where TCommand : ICommand<TResponse>
{
    
}