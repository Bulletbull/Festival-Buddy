using System;
using System.Collections.Generic;
using System.Text;

namespace FestivalBuddy_Common.DTO
{
    public class SyncMetadata
    {
        public string Key { get; set; } = string.Empty;
        public long Version { get; set; }
    }
}
