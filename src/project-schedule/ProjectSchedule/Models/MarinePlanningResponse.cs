using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectSchedule.Models.MarinePlanning
{
    public class MarinePlanningResponse
    {
        public string Installation { get; set; }
        public string LastSynchronized { get; set; }
        public List<MarinePlanEntry> MarinePlanEntries { get; set; }

    }
}
