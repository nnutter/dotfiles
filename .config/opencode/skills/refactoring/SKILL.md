---
name: refactoring
description: Apply these guidelines when refactoring existing code in order to make it simpler to add functionality or to improve the readability of the code.
---

# Refactoring

- When refactoring code strive to isolate changing tests from changing code in separate commits and ensure each commit passes tests.
- When implementing a feature consider refactoring the code first to make it simpler to extend functionality.
- Isolate different categories of refactoring in separate commits. For example, you could include several variable renames in one commit but should not include variable renames and function extraction in one commit. However, if including several refactors in one commit try to avoid making multiple different changes on the same line of code and create smaller commits if necessary.
