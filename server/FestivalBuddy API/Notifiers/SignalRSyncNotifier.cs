using FestivalBuddy_API.Hubs;
using FestivalBuddy_Common.Interface;
using Microsoft.AspNetCore.SignalR;

namespace FestivalBuddy_API.Notifiers
{
    public class SignalRSyncNotifier : ISyncNotifier
    {
        private readonly IHubContext<SyncHub> _hubContext;

        public SignalRSyncNotifier(IHubContext<SyncHub> hubContext)
        {
            _hubContext = hubContext;
        }

        public Task NotifyVersionUpdated(string key, long version)
        {
            return _hubContext.Clients.All.SendAsync(
                "VersionUpdated",
                new
                {
                    key,
                    version
                });
        }
    }
}
