# Solution Configuration Template

## Solution name

```text
ClientRequestHub
```

## Environment variables

| Name | Purpose | Example |
|---|---|---|
| CRH_RequestListUrl | Request data location | SharePoint list URL or Dataverse endpoint |
| CRH_SupportEmail | Support escalation | support@example.com |
| CRH_DefaultApproverGroup | Approval routing | Operations Approvers |
| CRH_TeamsChannel | Notification destination | Operations Requests |
| CRH_SLAEscalationHours | Default escalation threshold | 24 |

## Connection references

- SharePoint
- Office 365 Outlook
- Microsoft Teams
- Approvals
- Dataverse, if used
- Approved custom connector, if used

Do not hard-code tenant-specific URLs, identities, passwords, or secrets.