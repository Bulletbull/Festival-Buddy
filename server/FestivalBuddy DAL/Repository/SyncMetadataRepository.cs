using FestivalBuddy_Common.DTO;
using FestivalBuddy_Common.Interface;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace FestivalBuddy_DAL.Repository
{
    public class SyncMetadataRepository : ISyncMetadataRepository
    {
        private readonly FestivalBuddyContext _context;

        public SyncMetadataRepository(FestivalBuddyContext context)
        {
            _context = context;
        }

        public async Task<List<SyncMetadata>> GetCurrentVersions()
        {
            return await _context.metaDatas.ToListAsync();
        }
    }
}
