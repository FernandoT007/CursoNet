namespace Usuarios.Domain.Abstractions;

public interface IUnitOfWork
{
    Task<int> SaveChangesAsnyc(CancellationToken cancellationToken = default);
}