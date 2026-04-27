---
name: requirements
description: Capture required behaviors of a change using a Specification with specific formatting and terminology.
---

# What is a Specification?

Note that **RFC 2119 keywords** (SHALL, MUST, SHOULD, MAY) communicate intent:

- **MUST/SHALL** — absolute requirement
- **SHOULD** — recommended, but exceptions exist
- **MAY** — optional

You SHOULD interact with the user to generate a Specification of the desired behavior.

- Purpose: A high-level description of the desired functionality.
- Requirement: A specific behavior that MUST be implemented to fulfill the Purpose.
  A Requirement describes what the system is doing.
- Scenario: A concrete example of the Requirement in action.
  A Scenario describes how the system is doing it.
  A Scenario SHOULD describe the something a user would experience
  A Scenario SHOULD be written using
  A Scenario SHOULD be testable (you could write an automated test for them)
  A Scenario MAY cover either happy path and or edge cases
  A Scenario SHOULD use GIVEN/WHEN/THEN/AND or similar structured format

A specification is not concerned with technical implementation details just the behavior a system would exhibit.

## Example Specification Format

A Specification will list one or more Requirements each with one or more Scenarios,

```markdown
# Purpose

Authentication and session management for the application.

## Requirement: User Authentication

The system SHALL issue a JWT token upon successful login.

### Scenario: Valid credentials

- GIVEN a user with valid credentials
- WHEN the user submits login form
- THEN a JWT token is returned
- AND the user is redirected to dashboard

### Scenario: Invalid credentials

- GIVEN invalid credentials
- WHEN the user submits login form
- THEN an error message is displayed
- AND no token is issued

## Requirement: Session Expiration

The system MUST expire sessions after 30 minutes of inactivity.

### Scenario: Idle timeout

- GIVEN an authenticated session
- WHEN 30 minutes pass without activity
- THEN the session is invalidated
- AND the user must re-authenticate
```
