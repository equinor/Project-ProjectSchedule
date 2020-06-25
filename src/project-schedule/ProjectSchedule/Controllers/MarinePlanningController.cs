using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using project.schedule.Data;
using project.schedule.Services;
using ProjectSchedule.Models.MarinePlanning;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;

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
        [SwaggerResponse(400, "Bad Request", typeof(string))]
        public ActionResult<MarinePlanningResponse> GetPlanningActivitiesForMarinePlanningByFacilityCode(string id, [FromQuery(Name = "page-size")] int pageSize = 25, [FromQuery(Name = "page-index")] int pageIndex = 1)
        {
            try
            {
                var entries = _context.MarinePlanning.Where(f => f.FacilityCode == id).OrderBy(f => f.EstimatedStart).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
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
                        InstalledTags = s.InstalledTags != null ? new Tags[] { new Tags { Id = s.InstalledTags, Link = LinkHelper.GetLink(typeof(Tags), s.InstalledTags, id) } } : null,
                        System = s.SystemNumber != null ? new Models.MarinePlanning.System { No = s.SystemNumber, Link = LinkHelper.GetLink(typeof(Models.MarinePlanning.System), s.SystemNumber, id) } : null,
                        Map = s.MapId != null ? new Map { Id = s.MapId, Link = LinkHelper.GetLink(typeof(Map), s.MapId, id) } : null,
                        InstalledComponents = s.InstalledComponents != null ? new string[] { s.InstalledComponents } : null,
                        PositionTagNumbers = s.PositionTagNumbers != null ? new string[] { s.PositionTagNumbers } : null
                    };

                    responseEntries.Add(en);
                }
                var maxResults = _context.MarinePlanning.Where(f => f.FacilityCode == id).Count();
                var MarinePlanning = new MarinePlanningResponse { MarinePlanEntries = responseEntries, Installation = id, Total = maxResults, NextLink = GetNextLink(pageSize, pageIndex, maxResults), PreviousLink = GetPreviousLink(pageSize, pageIndex), LastSynchronized = _context.TransferStatus.FirstOrDefault(f => f.DataSet == "Project.ProjectSchedule.MarinePlanning").LastSynchronized };
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
            if (!((pageIndex - 1) >= 1))
            {
                return null;
            }
            var link = Url.Action(nameof(GetPlanningActivitiesForMarinePlanningByFacilityCode)) + $"?page-size={pageSize}&page-index={pageIndex - 1}";
            return link;
        }

        private string GetNextLink(int pageSize, int pageIndex, int maxResults)
        {
            if ((pageIndex * pageSize) == maxResults || ((pageIndex * pageSize) + 1 > maxResults))
            {
                return null;
            }
            var link = Url.Action(nameof(GetPlanningActivitiesForMarinePlanningByFacilityCode)) + $"?page-size={pageSize}&page-index={pageIndex + 1}";
            return link;
        }

    }
}