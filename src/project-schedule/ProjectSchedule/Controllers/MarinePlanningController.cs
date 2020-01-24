using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using project.schedule.Data;
using project.schedule.Services;
using ProjectSchedule.Models.MarinePlanning;
using ProjectSchedule.Services;
using Swashbuckle.AspNetCore.Annotations;

namespace ProjectSchedule.Controllers
{
    [Route("marineplanning")]
    [ApiController]
    [Produces("application/json")]
    [Authorize(Policy = "Reader")]
    public class MarinePlanningController : ControllerBase
    {
        private readonly DatabaseContext _context;
        private readonly ILogger<MarinePlanningController> _logger;

        public MarinePlanningController(DatabaseContext context, ILogger<MarinePlanningController> logger)
        {
            _context = context;
            _logger = logger;
        }
        [HttpGet("{id}")]
        [SwaggerOperation()]
        [SwaggerResponse(200, "Success", typeof(MarinePlanningResponse))]
        [SwaggerResponse(400, "Bad Request")]
        public ActionResult<MarinePlanningResponse> GetPlanningActivitiesForMarinePlanningByFacilityCode(string id, [FromQuery(Name="page-size")]int pageSize = 25, [FromQuery(Name = "page-index")]int pageIndex = 1 )
        {
            try
            {
                var entries = _context.MarinePlanning.Where(f => f.FacilityCode == id).OrderBy(f => f.EstimatedStart).Skip((pageIndex -1) * pageSize).Take(pageSize).ToList();
                var responseEntries = new List<MarinePlanEntry>();
                foreach (var s in entries)
                {
                    var en = new MarinePlanEntry
                    {
                        ActivityNumber = s.ActivityNumber,
                        Contractor = s.Contractor,
                        Description = s.ActivityDescription,
                        Start = s.EstimatedStart,
                        Finish = s.EstimatedFinish,
                        TypeLevel1 = s.TypeLevel1,
                        TypeLevel2 = s.TypeLevel2,
                        TypeLevel3 = s.TypeLevel3,
                        TypeLevel4 = s.TypeLevel4,
                        MarineOps = s.MarineOps,
                        VesselName = s.VesselName,
                        VesselType = s.VesselType,
                        ProContractor = s.ProContractor,
                        StartTagNumber = s.StartTagNumber,
                        InstalledTags = s.InstalledTags != null ? new Tags[] { new Tags {Id = s.InstalledTags, Link = LinkHelper.GetLink(typeof(Tags), s.InstalledTags, id) } } : null,
                        System = s.SystemNumber != null ? new Models.MarinePlanning.System { No = s.SystemNumber, Link = LinkHelper.GetLink(typeof(Models.MarinePlanning.System), s.SystemNumber, id) } : null,
                        Map = s.MapId != null ? new Map { Id = s.MapId, Link = LinkHelper.GetLink(typeof(Map), s.MapId, id) } : null,
                        InstalledComponents = s.InstalledComponents != null ? new string[] { s.InstalledComponents} : null,
                        PositionTagNumbers = s.PositionTagNumbers != null ? new string[] { s.PositionTagNumbers } : null
                    };

                    responseEntries.Add(en);
                }
                var maxResults = _context.MarinePlanning.Where(f => f.FacilityCode == id).Count();
                var MarinePlanning = new MarinePlanningResponse { MarinePlanEntries = responseEntries, Installation = id, Total = maxResults, NextLink = GetNextLink(pageSize, pageIndex, maxResults), PreviousLink = GetPreviousLink(pageSize, pageIndex) };
                return Ok(MarinePlanning);
            }
            catch (Exception e)
            {
                _logger.LogError("{message}  -  {stack}", e.Message, e.StackTrace);
                return BadRequest();
            }
                
        }

        private string GetPreviousLink(int pageSize, int pageIndex)
        {
            if(!((pageIndex -1 ) >= 1))
            {
                return null;
            }
            var link = Url.Action("GetMarinePlanningsByInstallation") + $"?page-size={pageSize}&page-index={pageIndex-1}";
            return link;
        }

        private string GetNextLink(int pageSize, int pageIndex, int maxResults)
        {
            if ((pageIndex * pageSize) == maxResults || ((pageIndex*pageSize) + 1 > maxResults))
            {
                return null;
            }
            var link = Url.Action("GetMarinePlanningsByInstallation") + $"?page-size={pageSize}&page-index={pageIndex + 1}";
            return link;
        }
        
    }
}

//var MarinePlanEntires = new List<MarinePlanEntry>() {
//    new MarinePlanEntry {
//        ActivityNumber = "JC_ManCB.1",
//        Description = "DP trials & installation of Manifold  CA",
//        Start = "2019-06-15T00:00:00+01:00",
//        Finish = "2019-06-17T00:00:00+01:00",
//        VesselName = "Normand Vision",
//        VesselType = "Construction vessel",
//        ProContractor = "Ocean Installer",
//        Contractor = "Ocean Installer - Marine Operations",
//        MarineOps = "Construction Work",
//        TypeLevel1 = "Subsea",
//        TypeLevel2 = "Marine Operations",
//        TypeLevel3 = "Marine Operations",
//        TypeLevel4 = "Offshore installation",
//        System = new Models.MarinePlanning.System { no = "89", link = "https://api.gateway.equinor.com/facility/system/installation/JCA/system/89" },
//        InstalledTags = new Tags[] { new Tags {id = "18UD5501", link="https://api.gateway.equinor.com/plant/equipment/tag/18UD5501" } },
//        InstalledComponents = new string[] { "Manifold DA" },
//        PositionTagNumbers = new string[] {""},
//        StartTagNumber = "",
//        Map = new Map { id = "EB_MAN", link = "https://mapservice.equinor.com/ID=EB_MAN" }
//    }, new MarinePlanEntry {
//        ActivityNumber = "JC_SatZB",
//        Description = "DP trials & installation of Template EB (incl.Inst.VXT hatches)",
//        Start = "2019-06-17T00:00:00+01:00",
//        Finish = "2019-06-18T00:00:00+01:00",
//        VesselName = "Normand Vision",
//        VesselType = "Construction vessel",
//        ProContractor = "Ocean Installer",
//        Contractor = "Ocean Installer - Marine Operations",
//        MarineOps = "Construction Work",
//        TypeLevel1 = "Subsea",
//        TypeLevel2 = "Marine Operations",
//        TypeLevel3 = "Marine Operations",
//        TypeLevel4 = "Offshore installation",
//        System = new Models.MarinePlanning.System { no = "89", link = "https://api.gateway.equinor.com/plant/operationandmaintenance/systemcodes/JCA/89" },
//        InstalledTags = new Tags[] { new Tags {id = "18UD2000", link= "https://api.gateway.equinor.com/plant/equipment/tag/18UD2000" } },
//        InstalledComponents = new string[] { "Template CC" },
//        PositionTagNumbers = new string[] {""},
//        StartTagNumber = "",
//        Map = new Map { id = "EB_MAN", link = "https://mapservice.equinor.com/ID=EB_MAN" } } };