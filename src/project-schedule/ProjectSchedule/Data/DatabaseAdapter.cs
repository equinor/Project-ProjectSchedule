using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Azure.Services.AppAuthentication;
using project.schedule.Models.Database;

namespace project.schedule.Data
{
    public class DatabaseAdapter
    {
        private readonly string _connString;

        public DatabaseAdapter(string connectionString)
        {
            _connString = connectionString;
        }

        public List<MarinePlanning> GetPlanningActivitiesByFacilityCode(string facilityCode, int pageSize = 25, int pageIndex = 1)
        {
            var resp = new List<MarinePlanning>();

            using (SqlConnection connection = new SqlConnection(_connString))
            {
                connection.AccessToken = new AzureServiceTokenProvider().GetAccessTokenAsync("https://database.windows.net/").Result;
                string sql = "WITH activities AS (" +
                                "    SELECT " +
                                "        ROW_NUMBER() OVER(" +
                                "             ORDER BY " +
                                "                FacilityCode, " +
                                "                SourceId" +
                                "        ) row_num, " +
                                "        ppsmp.*" +
                                "     FROM " +
                                "        enterprise.project_project_schedule_marine_planning ppsmp)" +
                                " SELECT " +
                                "       FacilityCode" +
                                "      ,NetworkName" +
                                "      ,NetworkDescription" +
                                "      ,ActivityNumber" +
                                "      ,ActivityDescription" +
                                "      ,EstimatedStart" +
                                "      ,EstimatedFinish" +
                                "      ,VesselName" +
                                "      ,VesselType" +
                                "      ,ProContractor" +
                                "      ,Contractor" +
                                "      ,MarineOps" +
                                "      ,TypeLevel1" +
                                "      ,TypeLevel2" +
                                "      ,TypeLevel3" +
                                "      ,TypeLevel4" +
                                "      ,SystemNumber" +
                                "      ,SystemDescription" +
                                "      ,InstalledTags" +
                                "      ,InstalledComponents" +
                                "      ,PositionTagNumbers" +
                                "      ,StartTagNumber" +
                                "      ,MapId" +
                                "      ,SourceSystem" +
                                "      ,SourceId" +
                                " FROM " +
                                "    activities" +
                                " WHERE FacilityCode = @FacilityCode" +
                                "  AND row_num >= @StartRowNum" +
                                "  AND row_num <= @EndRowNum";

                int startRow;
                int endRow;

                if (pageIndex == 1) {
                    startRow = 1;
                    endRow = pageSize;
                }
                else {
                    startRow = pageIndex * pageSize;
                    endRow = startRow + pageSize;
                }
                connection.Open();
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.Add("@FacilityCode", SqlDbType.VarChar);
                    command.Parameters["@FacilityCode"].Value = facilityCode;
                    command.Parameters.Add("@StartRowNum", SqlDbType.Int);
                    command.Parameters["@StartRowNum"].Value = startRow;
                    command.Parameters.Add("@EndRowNum", SqlDbType.Int);
                    command.Parameters["@EndRowNum"].Value = endRow;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            resp.Add(new MarinePlanning
                            {
                                FacilityCode = reader.IsDBNull(0) ? null : reader.GetString(0),
                                NetworkName = reader.IsDBNull(1) ? null : reader.GetString(1),
                                NetworkDescription = reader.IsDBNull(2) ? null : reader.GetString(2),
                                ActivityNumber = reader.IsDBNull(3) ? null : reader.GetString(3),
                                ActivityDescription = reader.IsDBNull(4) ? null : reader.GetString(4),
                                EstimatedStart = reader.IsDBNull(5) ? (DateTime?)null : reader.GetDateTime(5),
                                EstimatedFinish = reader.IsDBNull(6) ? (DateTime?)null : reader.GetDateTime(6),
                                VesselName = reader.IsDBNull(7) ? null : reader.GetString(7),
                                VesselType = reader.IsDBNull(8) ? null : reader.GetString(8),
                                ProContractor = reader.IsDBNull(9) ? null : reader.GetString(9),
                                Contractor = reader.IsDBNull(10) ? null : reader.GetString(10),
                                MarineOps = reader.IsDBNull(11) ? null : reader.GetString(11),
                                TypeLevel1 = reader.IsDBNull(12) ? null : reader.GetString(12),
                                TypeLevel2 = reader.IsDBNull(13) ? null : reader.GetString(13),
                                TypeLevel3 = reader.IsDBNull(14) ? null : reader.GetString(14),
                                TypeLevel4 = reader.IsDBNull(15) ? null : reader.GetString(15),
                                SystemNumber = reader.IsDBNull(16) ? null : reader.GetString(16),
                                SystemDescription = reader.IsDBNull(17) ? null : reader.GetString(17),
                                InstalledTags = reader.IsDBNull(18) ? null : reader.GetString(18),
                                InstalledComponents = reader.IsDBNull(19) ? null : reader.GetString(19),
                                PositionTagNumbers = reader.IsDBNull(20) ? null : reader.GetString(20),
                                StartTagNumber = reader.IsDBNull(21) ? null : reader.GetString(21),
                                MapId = reader.IsDBNull(22) ? null : reader.GetString(22),
                                //SourceSystem = reader.GetString(1),
                                //SourceId = reader.GetString(1),
                            });
                        }
                    }
                }
            }

            return resp;
        }

        public int GetRowCountByFacilityCode(string facilityCode)
        {
            int count = 0;
            string sql = "SELECT count(*) FROM enterprise.project_project_schedule_marine_planning WHERE FacilityCode = @FacilityCode";

            using (SqlConnection connection = new SqlConnection(_connString))
            {
                connection.AccessToken = new AzureServiceTokenProvider().GetAccessTokenAsync("https://database.windows.net/").Result;
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.Add("@FacilityCode", SqlDbType.VarChar);
                    command.Parameters["@FacilityCode"].Value = facilityCode;

                    connection.Open();
                    count = (int)command.ExecuteScalar();
                }
            }
            return count;
        }

        public DateTime GetLastSynchronizedByDataset(string dataset)
        {
            DateTime resp;
            string sql = "SELECT LastSynchronized FROM enterprise.transfer_status WHERE Dataset = @Dataset";

            using (SqlConnection connection = new SqlConnection(_connString))
            {
                connection.AccessToken = new AzureServiceTokenProvider().GetAccessTokenAsync("https://database.windows.net/").Result;
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.Add("@Dataset", SqlDbType.VarChar);
                    command.Parameters["@Dataset"].Value = dataset;

                    connection.Open();
                    resp = (DateTime)command.ExecuteScalar();
                }
            }
            return resp;
        }
    }
}
