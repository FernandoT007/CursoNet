using Amazon.Lambda.APIGatewayEvents;
using Amazon.Lambda.Core;
using MediatR;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Usuarios.Application;
using Usuarios.Application.Roles;
using Usuarios.Infrastructure;

[assembly: LambdaSerializer(typeof(Amazon.Lambda.Serialization.SystemTextJson.DefaultLambdaJsonSerializer))]

namespace Usuarios.Lambda;

public class LambdaEntryPoint
{
    private readonly IServiceProvider _serviceProvider;

    public LambdaEntryPoint()
    {
        _serviceProvider = CreateHostBuilder().Build().Services;
    }

    public async Task<APIGatewayProxyResponse> FunctionHandlerAsync(
        APIGatewayProxyRequest request,
        ILambdaContext context
    ){
        using var scope = _serviceProvider.CreateScope();
        var sender = scope.ServiceProvider.GetRequiredService<ISender>();

        var query = new GetRolesQuery();
        var result = await sender.Send(query,CancellationToken.None);

        return new APIGatewayProxyResponse{
            StatusCode = result.IsSuccess ? 200 : 400,
            Body = result.IsSuccess ? result.ToString() : "NotFound"
        };
    }

    public static IHostBuilder CreateHostBuilder() =>
        Host.CreateDefaultBuilder()
            .ConfigureAppConfiguration((context, config) =>
            {
                config.AddJsonFile("appsettings.json",optional:true,reloadOnChange : true);
            })
            .ConfigureServices((context, services) =>
            {
               services.AddApplication();
               services.AddInfrastructure(context.Configuration);
               services.AddMediatR(x => x.RegisterServicesFromAssembly(typeof(GetRolesQuery).Assembly));
            });

}