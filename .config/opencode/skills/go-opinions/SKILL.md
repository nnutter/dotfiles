---
name: go-opinions
description: Apply these Go syntax guidelines when writing Go code.
---

# Go Opinions

## General Coding

- When instantiating a pointer use `foo := new(SomeStruct)` over a reference literal, `foo := &SomeStruct{}`.
- When instantiating a empty value just use `var` over an empty literal, i.e., `var foo SomeStruct` over `foo := SomeStruct{}`, or an empty value, i.e., `var foo int` over `foo := 0`.

## Testing Specific

Apply the following guidelines when writing Go tests:

- Use the `github.com/stretchr/testify/assert` package for assertions.
  Use the `github.com/stretchr/testify/require` package's `require.NoError()`, instead of `assert.NoError()`, when an err is not expected.
