---
title: Split a string
---

# Split a string by whitespace, character, newline, or string in Nim

There are four different ways to split a string in Nim:

```nim
import strutils

# By whitespace
for word in split("man bear\npig"):
  echo word
# man, bear, pig printed on separate lines

# By string
for word in split("apple, orange, pear", ", "):
  echo word

# By character
for word in split("euro,pound,yen", {','}):
  echo word

# By newline
for line in splitLines("secret agent\nextraordinaire"):
  echo line
```

Of course if an sequence of tokens is all you need then simply:

```nim
import strutils

echo split("man bear pig")
```

Which prints `@[man, bear, pig]`
