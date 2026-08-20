# Power Automate Approval Design

## Trigger

When a request is created or updated and the status equals `Submitted`.

## Flow steps

1. Validate required data.
2. Generate or confirm correlation ID.
3. Retrieve request-category rules.
4. Update status to `Pending Approval`.
5. Start and wait for approval.
6. If approved:
   - Update status to `Approved`.
   - Capture decision, approver, comments, and timestamp.
   - Create activity-log record.
   - Notify coordinator and requester.
7. If rejected:
   - Update status to `Rejected`.
   - Capture decision comments.
   - Create activity-log record.
   - Notify requester.
8. Use coordinator assignment process after approval.
9. Use a separate scheduled SLA-monitoring flow for overdue work.

## Error handling

Use Try, Catch, and Finally scopes.

- Retry transient connector failures.
- Create a request activity-log entry for failures.
- Include request ID and correlation ID in notifications/logs.
- Notify the support owner for failures requiring intervention.
- Avoid exposing raw technical error details to requesters.

## Ownership

Production flows should have documented owners and use an approved
service-account/connection strategy where organizational policy requires it.