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
            if (context.User.FindFirst("http://schemas.microsoft.com/identity/claims/scope") == null)
            {
                return Task.CompletedTask;
            }

            var scopes = context.User.FindFirst(c => c.Type.Contains("http://schemas.microsoft.com/identity/claims/scope")).Value.Split(" ");

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
}
