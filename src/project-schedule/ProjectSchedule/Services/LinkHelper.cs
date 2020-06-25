using System;

namespace project.schedule.Services
{
    public class LinkHelper
    {
        public static string GetLink(Type t, string val, string id)
        {
            string link = "";
            if (t == typeof(ProjectSchedule.Models.MarinePlanning.System))
            {
                link += $"https://api.gateway.equinor.com/facility/system/installation/{id}/system/{val}";
            }
            else if (t == typeof(ProjectSchedule.Models.MarinePlanning.Tags))
            {
                link += $"https://api.gateway.equinor.com/plant/equipment/tag/{val}";
            }
            else if (t == typeof(ProjectSchedule.Models.MarinePlanning.Map))
            {
                link += $"https://mapservice.equinor.com/ID={val}";
            }
            return link;
        }
    }
}
