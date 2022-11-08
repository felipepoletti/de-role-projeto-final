using DeRole.Entity.Domain;

namespace DeRole.Data.Repositories.EventsRepository
{
    public interface IEventRepository
    {
        Task<Event> CreateAsync(Event events);
        Task<ICollection<Event>> GetAllEventsAsync();
        Task<ICollection<Event>> GetAllEventsByFilterAsync();
        Task EditAsync(Event events);
        Task DeleteAsync(int id);
    }
}
