---
# Title, summary, and page position.
linktitle: IO
summary: How and Why
weight: 2
icon: video
icon_pack: fas

# Page metadata.
title: IO
date: "2021-08-17T00:00:00Z"
type: page  # Do not modify.
---

{{% awsvideo slug="io" %}}

## Slides
- [Slides](/slides/io.pdf)

## Transcript

Welcome to competitive programming!

## Input and Output

Today we are going to talk about IO, and some of the tricks you will need.
There are three common patterns for test cases you will want to know, and
some different kinds of formatting you'll need.

## Explicit Test Count

The most common scenario is that the first line of input will contain the number
of test cases you should expect.  This is the easiest thing to handle.  Just make
sure you decrement your variable that counts how many cases there are!

You can also say `while (cases)` without the explicit check for zero, but the explicit
check is slightly safer.

The code on the right uses `cin` and `cout`.  The include file at the top brings in
the entire standard template library, and is a lot more convenient than having to
list the different STL data structures separately.  The `ios_base` and `tie` stuff you see
on lines 3 and 4 are for efficiency, and I'll talk about them later.

## Termination Marker

The second common pattern is to have a termination marker.  For example, you could be
reading in a bunch of points, and when it is done there will be a special value such as
-1 to indicate that you are done.  That is what this code is doing here; when `x` and `y` both
get -1, we are done.

There are two common ways to deal with this kind of input.
One technique is to make a non-terminating `while` loop and use a `break` statement to exit
if the termination marker is detected.  Be careful using this if you happen to have nested
loops for some reason.

## Termination Marker, pt 2

I think it is more reliable though to put the check in the `while` loop itself.  Here's an
example using `scanf`, but you can do this with `cin` also.  I happen to think this code is
cleaner; a bug involving break statements can be harder to track down than one involving
an exit condition.

During a contest, though, nobody is going to care how readable your code is, except for you.

## End of File

The final common method is to have an end of file.  You have to be careful with this; if you
don't check, the code will keep running with weird values in your input variables.  `scanf`
will return an explicit `EOF` marker if you hit the end of file, and `cin.eof()` will return
true upon end of file.

## Why `scanf` and `printf`?

If you are not using C++ you can skip this bit.

You will sometimes hear people tell you not to use `cin` and `cout`, since they can be inefficient.
There are some problems that if you use off-the-shelf `cout` to output your answer it can get
Time Limit Exceeded.  This is rare, but can happen if your code needs to output a *lot* of data.
In that case, these two lines will speed things up.  The `sync_with_stdio` allows you to mix
`printf` and `cout` style output without causing trouble.  C style `printf` and C++ style `cout`
have their own buffers.  If you are only using `cout`, you don't need to synchronize the buffers,
so you can use this call to turn that off.  If you using both, then don't type this line or your
output will be randomly shuffled, depending on when the buffers get flushed.

The second line causes `cin` and `cout` to be tied together.  For example, if you use `cout`
to write a prompt to the string, then `cin` to read the input, you want the prompt to be flushed
and displayed before trying to collect the input.  For most contest situations, you don't need
this.

Finally, `endl` always flushes the output, so use `\n` instead.

That said, `scanf` and `printf` have some nice features you may want to use, but you have to
be more careful.  For example, the format string has to indicate the type of thing you are
dealing with, and `scanf` also has to be given a *reference* to the variable.  This is because
it is using old C-style programming.


## Spaces and such

Here are some examples of where `scanf` can save some time.  Suppose you know the input is going
to have something like parens and a comma around two integers.  With `scanf` you can read in those
expected characters and extract out the integers.  On the bottom you see this other notation,
something kind of like regular expression matching.  I have to admit, I don't think I have ever
seen this used in real life.

## Getting the whole line.

Sometimes you will need to get a whole line.  Here's how to do it.
If you are using C-style input, you'll want to use `fgets`.  Here, `name` is your string
variable, and 100 is the maximum size.  For C++ style, use `getline`.  The first
`getline` reads a whole line, the second one throws out leading whitespace first.

## Setting number of digits

Some problems will specify how many digits to display.  For `printf`, there are modifiers
to the codes that change if there should be leading spaces or zeros or not.  There are similar
modifiers that work with floating point.  You will want to look up the `printf` documentation
and get familiar with these.

For `cout`, there are also function modifiers like `width` and `set_precision` you can use.
I find them to be a lot more verbose than the `printf` style formatting.

## Interactive Tests

Finally, you need to know about interactive tests.  At the time of writing, ICPC has not used
these in a world finals, but during the practice contest for the 2019 world finals in Portugal
there was one interactive problem.  This means they are testing them out and seriously considering
having them in the future.

These are not really more difficult, but if you get one then you have to disregard everything
said earlier about tieing `cin` with `cout`.  In this case you *want* to flush the buffers regularly
or else you program might hang waiting for input because the output buffer didn't get flushed yet.

Well, that is the basics of what you need to know.  See you in class.
