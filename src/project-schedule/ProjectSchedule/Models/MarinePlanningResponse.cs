﻿using System;
using System.Collections.Generic;

namespace ProjectSchedule.Models.MarinePlanning
{
    public class MarinePlanningResponse
    {
        public string Installation { get; set; }
        public List<MarinePlanEntry> MarinePlanEntries { get; set; }
        public DateTime LastSynchronized { get; set; }

        public string NextLink { get; set; }
        public string PreviousLink { get; set; }
        public int Total { get; set; }
    }
}
