using DeRole.Entity.Domain;

namespace DeRole.Data.Repositories.EventsRepository
{
    public interface IEventRepository
    {
        Task<Event> CreateAsync(Event events);
        Task<ICollection<Event>> GetAllEventsAsync();
        Task<ICollection<Event>> GetEventsByFilterAsync();
        Task<Event> GetEventById(int id);
        Task EditAsync(Event events);
        Task DeleteAsync(Event eventToDelete);
    }
}
