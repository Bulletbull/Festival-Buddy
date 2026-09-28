using FestivalBuddy_Common.DTO;
using FestivalBuddy_Common.Interface;
using System;
using System.Collections.Generic;
using System.Text;

namespace FestivalBuddy_BLL.Logic
{
    public class SyncMetaService
    {
        private ISyncMetadataRepository syncMetadataRepository;

        public SyncMetaService(ISyncMetadataRepository syncMetadataRepository)
        {
            this.syncMetadataRepository = syncMetadataRepository;
        }

        public async Task<List<SyncMetadata>> GetCurrentVersions()
        {
            return await syncMetadataRepository.GetCurrentVersions();
        }
    }
}
