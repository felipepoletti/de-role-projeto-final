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

        public async Task DeleteAsync(int id)
        {
            _applicationDbContext.Remove(id);
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

        public Task<ICollection<Event>> GetAllEventsByFilterAsync()
        {
            throw new NotImplementedException();
        }
    }
}
