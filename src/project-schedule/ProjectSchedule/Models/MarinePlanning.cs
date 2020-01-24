using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectSchedule.Models.MarinePlanning
{
    public class System
    {
        public string No { get; set; }
        public string Link { get; set; }
    }

    public class Tags
    {
        public string Id { get; set; }
        public string Link { get; set; }
    }
    
    public class Map
    {
        public string Id { get; set; }
        public string Link { get; set; }
    }
    
    public class MarinePlanEntry
    {
        public string ActivityNumber { get; set; }
        public string Description { get; set; }
        public DateTime? Start { get; set; }
        public DateTime? Finish { get; set; }
        public string VesselName { get; set; }
        public string VesselType { get; set; }
        public string ProContractor { get; set; }
        public string Contractor { get; set; }
        public string MarineOps { get; set; }
        public string TypeLevel1 { get; set; }
        public string TypeLevel2 { get; set; }
        public string TypeLevel3 { get; set; }
        public string TypeLevel4 { get; set; }
        public System System { get; set; }
        public Tags[] InstalledTags { get; set; } 
        public string[] InstalledComponents { get; set; }
        public string[] PositionTagNumbers { get; set; }
        public string StartTagNumber { get; set; }
        public Map Map { get; set; }
        public DateTime LastSyncronized { get; set; }
    }
}
