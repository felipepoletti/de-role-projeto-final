using DeRole.Data.Context;
using DeRole.Entity.Domain;
using Microsoft.EntityFrameworkCore;

namespace DeRole.Data.Repositories.EventsRepository
{
    public class EventRepository : IEventRepository
    {
        private readonly ApplicationDbContext _applicationDbContext;

        public EventRepository(ApplicationDbContext applicationDbContext)
        {
            _applicationDbContext = applicationDbContext;
        }

        public async Task<Event> CreateAsync(Event events)
        {
            _applicationDbContext.Add(events);
            await _applicationDbContext.SaveChangesAsync();
            return events;
        }

        public async Task DeleteAsync(Event eventToDelete)
        {
            _applicationDbContext.Remove(eventToDelete);
            await _applicationDbContext.SaveChangesAsync();
        }

        public async Task EditAsync(Event events)
        {
            _applicationDbContext.Update(events);
            await _applicationDbContext.SaveChangesAsync();
        }

        public async Task<ICollection<Event>> GetAllEventsAsync()
        {
            return await _applicationDbContext.Events.ToListAsync();
        }

        public async Task<Event> GetEventByIdAsync(int id)
        {
            return await _applicationDbContext.Events.FirstOrDefaultAsync(x => x.Id == id);
        }

        public async Task<ICollection<Event>> GetEventsByUserIdAsync(int id)
        {
            return await _applicationDbContext.Events.Where(x => x.UserId == id).ToListAsync();
        }

        public async Task<ICollection<Event>> GetEventsByEventTypeAsync(string eventType)
        {
            return await _applicationDbContext.Events.Where(x => x.EventType.Contains(eventType)).ToListAsync();
        }

        public async Task<ICollection<Event>> GetEventsByNameAsync(string eventName)
        {
            return await _applicationDbContext.Events.Where(x => x.EventName.Contains(eventName)).ToListAsync();
        }
    }
}
