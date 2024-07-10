using Docentes.Application.Services;
using Docentes.Domain.Abstractions;
using Docentes.Domain.CursosImpartidos;
using Docentes.Domain.Docentes;
using Docentes.Infrastructure.Repositories;
using Docentes.Infrastructure.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;

namespace Docentes.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(
       this IServiceCollection services,
       IConfiguration configuration
   )
    {
        var connectionStringPostreges = configuration.GetConnectionString("Database")
        ?? throw new ArgumentNullException(nameof(configuration));

        var connectionStringRedis = configuration.GetConnectionString("redis")
        ?? throw new ArgumentNullException(nameof(configuration));

        var usuariosApiBaseUrl = configuration["UsuariosApiBaseUrl"];
        var cursosApiBaseUrl = configuration["CursosApiBaseUrl"];

        services.AddDbContext<ApplicationDbContext>(
            options =>
            {
                options.UseNpgsql(connectionStringPostreges).UseSnakeCaseNamingConvention(); // usuario, producto_detalle
            }
        );

        services.AddSingleton<IConnectionMultiplexer>( sp =>
        {
         var configurationRedis = ConfigurationOptions.Parse(connectionStringRedis);
         return ConnectionMultiplexer.Connect(configurationRedis);
        });

        services.AddScoped<IDocenteRepository, DocenteRepository>();
        services.AddScoped<ICursoImpartidoRepository, CursoImpartidoRepository>();
        services.AddScoped<ICacheService, CacheService>();

        services.AddScoped<IUnitOfWork>(sp => sp.GetRequiredService<ApplicationDbContext>());

        services.AddHttpClient<ICursosService,CursosService>( client =>
        {
            client.BaseAddress = new Uri(cursosApiBaseUrl!);
        });

        services.AddHttpClient<IUsuariosService,UsuariosService>( client =>
        {
            client.BaseAddress = new Uri(usuariosApiBaseUrl!);
        });


        return services;
    }
}