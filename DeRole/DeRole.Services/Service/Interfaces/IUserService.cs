using DeRole.Services.DTOs;

namespace DeRole.Services.Service.Interfaces
{
    public interface IUserService
    {
        Task<ResultService<UserDto>> CreateAsync(UserDto userDto);
    }
}
