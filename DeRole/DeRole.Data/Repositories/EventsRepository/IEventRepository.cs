using DeRole.Entity.Domain;

namespace DeRole.Data.Repositories.EventsRepository
{
    public interface IEventRepository
    {
        Task<Event> CreateAsync(Event events);
        Task<ICollection<Event>> GetAllEventsAsync();
        Task<ICollection<Event>> GetEventsByNameAsync(string eventName);
        Task<ICollection<Event>> GetEventsByEventTypeAsync(string eventType);
        Task<Event> GetEventByIdAsync(int id);
        Task EditAsync(Event events);
        Task DeleteAsync(Event eventToDelete);
        Task<ICollection<Event>> GetEventsByUserIdAsync(int id);
    }
}
