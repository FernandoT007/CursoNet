using Bogus;
using Cursos.Domain.Cursos;
using MongoDB.Driver;

namespace Cursos.Infrastructure.Data;

public static class CursoDataSeeder
{
    public static async Task SeedCursosAsync(IMongoDatabase database, CancellationToken cancellationToken = default)
    {
        var cursosCollection = database.GetCollection<Curso>("Cursos");
        var count = await cursosCollection.CountDocumentsAsync(FilterDefinition<Curso>.Empty, cancellationToken: cancellationToken);

        if (count == 0)
        {
            var faker = new Faker("es");
            List<Curso> cursos = new List<Curso>();
            for (int i = 0; i < 20; i++)
            {
              var curso = Curso.Create
                (
                   new NombreCurso(faker.Commerce.Department()),
                   new DescripcionCurso(faker.Lorem.Paragraph()),
                   new CapacidadCurso(faker.Random.Int(10, 50))
                );
                cursos.Add(curso);
            }
             await cursosCollection.InsertManyAsync(cursos, cancellationToken: cancellationToken);
        }
    }
}