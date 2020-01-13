using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.schedule.Services.Authorization
{
    public class ScopeRequirement : IAuthorizationRequirement
    {
        public List<string> RequiredScopes { get; }
        public List<string> RequiredRoles { get; }

        public ScopeRequirement(List<string> requiredScopes, List<string> requiredRoles)
        {
            RequiredScopes = requiredScopes;
            RequiredRoles = requiredRoles;
        }
    }
}
