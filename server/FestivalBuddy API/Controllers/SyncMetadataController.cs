using FestivalBuddy_API.Viewmodels;
using FestivalBuddy_BLL.Logic;
using FestivalBuddy_Common.DTO;
using Microsoft.AspNetCore.Mvc;

namespace FestivalBuddy_API.Controllers
{
    [Route("metadata")]
    [ApiController]
    public class SyncMetadataController : Controller
    {
        private SyncMetaService syncMetaService;

        public SyncMetadataController(SyncMetaService syncMetaService)
        {
            this.syncMetaService = syncMetaService;
        }
        [HttpGet]
        public async Task<List<SyncMetadata>> GetCurrentVersions()
        {
            return await syncMetaService.GetCurrentVersions();
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
