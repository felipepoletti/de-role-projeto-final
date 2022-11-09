using DeRole.Data.Context;
using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore;

namespace DeRole.Data.Repositories.LikesRepository
{
    public class LikeRepository : ILikeRepository
    {
        private readonly ApplicationDbContext _applicationDbContext;

        public LikeRepository(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public async Task<Like> CreateAsync(Like likes)
        {
            _applicationDbContext.Add(likes);
            await _applicationDbContext.SaveChangesAsync();
            return likes;
        }

        public async Task DislikeAsync(int id)
        {
            _applicationDbContext.Remove(id);
            await _applicationDbContext.SaveChangesAsync();
        }

        public async Task<ICollection<Like>> GetAllLikesAsync()
        {
            return await _applicationDbContext.Likes
                .Include(x => x.User)
                .Include(x => x.Event)
                .ToListAsync();
        }
    }
}
