using FestivalBuddy_API.Domain;

namespace FestivalBuddy_API.Viewmodels
{
    public class EventVM
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public DateTime Date { get; set; }
        public string Location { get; set; } = string.Empty;

        public EventVM()
        {
        }

        public EventVM(Event @event)
        {
            Id = @event.id;
            Name = @event._name;
            Date = @event.date;
            Location = @event.location;
        }

        public Event ToEvent() {
            return new Event(Id, Name, Date.ToUniversalTime(), Location);
        }
    }
}
