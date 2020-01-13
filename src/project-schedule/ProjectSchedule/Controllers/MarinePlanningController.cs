using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectSchedule.Models.MarinePlanning;
using ProjectSchedule.Services;
using Swashbuckle.Swagger.Annotations;

namespace ProjectSchedule.Controllers
{
    [Route("marineplanning")]
    [ApiController]
    [Produces("application/json")]
    [Authorize(Policy = "Reader")]
    public class MarinePlanningController : ControllerBase
    {

        [HttpGet("{id}")]
        [SwaggerOperation()]
        [SwaggerResponse(200, "Success", typeof(MarinePlanningResponse))]
        [SwaggerResponse(400, "Bad Request")]
        public ActionResult<MarinePlanningResponse> GetMarinePlanningsByInstallation(string id)
        {
            try
            {
                var MarinePlanEntires = new List<MarinePlanEntry>() {
                    new MarinePlanEntry {
                        ActivityNumber = "JC_ManCB.1",
                        Description = "DP trials & installation of Manifold  CA",
                        Start = "2019-06-15T00:00:00+01:00",
                        Finish = "2019-06-17T00:00:00+01:00",
                        VesselName = "Normand Vision",
                        VesselType = "Construction vessel",
                        ProContractor = "Ocean Installer",
                        Contractor = "Ocean Installer - Marine Operations",
                        MarineOps = "Construction Work",
                        TypeLevel1 = "Subsea",
                        TypeLevel2 = "Marine Operations",
                        TypeLevel3 = "Marine Operations",
                        TypeLevel4 = "Offshore installation",
                        System = new Models.MarinePlanning.System { no = "89", link = "https://api.gateway.equinor.com/facility/system/installation/JCA/system/89" },
                        InstalledTags = new Tags[] { new Tags {id = "18UD5501", link="https://api.gateway.equinor.com/plant/equipment/tag/18UD5501" } },
                        InstalledComponents = new string[] { "Manifold DA" },
                        PositionTagNumbers = new string[] {""},
                        StartTagNumber = "",
                        Map = new Map { id = "EB_MAN", link = "https://mapservice.equinor.com/ID=EB_MAN" }
                    }, new MarinePlanEntry {
                        ActivityNumber = "JC_SatZB",
                        Description = "DP trials & installation of Template EB (incl.Inst.VXT hatches)",
                        Start = "2019-06-17T00:00:00+01:00",
                        Finish = "2019-06-18T00:00:00+01:00",
                        VesselName = "Normand Vision",
                        VesselType = "Construction vessel",
                        ProContractor = "Ocean Installer",
                        Contractor = "Ocean Installer - Marine Operations",
                        MarineOps = "Construction Work",
                        TypeLevel1 = "Subsea",
                        TypeLevel2 = "Marine Operations",
                        TypeLevel3 = "Marine Operations",
                        TypeLevel4 = "Offshore installation",
                        System = new Models.MarinePlanning.System { no = "89", link = "https://api.gateway.equinor.com/plant/operationandmaintenance/systemcodes/JCA/89" },
                        InstalledTags = new Tags[] { new Tags {id = "18UD2000", link= "https://api.gateway.equinor.com/plant/equipment/tag/18UD2000" } },
                        InstalledComponents = new string[] { "Template CC" },
                        PositionTagNumbers = new string[] {""},
                        StartTagNumber = "",
                        Map = new Map { id = "EB_MAN", link = "https://mapservice.equinor.com/ID=EB_MAN" } } };

                var MarinePlanning = new MarinePlanningResponse { MarinePlanEntries = MarinePlanEntires, Installation = id, LastSynchronized = DateTime.UtcNow.ToString("u") };
                return Ok(MarinePlanning);
            }
            catch (Exception)
            {
                return BadRequest();
            }
                
        }

    }
}