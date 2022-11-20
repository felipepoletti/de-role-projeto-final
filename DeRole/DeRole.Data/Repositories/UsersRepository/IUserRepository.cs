using DeRole.Entity.Domain;

namespace DeRole.Data.Repositories.UsersRepository
{
    public interface IUserRepository
    {
        Task<ICollection<User>> GetAllUsersAsync();
        Task<User> GetUserByIdAsync(int id);
        Task<User> CreateAsync(User users);
        Task EditAsync(User users);
        Task DeleteAsync(User users);
        Task<User> GetUserByEmailAndPasswordAssync(string email, string password);
    }
}
