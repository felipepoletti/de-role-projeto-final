using AutoMapper;
using DeRole.Data.Repositories.UsersRepository;
using DeRole.Entity.Domain;
using DeRole.Services.DTOs;
using DeRole.Services.DTOs.Validations;
using DeRole.Services.Service.Interfaces;

namespace DeRole.Services.Service
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly IMapper _mapper;

        public UserService(IUserRepository userRepository, IMapper mapper)
        {
            _userRepository = userRepository;
            _mapper = mapper;
        }

        public async Task<ResultService<UserDto>> CreateAsync(UserDto userDto)
        {
            if (userDto == null)
                return ResultService.Fail<UserDto>("O objeto deve ser informado!");

            var result = new UserDtoValidator().Validate(userDto);

            if (!result.IsValid)
                return ResultService.RequestError<UserDto>("Não foi possível validar o objeto.", result);

            var user = _mapper.Map<User>(userDto);
            var data = await _userRepository.CreateAsync(user);

            return ResultService.Ok<UserDto>(_mapper.Map<UserDto>(data));

        }
    }
}
