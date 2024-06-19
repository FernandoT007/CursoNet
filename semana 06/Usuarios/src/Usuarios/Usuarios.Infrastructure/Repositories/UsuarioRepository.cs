using Usuarios.Domain.Usuarios;

namespace Usuarios.Infrastructure.Repositories;

internal sealed class UsuarioRepository : Repository<Usuario>, IUsuarioRepository
{
    public UsuarioRepository(ApplicationDbContext dbContext) : base(dbContext)
    {
        
    }
}