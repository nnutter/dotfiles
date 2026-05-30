---
description: >
  Analyze code and propose the smallest useful refactoring before editing.
  Reviews the existing refactoring skill first. Use when the user says
  "refactor", "clean this up", "extract function", "rename variable",
  "move function", "remove dead code", "replace magic literal", or invokes
  /refactor.
---

First, review and apply the existing `refactoring` skill before doing anything else.

The refactoring target is `$1`. If `$1` is empty, infer the target from the current conversation and working context.

Your job is to produce a refactoring plan first, not code edits.

## Goal

Identify the smallest high-value refactoring that improves readability, cohesion, changeability, or duplication without changing behavior unless the user explicitly asked for a functional change.

## Operating rules

- Preserve behavior by default.
- Prefer the smallest correct refactoring over ambitious redesign.
- Prefer one refactoring category at a time.
- Follow the `refactoring` skill's guidance on separating test changes, refactors, and behavior changes.
- If tests are needed to lock current behavior, say so explicitly.
- If multiple refactorings are useful, propose the minimum safe sequence.
- If no refactoring is justified, say so directly.
- Cite the exact files, symbols, or code regions that drove the recommendation.
- Do not edit files yet. Wait for user confirmation.

## Analyze the target

Inspect the relevant code and identify concrete issues such as:

- unclear naming
- duplicated logic
- long or awkward functions
- expressions that hide intent
- long parameter lists or clumped data
- logic living on the wrong type or module
- dead or unreachable code
- unexplained literals
- repeated branching with type-specific behavior
- multiple conditionals leading to the same outcome
- loops that are harder to read than a pipeline

## Refactoring patterns to consider

For each applicable pattern, use it only when it is the clearest small step.

- `Change Function Declaration`
  - Use for renaming a function or changing parameters to better match intent.
  - Keep the behavior stable while changing the interface.
  - Update affected call sites to match the new interface.

- `Combine Functions Into Class/Struct`
  - Use when several functions share the same data and form one cohesive concept.
  - Prefer this only when introducing a class/struct reflects real ownership.
  - Avoid adding a class/struct just to group unrelated helpers.

- `Extract Function`
  - Use when a block has a clear purpose, repeated logic, or too much local complexity.
  - Extract the smallest coherent block and give it a name that explains why it exists.

- `Inline Function`
  - Use when a function adds indirection without adding meaning.
  - Prefer inlining when the body is simple and the call site becomes clearer.
  - This is usually only considered when the function has only one call site.

- `Extract Variable`
  - Use to name an expression.
  - Prefer names that explain meaning, not mechanics.

- `Inline Variable`
  - Use when a temporary variable adds noise or hides a simple expression.
  - Prefer direct expressions when they remain easy to read.

- `Introduce Parameter Object`
  - Use when parameters repeatedly travel together and represent one concept.
  - Prefer this when it reduces long parameter lists and clarifies call sites.
  - Avoid it if it only wraps unrelated values.

- `Rename Variable`
  - Use when names are vague, misleading, or too generic.
  - Prefer domain language and consistency across the local area.

- `Move Field`
  - Use when data is owned or used more naturally by another type or module.
  - Prefer moving the field closer to the behavior that depends on it.

- `Move Function`
  - Use when behavior depends more on another type, file, or module than its current home.
  - Prefer moving the function to improve cohesion and reduce awkward dependencies.

- `Remove Dead Code`
  - Use for unreachable, unused, obsolete, or superseded code.
  - Be conservative and confirm it is truly dead before proposing removal.

- `Replace Magic Literal`
  - Use when a literal has domain meaning that is not obvious at the use site.
  - Prefer a named constant when the name explains intent better than the raw value.
  - Do not replace literals that are already obvious and clearer inline.

- `Replace Conditional With Polymorphism`
  - Use when type-based branching is stable and behavior varies by subtype or strategy.
  - Prefer this only when it simplifies future change more than it increases structure.
  - Avoid it when a simple conditional is still clearer.

- `Consolidate Conditional Expression`
  - Use when several checks produce the same result or gate the same behavior.
  - Prefer a single condition or a well-named predicate.

- `Replace Loop With Pipeline`
  - Use when a loop is mainly transforming, filtering, or aggregating data.
  - Prefer a pipeline only when it makes the logic easier to read in this language and codebase.
  - Avoid forcing a pipeline when the loop is already clearer.

## Response format

Respond with these sections in order:

1. `Target`
2. `Current smell(s)`
3. `Recommended refactoring(s)`
   Include exact files and symbols.
4. `Why this is the smallest good change`
   Compare briefly against obvious alternatives when helpful.
5. `Suggested step order`
6. `Testing needed first`
7. `Commit split suggestion`
8. `Wait for confirmation before editing`

## Commit guidance

If you recommend commits, align with the `refactoring` skill:

- isolate test-only changes from production refactors
- isolate different refactoring categories where practical
- prefer refactoring commits before functional change commits
- if a refactoring commit is created, prefix it with `Refactor:`

Do not start editing until the user confirms the plan.
