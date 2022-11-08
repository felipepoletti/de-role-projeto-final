using DeRole.Data.Context;
using DeRole.Entity.Domain;

namespace DeRole.Data.Repositories.UsersRepository
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _applicationDbContext;

        public UserRepository(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public async Task<User> CreateAsync(User users)
        {
            _applicationDbContext.Add(users);
            await _applicationDbContext.SaveChangesAsync();
            return users;
        }

        public async Task DeleteAsync(int id)
        {
            _applicationDbContext.Remove(id);
            await _applicationDbContext.SaveChangesAsync();
        }

        public async Task EditAsync(User users)
        {
            _applicationDbContext.Update(users);
            await _applicationDbContext.SaveChangesAsync();
        }
    }
}
