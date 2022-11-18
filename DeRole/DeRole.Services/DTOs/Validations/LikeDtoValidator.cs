using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeRole.Services.DTOs.Validations
{
    public class LikeDtoValidator : AbstractValidator<LikeDto>
    {
        public LikeDtoValidator()
        {
            RuleFor(x => x.UserId)
                .NotEmpty()
                .NotNull()
                .WithMessage("Usuário não identificado.");

            RuleFor(x => x.EventId)
                .NotEmpty()
                .NotNull()
                .WithMessage("Evento não identificado.");
        }
    }
}
