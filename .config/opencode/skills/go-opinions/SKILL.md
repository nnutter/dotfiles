---
name: go-opinions
description: Apply these guidelines when writing Go code.
---

# Go Opinions

## General Coding

- When instantiating a pointer use `foo := new(SomeStruct)` over a reference literal, `foo := &SomeStruct{}`.
- When instantiating a empty value just use `var` over an empty literal, i.e., `var foo SomeStruct` over `foo := SomeStruct{}`, or an empty value, i.e., `var foo int` over `foo := 0`.
- Prefer packages from the standard library over third-party packages.

## Error Handling

- Use `fmt.Errorf` to wrap errors with additional context when passing them up the stack.

## Testing Specific

Apply the following guidelines when writing Go tests:

- Set `GOTMPDIR` in order to ensure `t.TempDir()` is created in a `tmp` directory under the project root directory.
- Use the `github.com/stretchr/testify/assert` package for assertions.
- Use the `github.com/stretchr/testify/require` package's `require.NoError()`, instead of `assert.NoError()`, when an err is not expected.
- Use a slice of custom struct to define test cases when writing table-driven tests.
