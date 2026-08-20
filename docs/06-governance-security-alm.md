# Governance, Security, and ALM

## Environment strategy

| Environment | Purpose | Access |
|---|---|---|
| Development | Build and unit test | Makers/developers |
| UAT | Business validation | Test users, product owner, support |
| Production | Live business use | End users and controlled support/admin roles |

## Security model

Use Microsoft Entra ID security groups:

- CRH Requesters
- CRH Approvers
- CRH Coordinators
- CRH Operations Managers
- CRH Platform Administrators

Apply least privilege. Users should receive only the minimum access required for their role.

## Data loss prevention

- Use DLP policies to classify approved business-data connectors.
- Keep consumer or high-risk connectors isolated or blocked.
- Review new connector usage before production deployment.
- Do not use personal connectors for production business data.

## Application lifecycle management

- Create all Power Platform components in a solution.
- Use unmanaged solutions in Development.
- Promote managed solution artifacts to Production.
- Use connection references and environment variables.
- Run Solution Checker and validation before releases.
- Use Power Platform Pipelines, Azure DevOps, or GitHub Actions based on organizational standards.
- Document release approval, deployment evidence, and rollback procedure.

## Monitoring and auditability

- Store key lifecycle events in Request Activity Log.
- Use correlation IDs across flow/API boundaries.
- Define business owner, technical owner, and support queue.
- Monitor failed flows, backlog aging, SLA exceptions, and adoption.