using FestivalBuddy_API.DTO;
using FestivalBuddy_Common.DTO;
using FestivalBuddy_Common.Interface;
using FestivalBuddy_DAL;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace FestivalBuddy_API.Repository
{
    public class EventRepository : IEventRepository
    {
        private readonly FestivalBuddyContext _context;

        public EventRepository(FestivalBuddyContext festivalBuddyContext)
        {
            _context = festivalBuddyContext;
        }
        public async Task<List<EventDTO>> GetEvents()
        {
            return await _context.Events.ToListAsync();
        }
        public async Task<SyncMetadata> AddEvent(EventDTO eventDTO)
        {
            _context.Events.Add(eventDTO);
            SyncMetadata metadata = await _context.metaDatas
            .FirstAsync(x => x.Key == "program");

            metadata.Version++;
            await _context.SaveChangesAsync();
            return metadata;
        } 
    }
}
