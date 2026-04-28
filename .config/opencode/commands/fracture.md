---
description: >
  Improve the reviewability of a commit by breaking it down into several simpler commits.
---

The source commit is $1, defaulting to HEAD.

Review the source commit with the goal of breaking apart the single commit into several commits in order to separate refactoring commits from functional changes or to breakdown a complex commit into a series of simpler commits.
The diff of the range of commits you produce MUST BE identical to the patch from the source commit.

If you have a refactoring skill you should use it.
