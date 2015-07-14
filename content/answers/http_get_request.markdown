---
title: Perform an HTTP(S) get request
---

# Perform an HTTP or HTTPS GET request in Nim

Performing get requests in Nim is pretty simple.

```nim
import httpclient

# Get ready to party!
echo getContent("http://example.com")
```

That's all there is to it for a normal HTTP request, but in order to compile Nim with the necessary SSL libraries, add the following option during compilation:

`nim compile -d:ssl`

Which will work if you have OpenSSL installed.

See also: [Parsing JSON in Nim.](/answers/parse_json)
