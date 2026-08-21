# AI Operations Assistant

## Purpose

The AI Operations Assistant improves self-service without bypassing business workflow, security, or human accountability.

## Supported capabilities

- Explain how to submit a request.
- Help users choose the correct request category.
- Answer approved policy and SLA questions.
- Retrieve a user's authorized request status through a secure action/API.
- Escalate unsupported or low-confidence requests to a coordinator.

## Non-goals

- Direct access to all request records.
- Bypassing approval or approval thresholds.
- Making unlogged changes to production systems.
- Returning confidential data without authorization.

## Architecture

Copilot Studio manages the business-facing conversation. Approved knowledge sources support grounded policy answers. Power Automate actions or secured APIs retrieve authorized personalized data. Human escalation handles unsupported, sensitive, or low-confidence scenarios.