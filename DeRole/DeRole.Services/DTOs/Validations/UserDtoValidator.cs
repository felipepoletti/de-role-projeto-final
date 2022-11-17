using FluentValidation;

namespace DeRole.Services.DTOs.Validations
{
    public class UserDtoValidator : AbstractValidator<UserDto>
    {
        public UserDtoValidator()
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .NotNull()
                .WithMessage("Nome deve ser informado!");

            RuleFor(x => x.Email)
                .NotEmpty()
                .NotNull()
                .WithMessage("Email deve ser informado!");

            RuleFor(x => x.Password)
                .NotEmpty()
                .NotNull()
                .WithMessage("Senha deve ser informada!");

            RuleFor(x => x.BirthDate)
                .NotEmpty()
                .NotNull()
                .WithMessage("Data de nascimento deve ser informada!");
        }
    }
}
