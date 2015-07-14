---
title: Parse JSON
---

# Parsing and pretty printing JSON in Nim

To parse JSON in Nim:

```nim
import json

var json_string = """{"name": "Linus", "age": "Imortal"}"""
echo parseJson(json_string).pretty
```

See also: [Generating JSON in Nim](/answers/generate_json/)
