# AI-Assisted Engineering Workflow

## Purpose

This reference implementation demonstrates a disciplined approach to using AI-assisted engineering tools such as GitHub Copilot, Claude Code, OpenAI Codex, ChatGPT, Cursor, and other approved tools.

AI tools accelerate engineering work; they do not replace requirements,
architecture, security review, testing, code review, or accountable ownership.

## Suitable use cases

- Convert a business requirement into a draft technical design.
- Generate a first draft of Python, TypeScript, PowerShell, YAML, or Markdown.
- Explain unfamiliar code, Power Fx formulas, API responses, or build errors.
- Generate unit-test ideas and edge cases.
- Review a pull-request diff for defects, insecure patterns, missing tests, unclear naming, or documentation gaps.
- Draft OpenAPI/custom connector schemas.
- Create test data that is fully synthetic.
- Improve runbooks, architecture documentation, and release notes.

## Controlled workflow

1. Define a bounded task and acceptance criteria.
2. Provide approved repository context and constraints.
3. Ask the AI tool for a plan before implementation when work is nontrivial.
4. Review proposed edits and the resulting diff.
5. Run tests, linting, build checks, and security checks.
6. Validate business rules, authorization, data handling, and error paths.
7. Open a pull request and require review appropriate to the environment.
8. Deploy only through governed ALM and approved release controls.

## Example prompt

```text
Review the Azure Function request-status endpoint in this repository.

Constraints:
- Use only synthetic data.
- Do not add secrets, tenant IDs, production URLs, or credentials.
- Preserve the API contract.
- Identify missing input validation, authorization assumptions, error handling, test coverage, logging, and documentation.
- Return findings first. Do not edit files until I approve a plan.
```

## Guardrails

- Never enter client, employer, personal, financial, healthcare, or confidential data into an unapproved AI tool.
- Never accept generated code without review and testing.
- Never allow an AI coding tool to deploy directly to Production.
- Keep secrets outside source control and AI prompts.
- Treat generated content as a draft subject to engineering accountability.
- Use organization-approved tools, models, and data-handling policies.

## Evidence in this repository

- Feature branches and pull requests support reviewable changes.
- GitHub Actions validate required documentation and flag obvious secret patterns.
- Python reference code includes unit tests.
- Documentation states security, governance, ALM, and integration assumptions.
- All sample data is synthetic.