using Estudiantes.Domain.Matriculas;

namespace Estudiantes.Infrastructure.Repositories;

internal sealed class MatriculaRepository : Repository<Matricula>, IMatriculaRepository
{
    public MatriculaRepository(ApplicationDbContext dbContext) : base(dbContext)
    {
        
    }
}