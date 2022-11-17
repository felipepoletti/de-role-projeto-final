using AutoMapper;
using DeRole.Entity.Domain;

namespace DeRole.Services.DTOs.Validations
{
    public class DtoToDomainMap : Profile
    {
        public DtoToDomainMap()
        {
            CreateMap<UserDto, User>();

            CreateMap<EventDto, Event>();
        }
    }
}
