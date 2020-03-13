# Data Area: Project - Project Schedule 
Code and information relating to data sharing within the *Project - Project Schedule* data area.

## Getting Access

All requests to this API has to be authenticated and authorized, this requires all requests to pass along a valid OAuth2.0 token.

|Scope/Role| Description|
|-|-|
|Project.Read| User delegated scope. This allows your application to call the Enterprise API in a `User` context.|
|Project.Reader| Application Role. This allows your application to call the Enterprise API without a `User` context. This has to be approved by an Equinor AAD administrator.|


To get these scopes/roles;
1. Go to your app registration in Azure Active Directory.
2. Go to `API permissions` and click `+ Add a permission`.
3. Navigate to the tab named `APIs my organization uses`.
4. Search for the enterprise API `enterprise-project-projectschedule-api`, and select the Scope/App Role that fits your need.        
    - All enterprise APIs follow the current naming: `enterprise-<Data Area level 1>-<Data Area level 2>-api`
5. If you selected application role, make sure to contact an AAD administrator with the appropriate information to get the permission approved.