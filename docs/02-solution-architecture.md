# Solution Architecture

## MVP architecture

The MVP uses Microsoft 365 and Power Platform capabilities for a
low-code-first implementation:

- SharePoint Lists for lightweight collaborative request data.
- Power Apps Canvas App or SharePoint form for intake.
- Power Automate for approval, lifecycle updates, notifications, and logging.
- Teams/Outlook for notifications.
- Power BI for operational visibility.

## Scale-up architecture

- Dataverse when the process needs stronger relational data, auditing,
  row-level security, complex business rules, or multiple integrated workflows.
- SPFx/React for a richer SharePoint command center.
- Azure Functions, Logic Apps, Standard/custom connectors, API Management for secure and controlled enterprise integration.
- Copilot Studio and Azure AI Foundry only after governance and integration boundaries are established.

## Architecture decision guide

| Need | MVP | Scale-up |
|---|---|---|
| Data | SharePoint Lists | Dataverse |
| Intake UI | SharePoint form / Canvas App | Canvas/model-driven app, SPFx |
| Workflow | Power Automate | Logic Apps/Azure service patterns |
| Integration | Standard connectors | Custom connector, Azure Function, API Management |
| Reporting | Power BI prototype | Governed Power BI semantic model |
| AI | Documented future phase | Copilot Studio/Foundry with secured actions |