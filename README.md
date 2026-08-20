# Client Request Hub

A governed Power Platform reference implementation for request intake, approval, assignment, SLA tracking, operational reporting, and optional Azure integration.

> **Reference implementation:** This is an independent, non-production portfolio project created using synthetic data. It contains no client, employer, customer, employee, tenant, credential, or confidential information.

## Business problem

Business requests are often managed through email, spreadsheets, calls, and disconnected tools. This causes inconsistent routing, poor approval visibility, missed service-level commitments, and weak auditability.

## Solution overview

Client Request Hub centralizes request intake, routing, approval, assignment, activity logging, notifications, and reporting.

## Technology approach

- SharePoint Lists or Dataverse for request data
- Power Apps for request intake
- Power Automate for workflow and approvals
- Teams and Outlook for notifications
- Power BI for SLA, backlog, and trend reporting
- SPFx for optional custom SharePoint command-center experiences
- Azure Functions, Logic Apps, and custom connectors for enterprise integration
- Copilot Studio and Azure AI Foundry as future governed AI extensions

## Architecture

See [Solution Architecture](docs/02-solution-architecture.md).

## Documentation

- [Discovery and MVP](docs/01-discovery-and-mvp.md)
- [Architecture](docs/02-solution-architecture.md)
- [Business Process](docs/03-business-process-flow.md)
- [Data Model](docs/04-data-model.md)
- [Power Platform Implementation](docs/05-power-platform-implementation.md)
- [Governance, Security, and ALM](docs/06-governance-security-alm.md)
- [Integration and Modernization](docs/07-integration-and-modernization.md)
- [Testing Strategy](docs/08-test-strategy.md)
- [Delivery Roadmap](docs/09-delivery-roadmap.md)

## License

Licensed under the Apache License 2.0. See [LICENSE](LICENSE).