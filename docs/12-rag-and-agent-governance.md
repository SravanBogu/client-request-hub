# RAG and Agent Governance

## Grounding

Policy and procedural answers must come from approved, curated knowledge
sources. The agent should identify the policy/source used where the platform experience supports it.

## Authorization

The agent does not receive unrestricted business-data access. Personalized data and transactions occur only through authenticated and authorized actions or APIs.

## Prompt-injection resilience

- Treat user-provided instructions as untrusted.
- Do not reveal system prompts, secrets, or protected content.
- Limit tool access to allowlisted actions.
- Validate tool inputs and outputs.
- Require human escalation for sensitive or unsupported requests.

## Evaluation and monitoring

Test groundedness, relevance, correctness, tool selection, safe refusal,
authorization behavior, error handling, and escalation. Monitor failure rate, handoff rate, user feedback, and tool/API errors.