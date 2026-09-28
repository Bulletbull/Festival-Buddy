using FestivalBuddy_API.DTO;
using FestivalBuddy_Common.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace FestivalBuddy_Common.Interface
{
    public interface IEventRepository
    {
        public Task<SyncMetadata> AddEvent(EventDTO dto);
        public Task<List<EventDTO>> GetEvents();
    }
}
