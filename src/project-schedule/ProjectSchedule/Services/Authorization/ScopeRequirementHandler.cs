using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.schedule.Services.Authorization
{
    public class ScopeRequirementHandler : AuthorizationHandler<ScopeRequirement>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, ScopeRequirement requirement)
        {

            var scopeClaim = context.User.FindFirst(c => c.Type.Contains("http://schemas.microsoft.com/identity/claims/scope"));
            if (scopeClaim != null)
            {
                var scopes = scopeClaim.Value.Split(" ");

                if (scopes.Length > 0)
                {
                    var isAuthorized = true;
                    foreach (var scope in requirement.RequiredScopes)
                    {
                        if (!scopes.Contains(scope))
                        {
                            isAuthorized = false;
                        }
                    }
                    if (isAuthorized) context.Succeed(requirement);
                    return Task.CompletedTask;
                }
            }

            var roleClaim = context.User.FindAll(c => c.Type.Contains("http://schemas.microsoft.com/ws/2008/06/identity/claims/role"));
            if (roleClaim != null)
            {
                var roles = roleClaim.Select(s => s.Value).ToList();

                if (roles.Count > 0)
                {
                    var isAuthorized = true;
                    foreach (var scope in requirement.RequiredRoles)
                    {
                        if (!roles.Contains(scope))
                        {
                            isAuthorized = false;
                        }
                    }
                    if (isAuthorized) context.Succeed(requirement);
                    return Task.CompletedTask;
                }
            }
            return Task.CompletedTask;
        }
    }
}
