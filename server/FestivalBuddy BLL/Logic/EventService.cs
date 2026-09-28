using FestivalBuddy_API.Domain;
using FestivalBuddy_API.DTO;
using FestivalBuddy_Common.DTO;
using FestivalBuddy_Common.Interface;

namespace FestivalBuddy_API.Logic
{
    public class EventService
    {
        private IEventRepository eventRepository;
        private readonly ISyncNotifier _syncNotifier;
        public EventService(IEventRepository EventRepository, ISyncNotifier syncNotifier)
        {
            eventRepository = EventRepository;
            _syncNotifier = syncNotifier;
        }

        public async Task AddEvent(Event _event)
        {
            SyncMetadata metadata =  await eventRepository.AddEvent(_event.GetDTO());
            await _syncNotifier.NotifyVersionUpdated(metadata.Key, metadata.Version);
        }
        public async Task<List<Event>> GetEvents()
        {
            List<EventDTO> dtos = await eventRepository.GetEvents();
            List<Event> events = dtos.Select(dto => new Event(dto)).ToList();

            return events;
        }
    }
}
