---
title: Generate JSON
---

# Generating JSON in Nim

To generate JSON in Nim:

```nim
import marshal

type
  Car = object
    name: string
    speed: int

var car = Car(name: "Tesla", speed: 220)

echo($$car)
```

There is another (more complex) way to generate JSON in Nim that needs covering later.
