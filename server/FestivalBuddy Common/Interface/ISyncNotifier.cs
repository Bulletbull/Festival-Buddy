using System;
using System.Collections.Generic;
using System.Text;

namespace FestivalBuddy_Common.Interface
{
    public interface ISyncNotifier
    {
        Task NotifyVersionUpdated(string key, long version);
    }
}
