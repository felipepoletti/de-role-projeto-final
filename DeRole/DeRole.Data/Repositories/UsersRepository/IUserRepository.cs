using DeRole.Entity.Domain;

namespace DeRole.Data.Repositories.UsersRepository
{
    public interface IUserRepository
    {
        Task<User> CreateAsync(User users);
        Task EditAsync(User users);
        Task DeleteAsync(int id);
    }
}
