using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectSchedule.Models.MarinePlanning
{
    public class System
    {
        public string no { get; set; }
        public string link { get; set; }
    }

    public class Tags
    {
        public string id { get; set; }
        public string link { get; set; }
    }
    
    public class Map
    {
        public string id { get; set; }
        public string link { get; set; }
    }
    
    public class MarinePlanEntry
    {
        public string ActivityNumber { get; set; }
        public string Description { get; set; }
        public string Start { get; set; }
        public string Finish { get; set; }
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
    }
}
