using AutoMapper;
using DeRole.Entity.Domain;
using DeRole.Services.DTOs;

namespace DeRole.Services.Mappings
{
    public class DomainToDtoMap : Profile
    {
        public DomainToDtoMap()
        {
            CreateMap<User, UserDto>();
        }
    }
}
