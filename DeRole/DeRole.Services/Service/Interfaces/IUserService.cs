using DeRole.Services.DTOs;

namespace DeRole.Services.Service.Interfaces
{
    public interface IUserService
    {
        Task<ResultService<UserDto>> CreateAsync(UserDto userDto);
        Task<ResultService<ICollection<UserDto>>> GetUsersAsync();
        Task<ResultService<UserDto>> GetUsersByIdAsync(int id);
        Task<ResultService> UpdateUserAsync(UserDto userDto);
        Task<ResultService> DeleteUserAsync(int id);
        Task<ResultService<dynamic>> GenerateTokenAsync(string email, string senha);
    }
}
