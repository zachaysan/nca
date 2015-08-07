---
title: Create a shared library and calling it from Ruby
---

# Create a shared library

Creating a shared library in Nim is very straighforward. First, create a proc with the `exportc` [pragma](http://nim-lang.org/docs/manual.html#foreign-function-interface-exportc-pragma) which gives a name that will be callable from C and other programming languages.

```nim
# Place this in nir.nim

# Returning an int and using recursion
proc fibonacci(n: int): int {.exportc: "fibonacci".} =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci


proc isPrime(n: int): bool {.exportc: "is_prime".} =
  var remainder: int

  for i in 2..(n div 2):
    remainder = n mod i
    if remainder == 0:
      return false

  return true
```

It is often convient to pack data into structs / objects. For example:

```nim
type
  Person = object
      age*: int

method getAge(this: Person): int {.exportc: "get_age".} =
  this.age
```

To create the shared object compile with the flags `nim compile --app:lib` which will create a shared object with the `lib` prefix and `.so` suffix. In this tutorial, I've placed the Nim code in `nir.nim` so the resulting shared object library is `libnir.so`.

# Calling from Ruby

Calling shared library code from Ruby is most easily completed with the [Ruby-FFI](https://github.com/ffi/ffi/wiki) (Foreign Function Interface). First link to the shared object, then expose the fuctions using the `attach_function` method. To interface with Nim objects we use FFI structs which align with Nim's object model (which are really just fancy C structs under the hood).

```ruby
require 'ffi'

module Nir
  extend FFI::Library
  ffi_lib File.join(Dir.pwd, "libnir.so")

  attach_function :fibonacci, [:int], :int
  attach_function :is_prime, [:int64], :bool

  class Person < FFI::Struct
    layout(:age, :int)
  end

  attach_function :get_age, [Person.by_value], :int

end

puts Nir.fibonacci(25)

puts Nir.is_prime(2999)
puts Nir.is_prime(3000)

person = Nir::Person.new
person[:age] = 30

puts Nir.get_age(person)
```

Note that plain old Ruby objects can be interacted with directly as well, but the code to do so is generally less elegant since Ruby objects are represented as a collections of integers and points. It's generally easier to reduce the performance critical part of your Ruby app to the subset that needs to be fast and pass in the data via structs.

Also note that using multiple Nim shared library files will result in conflicting garbage collectors. See [here for more information](http://nim-lang.org/docs/backends.html#interfacing-backend-code-calling-nim) and please feel free to update this page with more information about Nim's GC and shared objects.
