using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectSchedule.Services
{
    public class AuthenticationMockService
    {
        private readonly List<string> _validUsers;

        public AuthenticationMockService()
        {
            _validUsers = new List<string> { "jmor@equinor.com", "efwa@equinor.com", "aeaa@equinor.com" };
        }

        public AuthenticationResponse AuthenticateAndAuthorizeUser(string id)
        {
            var response = new AuthenticationResponse { IsAuthorized = false, IsAuthenticated = false };

            if (string.IsNullOrEmpty(id)) return response;

            if (!string.IsNullOrEmpty(id))
            {
                response.IsAuthenticated = true;
            }
            if (_validUsers.Contains(id.ToLower()))
            {
                response.IsAuthorized = true;
            }

            return response;
        }
    }

    public class AuthenticationResponse
    {
        public bool IsAuthenticated { get; set; }
        public bool IsAuthorized { get; set; }
    }
}
