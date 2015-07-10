---
title: Interpolate strings
---

# Interpolation of strings in Nim

To interpolate strings in Nim:

    import strfmt

    var greeting = "Hello"
	var name = "Linus"

    echo interp"$greeting $name"

    # To evaluate an expression:
    var age = 15
    echo interp"Welcome to Grade ${age - 5}"

    # Evaluate an expression and apply string formatting
    var pieSlices = 6
    var slicesEaten = 2
    echo interp"You ate ${100 * slicesEaten / pieSlices:.1f}% of the pie!"

If you get the following error:

`main.nim(1, 8) Error: cannot open 'strfmt'`

It means that you have not installed `strfmt` or that it is not in your path. Install the Nim package manager, [Nimble](https://github.com/nim-lang/nimble), and then:

`nimble install strfmt`

To install the module and try running the program again.
