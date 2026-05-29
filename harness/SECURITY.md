# Security

Use this file before touching authentication, authorization, secrets, user data, external input, storage, payments, integrations, or deployment.

## Baseline Rules

- Never commit secrets, tokens, private keys, credentials, or real user data.
- Validate untrusted input at system boundaries.
- Enforce authorization on the server side or trusted backend boundary.
- Default to least privilege for users, services, tokens, and infrastructure.
- Avoid logging secrets, credentials, full tokens, personal data, or sensitive payloads.
- Prefer well-maintained platform security primitives over custom crypto or auth logic.

## Sensitive Areas

Update this section once the project stack exists.

| Area | Risk | Required control |
|---|---|---|
| Authentication | Account takeover | TBD |
| Authorization | Unauthorized access | TBD |
| User data | Privacy leak | TBD |
| External integrations | Data exposure or confused deputy | TBD |
| File uploads | Malware or storage abuse | TBD |
| Payments | Fraud or incorrect billing | TBD |

## Security Review Prompt

For security-sensitive changes, answer:

- What data or capability is protected?
- Who is allowed to access it?
- Where is that enforced?
- What happens when input is missing, malformed, expired, or malicious?
- What is logged?
- What test or validation proves the intended behavior?
