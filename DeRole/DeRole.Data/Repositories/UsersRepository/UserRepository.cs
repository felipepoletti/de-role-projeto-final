using DeRole.Data.Context;
using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore;

namespace DeRole.Data.Repositories.UsersRepository
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _applicationDbContext;

        public UserRepository(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public async Task<ICollection<User>> GetAllUsersAsync()
        {
            return await _applicationDbContext.Users.ToListAsync();
        }

        public async Task<User> GetUserByIdAsync(int id)
        {
            return await _applicationDbContext.Users.FirstOrDefaultAsync(x => x.Id == id);
        }

        public async Task<User> CreateAsync(User users)
        {
            _applicationDbContext.Add(users);
            await _applicationDbContext.SaveChangesAsync();
            return users;
        }

        public async Task DeleteAsync(User users)
        {
            _applicationDbContext.Remove(users);
            await _applicationDbContext.SaveChangesAsync();
        }

        public async Task EditAsync(User users)
        {
            _applicationDbContext.Update(users);
            await _applicationDbContext.SaveChangesAsync();
        }

        public async Task<User> GetUserByEmailAndPasswordAssync(string email, string password)
        {
            return await _applicationDbContext.Users.FirstOrDefaultAsync(x => x.Email == email && x.Password == password);
        }
    }
}
