---
title: Cool things
---

# Some cool Nim-specific programming language features

## The case statement

The case statement is pretty neat because it does not let you fail to list a value and it also allows comma separated lists of matching values. See this example taken [from the official docs](http://nim-lang.org/docs/tut1.html#control-flow-statements-case-statement):

```nim
from strutils import parseInt

echo("A number please: ")
let n = parseInt(readLine(stdin))
case n:
  of 0..2, 4..7:
    echo("The number is in the set: {0, 1, 2, 4, 5, 6, 7}")
  of 3, 8:
    echo("The number is in the set: {3,8}")
```

This fails to compile! This is great because it helps to stop oversights. To fix the above code simply:

```nim
from strutils import parseInt

echo("A number please: ")
let n = parseInt(readLine(stdin))
case n:
  of 0..2, 4..7:
    echo("The number is in the set: {0, 1, 2, 4, 5, 6, 7}")
  of 3, 8:
    echo("The number is in the set: {3,8}")
  else:
    discard
```

## Case and underscore sensitivity

This one is fairly controversial, but it is pretty cool once you get used to it.

```nim
echo parseInt("3")

# is the same as:

echo parse_int("3")
```

The only time underscores or capitalization matter is if they are the first letter in the method or variable.

## Function vs method

Methods-like syntax is a substitute for functions where the first argument is the type that the method is being called on! It allows the programmer to chose whichever is clearer.

```nim
echo "3".parseInt

# is the same as:

echo parseInt("3")
```
