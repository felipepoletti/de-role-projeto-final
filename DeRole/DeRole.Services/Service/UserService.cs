using AutoMapper;
using DeRole.Data.Authentication;
using DeRole.Data.Repositories.UsersRepository;
using DeRole.Entity.Domain;
using DeRole.Services.DTOs;
using DeRole.Services.DTOs.Validations;
using DeRole.Services.Service.Interfaces;
using System.ComponentModel.DataAnnotations;

namespace DeRole.Services.Service
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly ITokenGenerator _tokenGenerator;
        private readonly IMapper _mapper;

        public UserService(IUserRepository userRepository, ITokenGenerator tokenGenerator, IMapper mapper)
        {
            _userRepository = userRepository;
            _tokenGenerator = tokenGenerator;
            _mapper = mapper;
        }

        public async Task<ResultService<UserDto>> CreateAsync(UserDto userDto)
        {
            if (userDto == null)
                return ResultService.Fail<UserDto>("O objeto deve ser informado!");

            var result = new UserDtoValidator().Validate(userDto);

            if (!result.IsValid)
                return ResultService.RequestError<UserDto>("Objeto invalido.", result);

            var user = _mapper.Map<User>(userDto);
            var data = await _userRepository.CreateAsync(user);

            return ResultService.Ok<UserDto>(_mapper.Map<UserDto>(data));
        }

        public async Task<ResultService> DeleteUserAsync(int id)
        {
            var user = await _userRepository.GetUserByIdAsync(id);

            if (user == null)
                return ResultService.Fail("Usuário não encontrado");

            await _userRepository.DeleteAsync(user);
            return ResultService.Ok("Usuário deletado.");
        }

        public async Task<ResultService<dynamic>> GenerateTokenAsync(string email, string senha)
        {
            if (email == null || senha == null)
                return ResultService.Fail<dynamic>("Usuário ou senha devem ser informado.");

            var user = await _userRepository.GetUserByEmailAndPasswordAssync(email, senha);

            if (user == null)
                return ResultService.Fail<dynamic>("Usuário ou senha inválidos");

            return ResultService.Ok(_tokenGenerator.Generator(user));
        }

        public async Task<ResultService<ICollection<UserDto>>> GetUsersAsync()
        {
            var users = await _userRepository.GetAllUsersAsync();
            return ResultService.Ok<ICollection<UserDto>>(_mapper.Map<ICollection<UserDto>>(users));
        }

        public async Task<ResultService<UserDto>> GetUsersByIdAsync(int id)
        {
            var user = await _userRepository.GetUserByIdAsync(id);

            if (user == null)
                return ResultService.Fail<UserDto>("Pessoa não encontrada!");

            return ResultService.Ok(_mapper.Map<UserDto>(user));
        }

        public async Task<ResultService> UpdateUserAsync(UserDto userDto)
        {
            if (userDto == null)
                return ResultService.Fail("Usuário deve ser informado!");

            var validation = new UserDtoValidator().Validate(userDto);

            if (!validation.IsValid)
                return ResultService.RequestError("Erro ao validar os campos!", validation);

            var user = await _userRepository.GetUserByIdAsync(userDto.Id);

            if (user == null)
                return ResultService.Fail("Pessoa não encontrada");

            user = _mapper.Map<UserDto, User>(userDto, user);
            await _userRepository.EditAsync(user);

            return ResultService.Ok("Usuário editado!");
        }
    }
}
