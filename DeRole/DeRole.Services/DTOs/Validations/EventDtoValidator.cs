using FluentValidation;

namespace DeRole.Services.DTOs.Validations
{
    public class EventDtoValidator : AbstractValidator<EventDto>
    {
        public EventDtoValidator()
        {
            RuleFor(x => x.EventName)
                .NotEmpty()
                .NotNull()
                .WithMessage("Nome do evento deve ser informado!");

            RuleFor(x => x.EventDescription)
                .NotEmpty()
                .NotNull()
                .WithMessage("A descrição deve ser informado!");

            RuleFor(x => x.Date)
                .NotEmpty()
                .NotNull()
                .WithMessage("A data do evento deve ser informada!");
            
            RuleFor(x => x.Time)
                .NotEmpty()
                .NotNull()
                .WithMessage("A hora do evento deve ser informada!");

            RuleFor(x => x.Address)
                .NotEmpty()
                .NotNull()
                .WithMessage("O endereço deve ser informado!");

            RuleFor(x => x.AddressNumber)
                .NotEmpty()
                .NotNull()
                .WithMessage("O número do endereço deve ser informado!");

            RuleFor(x => x.EventType)
                .NotEmpty()
                .NotNull()
                .WithMessage("O tipo de evento deve ser informado");
            
        }
    }
}
