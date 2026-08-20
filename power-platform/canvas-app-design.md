# Canvas App Design

## Screen 1: My Requests

- Gallery of requests created by the current user.
- Filter by status, request type, and date.
- Button to create a new request.
- Request-status indicator.

## Screen 2: Submit Request

Fields:

- Request type
- Priority
- Location
- Related asset/service ID
- Need-by date
- Estimated cost
- Business justification

Validation:

- Request type, priority, location, need-by date, and justification are required.
- Estimated cost must be numeric and non-negative.
- Need-by date cannot be in the past.
- Critical requests require additional justification.

## Screen 3: Request Details

- Request history/activity log.
- Approval decision and comments.
- Assigned coordinator.
- Current status and SLA indicator.

## Accessibility

- Visible labels for all controls.
- Keyboard navigation.
- Error messages that explain how to correct input.
- Accessible color contrast; do not use color alone for status.