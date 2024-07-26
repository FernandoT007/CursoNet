using Estudiantes.Application.Estudiantes.CrearEstudiante;
using Estudiantes.Application.Services;
using Estudiantes.Domain.Abstractions;
using Estudiantes.Domain.Estudiantes;
using FluentAssertions;
using Moq;

namespace Estudiantes.Application.Tests
{
    public class CreateEstudianteCommandHandlerTests
    {
        [Fact]
        public async void Handle_ValidRequest_CreateEstudiante()
        {
            var mockEstudianteRepository = new Mock<IEstudianteRepository>();
            var mockUnitOfWork = new Mock<IUnitOfWork>();
            var mockUsuarioService = new Mock<IUsuariosService>();

           var handler= new CrearEstudianteCommandHandler(
                mockEstudianteRepository.Object,
                mockUnitOfWork.Object,
                mockUsuarioService.Object
           );

           var command = new CrearEstudianteCommand(Guid.NewGuid());

           var result = await handler.Handle(command,CancellationToken.None);

           result.Should().BeOfType<Result<Guid>>();

        }
    }
}