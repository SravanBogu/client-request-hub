# Test Strategy

## Functional tests

- Submit valid request.
- Validate required fields.
- Route approval based on request category.
- Approve and reject request.
- Assign coordinator.
- Update work status.
- Complete request and notify requester.

## Negative tests

- Invalid/blank request data.
- Unknown request category.
- Approver does not respond.
- Duplicate or repeated flow trigger.
- Connector/service failure.
- Invalid API response.

## Security tests

- Requester cannot view or update another user's restricted request.
- Approver cannot approve an unauthorized request.
- Coordinator has only required permissions.
- No secrets or credentials are exposed.
- DLP-approved connector policy is enforced.

## UAT evidence

Record test case, expected result, actual result, tester, date, issue reference,
and business sign-off.

## Release validation

- Confirm managed solution/version.
- Confirm connection references and environment variables.
- Validate permission assignments.
- Run smoke tests.
- Confirm monitoring/alerts.
- Verify rollback approach.