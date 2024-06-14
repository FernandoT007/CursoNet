using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Usuarios.Application.Abstractions.Clock;
using Usuarios.Application.Abstractions.Email;
using Usuarios.Infraestructure.Clock;
using Usuarios.Infraestructure.Email;

namespace Usuarios.Infraestructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfraestructure(
        this IServiceCollection services,
        IConfiguration configuration
    )
    {
        services.AddTransient<IDateTimeProvider,DateTimeProvider>();
        services.AddTransient<IEmailService,EmailServices>();

        var connectionString = configuration.GetConnectionString("Database")
        ?? throw new ArgumentNullException(nameof(configuration));

        services.AddDbContext<ApplicationDbContext>(
            options => {
                options.UseNpgsql(connectionString).UseUpperSnakeCaseNamingConvention(); // usuario, producto_detalle
            }
        );

        return services;
    }
}
