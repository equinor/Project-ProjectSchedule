using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ProjectSchedule.Models.MarinePlanning;

namespace project.schedule.Services
{
    public class LinkHelper
    {
        public static string GetLink(Type t, string val)
        {
            string link = "";
            if (t == typeof(ProjectSchedule.Models.MarinePlanning.System))
            {
                link += $"some link to system {val}";
            }
            else if (t == typeof(ProjectSchedule.Models.MarinePlanning.Tags))
            {
                link += $"some link to Tags {val}";
            }
            else if (t == typeof(ProjectSchedule.Models.MarinePlanning.Map))
            {
                link += $"some link to Map {val}";
            }
            return link;
        }
    }
}
