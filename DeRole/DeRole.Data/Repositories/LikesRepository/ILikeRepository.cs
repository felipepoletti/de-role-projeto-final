using DeRole.Entity.Domain;

namespace DeRole.Data.Repositories.LikesRepository
{
    public interface ILikeRepository
    {
        Task<Like> CreateAsync(Like likes);
        Task<ICollection<Like>> GetAllLikesAsync();
        Task DislikeAsync(int id);
    }
}
