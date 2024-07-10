using Cursos.Infrastructure.Data;
using MongoDB.Driver;

namespace Cursos.Api.Extensions;

public static class SeedDataExtensions
{
    public static void SeedData(this IApplicationBuilder app)
        {
            using var scope = app.ApplicationServices.CreateScope();
            var mongoDatabase = scope.ServiceProvider.GetRequiredService<IMongoDatabase>();
            CursoDataSeeder.SeedCursosAsync(mongoDatabase).Wait(); // Llama al seeder para cursos
        } 
}