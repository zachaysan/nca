---
title: Generate JSON
---

# Generating JSON in Nim

The easiest way to generate JSON in Nim is to rely on the object system:

```nim
import marshal

type
  Car = object
    name: string
    speed: int

var car = Car(name: "Tesla", speed: 220)

echo($$car)
```

If you are working with the JSON module, instead do the following:

```nim
import json

var jsonResponse = %*
                   {"data": [{ "id": 35,
                               "type": "car",
                               "attributes": {"color":"red"} }]}

var body = ""

toUgly(body, jsonResponse)

echo body
```

Another option is to use the `toPretty` option, but note that this has
performance issues for very large data structures.
