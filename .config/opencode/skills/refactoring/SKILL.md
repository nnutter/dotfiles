---
name: refactoring
description: Apply these guidelines when refactoring existing code in order to make it simpler to add functionality or to improve the readability of the code.
---

# Refactoring

- When refactoring code SHOULD isolate changing tests from changing code in separate commits and ensure each commit passes tests.
- When implementing a feature you MAY consider refactoring the code first to make it simpler to extend functionality.
- You SHOULD isolate different categories of refactoring in separate commits. For example, you could include several variable renames in one commit but should not include variable renames and function extraction in one commit. However, if including several refactors in one commit try to avoid making multiple different changes on the same line of code and create smaller commits if necessary.
- You MUST prefix a refactoring commit with "Refactor: ".
- You SHOULD reference the refactoring type in the commit message, for example, "Refactor: Extract constant for hard-coded string: 'foo'".
- You SHOULD prefer to order refactoring commits before functional change commits.
- You SHOULD prefer to keep refactoring commits near associated functional change commits.
- You MAY consider any refactorings, e.g., from Martin Fowler's Refactoring book, but in particular consider these refactorings:
  - Extract function/method
  - Extract variable (usually to make the code more clear or self-describing)
  - Rename variable
  - Rename field
  - Remove dead code
  - Move function/method
  - Replace magic literal with symbolic constant
  - Replace unmodified variable with constant (if the language supports immutable types)
