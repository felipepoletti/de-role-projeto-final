using DeRole.Services.DTOs;

namespace DeRole.Services.Service.Interfaces
{
    public interface IEventService
    {
        Task<ResultService<EventDto>> CreateAsync(EventDto eventDto);
    }
}
