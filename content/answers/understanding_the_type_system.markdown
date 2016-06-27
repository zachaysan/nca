---
title: Understand the type system
---

# Understanding the Nim type system

```nim
Error: type mismatch: got (seq[int], int)
expected one of: system.add(x: var seq[T], y: T)
```

While most aspects of the Nim type system are immediately understandable, there are some gotchas that can lead to the errors like the ones above.

## Var keyword required in parameter list for generic types

Proc definition requires the var keyword in order to instantiate the type, so rather than defining a proc like so:

```nim
# This fails to compile.
proc addFive( intSeq: seq[int] ): seq[int] =

  # Removing the following line will allow it to compile, but
  # the type will not include any of the seq methods
  intSeq.add( @[5] )

  return intSeq

var numbers = @[1,2,3,4]
echo addFive( numbers )
```

Instead you must include the `var` keyword in the `seq` parameter.

```nim
# This compiles.
proc addFive( intSeq: var seq[int] ): seq[int] =
  intSeq.add( @[5] )

  return intSeq

var numbers = @[1,2,3,4]
echo addFive( numbers )
```

## Self nested types frequently fail to compile

Some objects, like Tables, currently give misleading compile errors when subnested. See [this issue](https://github.com/nim-lang/Nim/issues/2722).

See also: [Checking types in Nim](/answers/checking_types/)
