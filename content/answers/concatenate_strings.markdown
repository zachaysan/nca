---
title: Concatenate strings
---

# Concatenation of strings in Nim

To concatenate strings in Nim

```nim
var greeting = "Hello"
var name = "Linus"

echo greeting & " " & name
```

There is a (currently experimental) string interpretation option as well.

```nim
import strfmt

var greeting = "Hello"
var name = "Linus"

echo interp"$greeting $name"
```

Note that string interpretation also works for more complex cases. See [here](/answers/interpolate_strings/) for more information.
