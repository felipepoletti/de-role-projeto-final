using DeRole.Services.DTOs;

namespace DeRole.Services.Service.Interfaces
{
    public interface IEventService
    {
        Task<ResultService<EventDto>> CreateAsync(EventDto eventDto);
        Task<ResultService<ICollection<EventDto>>> GetEventsAsync();
        Task<ResultService> UpdateEventAsync(EventDto eventDto);
        Task<ResultService> DeleteEventAsync(int id);
    }
}
