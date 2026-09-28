namespace FestivalBuddy_API.DTO
{
    public class EventDTO
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public DateTime Date { get; set; }
        public string Location { get; set; } = string.Empty;
    }
}
