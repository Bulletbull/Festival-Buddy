using FestivalBuddy_API.DTO;

namespace FestivalBuddy_API.Domain
{
    public class Event
    {
        public int id { get; private set;  }
        public string _name { get; private set; }
        public DateTime date { get; private set; }
        public string location { get; private set; }

        public EventDTO GetDTO()
        {
            return new EventDTO()
            {
                Name = _name,
                Date = date,
                Location = location
            };
        }
        public Event(int Id, string Name, DateTime Date, string Location)
        {
            id = Id;
            _name = Name;
            date = Date;
            location = Location;
        }

        public Event(EventDTO dto)
        {
            id = dto.Id;
            _name = dto.Name;
            date = dto.Date;
            location = dto.Location;
        } 
    }
}
