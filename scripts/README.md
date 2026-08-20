# Provisioning Scripts

This folder contains optional scripts that support repeatable, documented environment setup for the Client Request Hub reference implementation.

## Intended use

- Create SharePoint lists and columns for a development/demo site.
- Load synthetic sample data.
- Verify expected list schema.
- Support repeatable non-production environment setup.

## Safety rules

- Run scripts only in a personal developer, sandbox, or approved test tenant.
- Never run against a client or employer production tenant without approval.
- Review each command before execution.
- Do not store credentials, tenant IDs, access tokens, or production URLs in Git.
- Use interactive sign-in, managed identity, or approved secure credential storage according to organizational policy.

## Prerequisites

- PowerShell 7.
- PnP.PowerShell module.
- Permission to create/manage lists in the target SharePoint site.
- A designated non-production SharePoint site.

## Example

```powershell
Connect-PnPOnline -Url "https://contoso.sharepoint.com/sites/client-request-hub" -Interactive
.\provision-sharepoint-lists.ps1
```

Replace the example URL with an approved non-production site. Do not commit actual tenant URLs to this repository.