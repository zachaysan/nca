---
title: Block comment
---

# Block commenting in Nim

Nim does not have a built in block comment built-in. To achieve a block comment like effect there are two ways to achieve the same effect.

```nim
# The first method which does not require proper indenting:
discard """
for item in broken_iterator:
  echo item
"""

# The second method which is easier to switch on on off:
when false:
  var response = broken_function(silly_argument)
```

Both methods work, but the second method preserves syntax highlighting which can be useful when debugging, but it makes it harder to visually see that the code is commented out.
