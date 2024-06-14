using Microsoft.EntityFrameworkCore;
using Usuarios.Domain.Abstractions;

namespace Usuarios.Infraestructure;

public sealed class ApplicationDbContext : DbContext, IUnitOfWork
{
    public ApplicationDbContext(DbContextOptions options)   : base(options)
    {
        
    }
    public Task<int> SaveChangesAsnyc(CancellationToken cancellationToken = default)
    {
        throw new NotImplementedException();
    }
}