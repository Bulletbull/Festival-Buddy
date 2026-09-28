using FestivalBuddy_Common.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace FestivalBuddy_Common.Interface
{
    public interface ISyncMetadataRepository
    {
        public Task<List<SyncMetadata>> GetCurrentVersions();
    }
}
