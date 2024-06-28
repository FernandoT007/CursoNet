namespace Cursos.Infrastructure.Data;

public record MongoDbSettings(
    string ConnectionString,
    string DatabaseName
);
