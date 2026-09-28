using FestivalBuddy_API.Domain;
using FestivalBuddy_API.Logic;
using FestivalBuddy_API.Viewmodels;
using FestivalBuddy_Common.Interface;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FestivalBuddy_API.Controllers
{
    [Route("event")]
    [ApiController]
    public class EventController : ControllerBase
    {
        private readonly EventService eventService;
        
        public EventController(EventService EventService)
        {
            eventService = EventService;
        }
        // GET: api/<EventController>
        [HttpGet]
        public async Task<List<EventVM>> Get()
        {
            var dtos = await eventService.GetEvents();

            return dtos
                .Select(dto => new EventVM(dto))
                .ToList();
        }

        // GET api/<EventController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<EventController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] EventVM eventVM)
        {
            var @event = eventVM.ToEvent();

            await eventService.AddEvent(@event);

            return Ok();
        }

        // PUT api/<EventController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<EventController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
