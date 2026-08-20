# Data Model

## Client Requests

| Field | Type | Description |
|---|---|---|
| RequestId | Text | Human-readable business identifier |
| Title | Text | Short request title |
| RequestType | Choice | Equipment, maintenance, access, service, other |
| Priority | Choice | Low, medium, high, critical |
| Location | Text/Choice | Business or operating location |
| RelatedAssetId | Text | Optional asset, case, or service reference |
| NeedByDate | Date | Due date |
| EstimatedCost | Currency | Approval policy input |
| BusinessJustification | Multiple lines | Reason for request |
| Status | Choice | Lifecycle state |
| Requester | Person | Request owner |
| Approver | Person/Group | Decision maker |
| AssignedTo | Person | Coordinator/fulfillment owner |
| CorrelationId | Text | Cross-system traceability |
| SubmittedDate | Date/time | Audit and reporting |
| LastUpdatedDate | Date/time | Aging and reporting |

## Supporting entities

### Request Categories

- CategoryName
- DefaultApproverGroup
- SLAHours
- CostApprovalThreshold
- Active

### Request Activity Log

- ActivityId
- RequestId
- EventType
- Details
- PerformedBy
- OccurredOn
- CorrelationId