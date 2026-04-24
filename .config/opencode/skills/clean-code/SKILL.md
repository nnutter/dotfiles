---
name: clean-code
description: Apply Clean Code guidelines when writing code in any programming language.
---

# CLEAN CODE ENFORCEMENT RULES

Source: "Clean Code" by Robert C. Martin — distilled for AI agents

You are a senior software engineer who has **memorized and strictly follows** _Clean Code_.  
Before writing or modifying any code, **you must**:

1. **Cite 1–3 specific rules** from this file that apply.
2. **Apply them exactly** — no exceptions unless explicitly approved.
3. **Never violate a rule** to save lines or time.

---

## 1. NAMING (Chapter 2)

- **Use intention-revealing names**  
  Bad: `d`, `data`, `temp`  
  Good: `elapsedDaysSincePurchase`, `userSessionTimeoutSeconds`

- **Avoid disinformation**  
  Never: `accountList` (if not a `List`)  
  Never: `theUser` (no article)

- **Make meaningful distinctions**  
  Bad: `copy1`, `a1`, `a2`  
  Good: `sourceFilePath`, `destinationFilePath`

- **Use pronounceable, searchable names**  
  Prefer: `generationTimestamp`  
  Avoid: `genymdhms`

- **Class names**: Noun or noun phrase (`Customer`, `WikiPage`)
- **Method names**: Verb or verb phrase (`deletePage()`, `save()`)

---

## 2. FUNCTIONS (Chapter 3)

- **Do ONE thing** (Single Responsibility Principle)  
  If you can extract another function with a name that is not merely a restatement, **you must**.

- **Small**:
  - **< 20 lines** (including comments)
  - **< 4 levels of nesting**
  - **< 3 arguments** (0–2 preferred)

- **One level of abstraction per function**  
  High-level steps → call lower-level functions  
  Never mix `saveToDatabase()` with `validateEmailFormat()`

- **Stepdown Rule**: Code should read like a newspaper — high to low abstraction

- **Use descriptive names**  
  A long name is better than a short name + comment

- **Command Query Separation**:
  - Functions should either **do something** or **answer something**, not both  
    Bad: `setUserActive(id, true)` → returns old value  
    Good: `activateUser(id)` + `wasUserActive(id)`

---

## 3. COMMENTS (Chapter 4)

- **Good comments**:
  - Legal (license)
  - Clarify intent (`// retry 3 times to avoid transient DB failure`)
  - Warning of consequences
  - TODO with ticket link

- **Bad comments**:
  - Restate code
  - Mislead
  - Mandated (e.g., `// Default constructor`)
  - Journal (`// Changed by John on 2025-11-01`)

- **Strongly prefer code over comments**  
  Extract to function with good name instead of comment

---

## 4. FORMATTING (Chapter 5)

- **Vertical**:
  - One blank line between logical sections
  - Related lines grouped (newspaper style)

- **Horizontal**:
  - **< 100 characters per line**
  - Indent consistently (4 spaces or 2 — match project)

- **Team rules**:  
  Follow `.editorconfig` and `ruff` config

---

## 5. OBJECTS & DATA STRUCTURES (Chapter 6)

- **Prefer data abstraction**  
  Hide implementation: `coordinates.getX()` not `coordinates.x`

- **Law of Demeter**:  
  A method `f` of object `C` should only call methods of:
  - `C`
  - Objects created by `f`
  - Objects passed as arguments
  - Objects held in instance variables

---

## 6. ERROR HANDLING (Chapter 7)

- **Use exceptions, not return codes**  
  Bad: `if (deletePage(page) == E_OK)`  
  Good: `try { deletePage(page) } catch (...)`

- **Don’t return null**  
  Throw exception or return special case object

- **Don’t pass null**  
  Validate inputs early

- **Wrap third-party APIs** in try/catch if needed

---

## 7. BOUNDARIES (Chapter 8)

- **Third-party code**:  
  Wrap in adapter (`OurDatabase`, not raw `PrismaClient`)

- **Learning tests**:  
  Write tests to explore new APIs — keep them

---

## 8. UNIT TESTS (Chapter 9)

- **F.I.R.S.T. Principles**:
  - **Fast**
  - **Independent**
  - **Repeatable**
  - **Self-validating**
  - **Timely**

- **One assert per test** (when possible)

- **Test names**: `shouldReturnTrueWhenUserIsActive`

---

## 9. CLASSES (Chapter 10)

- **Small**: First few methods → small class
- **Single Responsibility**: One reason to change

- **Cohesion**: Instance variables used by most methods

- **Organize for change**: Open/Closed where possible

---

## 10. SYSTEMS & EMERGENCE (Chapters 11–13)

- **Eliminate duplication** (DRY)
  - Same logic → extract
  - Similar logic → template method or strategy

- **Expressiveness**: Code should read like well-written prose

- **Minimal classes and methods**

---

## ENFORCEMENT INSTRUCTIONS (FOR AI AGENTS)

**Before generating code**:

1. List 2–3 rules from this file that apply.
2. Confirm: "I will follow these rules exactly."
3. Generate code.
4. After code: List which rules were applied and how.
