using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.schedule.Models.Database
{
    public class MarinePlanning
    {
        public string FacilityCode { get; set; }
        public string NetworkName { get; set; }
        public string NetworkDescription { get; set; }
        public string ActivityNumber { get; set; }
        public string ActivityDescription { get; set; }
        public DateTime? EstimatedStart { get; set; }
        public DateTime? EstimatedFinish { get; set; }
        public string VesselName { get; set; }
        public string VesselType { get; set; }
        public string ProContractor { get; set; }
        public string Contractor { get; set; }
        public string MarineOps { get; set; }
        public string TypeLevel1 { get; set; }
        public string TypeLevel2 { get; set; }
        public string TypeLevel3 { get; set; }
        public string TypeLevel4 { get; set; }
        public string SystemNumber { get; set; }
        public string SystemDescription { get; set; }
        public string InstalledTags { get; set; }
        public string InstalledComponents { get; set; }
        public string PositionTagNumbers { get; set; }
        public string StartTagNumber { get; set; }
        public string MapId { get; set; }
    }
}
