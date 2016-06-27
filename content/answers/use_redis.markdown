---
title: Use Redis
---

# Using Redis from Nim

To use Redis in Nim first start by using nimble to download the Redis
client:

`nimble install redis`

Then from Nim simply:

```nim
import redis

# Opensa redis client with default information:
var r = open()

r.setk("best_programming_language", "Nim")
echo r.get("best_programming_language")
```
