---
name: python-opinions
description: Apply these guidelines when writing Python code.
---

# Python Opinions

## General Coding

- Use tabs for indentation.
- The `collections`, `dataclass`, and `functools` packages from the Python standard library are quite useful.
- Use `dataclass` to create classes when appropriate.
- Use `pendulum` for instead of `datetime`.
- Use `requests` to make HTTP requests.
- Use `polars` instead of `pandas`.
- Always use type hints. Prefer using the `|` operator over `Union` and `| None` over `Optional`.

## Testing Specific

- Use `pytest` for testing.
