# Integration and Modernization Strategy

## Purpose

Client Request Hub uses a low-code-first approach for workflow and user experience, while introducing pro-code and Azure integration components only when they provide clear business, security, resiliency, or reuse value.

The goal is to modernize fragmented request processes without creating unnecessary technical complexity.

## Typical current-state challenges

Business requests are commonly handled through:

- Shared mailboxes.
- Spreadsheets and manual trackers.
- Phone calls and ad hoc chat messages.
- Paper forms or PDF attachments.
- Disconnected SharePoint lists.
- Legacy line-of-business applications.
- Manual data re-entry between systems.

This creates inconsistent intake, duplicate work, weak auditability, approval delays, limited SLA visibility, and operational reporting gaps.

## Modernization approach

1. Standardize request categories, required data, approval policy, and SLA.
2. Centralize intake in Power Apps or SharePoint.
3. Automate request lifecycle and notifications with Power Automate.
4. Establish an activity log, dashboard, and support ownership.
5. Integrate systems of record through approved connectors or APIs.
6. Add Dataverse, SPFx, Azure services, or AI only when business complexity and operational value justify the additional architecture.

## Integration decision guide

| Integration need | Preferred approach | Use when |
|---|---|---|
| Microsoft 365 data/workflow | Standard Power Platform connector | SharePoint, Teams, Outlook, Excel, Forms, Planner, or Microsoft 365 service has a supported connector |
| SaaS application with supported connector | Standard connector | Connector meets security, data, reliability, and functionality needs |
| Internal or external REST API | Custom connector | A secure API exists and needs reusable use from Power Apps, Power Automate, Logic Apps, or Copilot Studio |
| Lightweight custom business validation | Azure Function | Validation, transformation, reusable domain logic, or API façade should not be embedded in Power Fx/flow expressions |
| Enterprise workflow/integration | Azure Logic Apps | High-volume, B2B, complex orchestration, advanced integration, hybrid connectivity, or stronger Azure operational controls are required |
| Multiple APIs and policy enforcement | API Management | API governance, throttling, versioning, analytics, gateway policies, or consistent security controls are required |
| Custom SharePoint experience | SPFx React web part | Standard SharePoint pages/forms cannot meet the needed command-center, dashboard, or interaction experience |
| Complex relational process | Dataverse | Multiple entities, stronger role/security controls, advanced audit, model-driven experience, or enterprise process scale is needed |
| AI self-service | Copilot Studio + secured actions | Users need grounded policy assistance, category guidance, or authorized request-status lookup |
| Deep AI orchestration | Azure AI Foundry | Custom RAG, model selection, evaluation, tracing, advanced tools, or Azure AI control is required |

## Standard connector first

Use standard Power Platform connectors where they meet the business need and are approved by governance policy. This reduces custom code, speeds delivery, and supports maintainability.

Examples:

- SharePoint connector for request-list data.
- Office 365 Outlook connector for email notifications.
- Microsoft Teams connector for approval and status messages.
- Approvals connector for standard human approval lifecycle.
- Dataverse connector when the scale-up data platform is selected.

Before use, verify the connector's DLP classification, authentication method, licensing implications, data residency requirements, and support ownership.

## Custom connector pattern

Use a custom connector when a needed system does not have an appropriate standard connector or when the organization needs a reusable, governed API contract.

A custom connector is a wrapper around a REST or SOAP API that makes approved operations available in Power Apps, Power Automate, Logic Apps, or Copilot Studio.

Example operations for Client Request Hub:

```text
GET /assets/{assetId}
GET /requests/{requestId}/status
POST /requests/{requestId}/validate
GET /locations/{locationId}/approvers
```

The custom connector should define:

- OpenAPI specification.
- Authentication model.
- Required inputs and validation.
- Clear action names and descriptions.
- Safe response schema.
- Error contract and retry guidance.
- Ownership, versioning, and support process.

## Azure Function integration boundary

Use an Azure Function when reusable business validation, transformation, or API access should be separated from the Power Platform user interface and workflow.

Example: asset eligibility validation.

```text
Power Apps or Power Automate
        ↓
Custom Connector or HTTP action
        ↓
Azure Function
        ↓
Asset, ERP, CRM, HRIS, or service-desk system
```

The Function can validate an asset identifier, determine whether the asset is active, retrieve allowed request types, and return only the fields required for the request workflow.

Production expectations:

- Microsoft Entra ID authentication.
- App roles/scopes or managed identity.
- Input validation and allowlisted output fields.
- Azure Key Vault or managed identity for downstream credentials.
- Structured logging and correlation IDs.
- Application Insights monitoring and alerts.
- Retry and timeout policy.
- API versioning and documented ownership.

No credentials, production endpoints, tenant IDs, or client data should be stored in this public reference implementation.

## Logic Apps versus Power Automate

Use Power Automate for business-user workflow, human approvals, Microsoft 365 automation, and low-code process automation.

Use Azure Logic Apps when the integration requires enterprise integration patterns, high volume, complex orchestration, B2B/EDI, hybrid connectivity,
advanced operational controls, or managed Azure deployment practices.

The decision is not low-code versus pro-code. It is selecting the appropriate managed platform for the workflow's users, complexity, risk, and operational
requirements.

## SPFx decision

Use SharePoint standard pages, lists, formatting, and Power Apps forms first.

Use SPFx when the user experience requires:

- A purpose-built React command center.
- Composite views across multiple lists/systems.
- Custom dashboards, maps, calendars, or complex filtering.
- Microsoft Graph or PnP integration.
- Reusable SharePoint web parts.
- Custom command sets or document/list extensions.
- A branded and optimized experience not achievable through standard tools.

SPFx should consume approved APIs and should not expose credentials or bypass backend authorization.

## Dataverse decision

Begin with SharePoint Lists if the MVP is lightweight and collaboration-centric.

Move to Dataverse when the solution needs:

- Relational data across requests, assets, approvals, tasks, and cases.
- Role-based, row-level, or field-level security.
- Advanced audit/history.
- Model-driven applications.
- Business process flows and more complex business rules.
- Enterprise application lifecycle management.
- Higher transactional scale or multiple integrated applications.

## API and security principles

- Use least privilege.
- Authenticate users and applications through Microsoft Entra ID.
- Authorize every API operation; authentication alone is not authorization.
- Validate inputs server-side.
- Return only required fields.
- Protect downstream credentials in managed identity or Key Vault.
- Never store secrets in Power Fx, flows, source code, GitHub, or browser code.
- Log correlation IDs rather than sensitive payloads.
- Apply retry, timeout, idempotency, and error-handling patterns.
- Document data classification, ownership, and support model.

## Delivery sequence

1. Map systems of record, owners, interfaces, and data classification.
2. Confirm whether a standard connector exists and is policy-approved.
3. Define API requirements, authentication, authorization, and error contract.
4. Build and test the integration in Development using synthetic data.
5. Conduct security, DLP, and architecture review.
6. Promote through UAT with test evidence and monitoring.
7. Release using governed ALM and rollback procedures.
8. Monitor failures, latency, data quality, adoption, and support tickets.