using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectSchedule.Models.MarinePlanning
{
    public class MarinePlanningResponse
    {
        public string Installation { get; set; }
        public List<MarinePlanEntry> MarinePlanEntries { get; set; }

        public string NextLink { get; set; }
        public string PreviousLink { get; set; }
        public int Total { get; set; }
    }
}
