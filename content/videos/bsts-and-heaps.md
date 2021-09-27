---
# Title, summary, and page position.
linktitle: Sets, Maps, and Priority Queues
summary: 
weight: 2
icon: video
icon_pack: fas

# Page metadata.
title: Sets, Maps, and Priority Queues
date: "2021-08-17T00:00:00Z"
type: page  # Do not modify.
---

{{% awsvideo slug="bsts-and-heaps" %}}

## Transcript


# Welcome

Hello, and welcome to competitive programming.  Today we are going to start
talking about more serious data structures: in this case balanced trees and
heaps.

## Objectives

We are, again, going to assume you know the basics of the balanced binary tree,
either the AVL tree or the Red-Black tree. We also are going to assume you know
about heaps. We have two goals. First, we want you to learn the STL interfaces
to these structures and become proficient at determining which one you need
to use.  But you will not be able to rely on these forever.  More advanced
problems will require you to augment these data structures in ways the STL
cannot accommodate.  For those problems, you will need to be able to write a
customized version of these quickly and accurately.

# BSTs

## A rotation

As before, we are going to advocate for the use of library versions of
trees and sets. But....
the is a major disclaimer.  Some of the more advanced problems we will
get to later in the course will require customized versions of these
libraries.  So you are going to have to be able to write bug free versions
of red-black or AVL trees sooner or later.  You should practice writing
an implementation on a periodic basis so that you gain speed during the
contests.

As a reminder, here is the code in C++ to do a left rotation.
You might recognize it from CS 225.
The right rotation is
the dual of this, and there are left-right and right-left rotations
that you make by composing these single rotations.  My advice is to give
yourself a speed drill... how quickly can you code a tree or other data
structure that uses rotations?

## The STL

But for now, know that C++ STL uses red-black trees to implement the
`map` and `set` libraries.  The `map` library stores both key and value,
whereas `set` only stores the keys.  The time complexity for lookup is
$\log(n)$, which is not as good as a hash table, but good enough for
most ICPC type problems where the input size is less than one million.

There is another advantage of using `map` and `set` rather than hashing: you can
get an iterator to the ordered contents.

You'll want to look at the C++ reference guide for these to see what
other operations they offer, but here are some highlights.

There is `insert`, which inserts an element.  If the key is already part of
the data structure, then it will *not* be overwritten.  Use `replace` to replace
an existing key.  There is also `erase` to remove a single element, and `clear`
to erase the whole structure.  To access the values, use the array access operator,
or else the `at` method.

## Hashing

There is one kind of hashing that may be of use though.  This is when you
can ``bucket sort'' your elements.  In other words, you have an array into
which you can locate a key without needing to hash or sort it.  For example,
if your keys were integers from 1 to 1024, or perhaps single characters,
then a simple array does what we need very quickly.

Here's a simple example: suppose you needed to implement a Ceaser Cipher,
where each letter of the alphabet was transposed to make a secret code. 
You might make a direct lookup table like this one.  You only need 26 letters,
but since the total amount of data is small and the keys are unique, we
can just use an array.

## Priority Queues

The `priority_queue` is a max heap, and has $O(1)$ access to the maximum
member, and $O(\log n)$ insertion and removal.

A max heap has two very useful functions.  First, it can serve as a priority
queue.  Second, it can partially sort data for you very efficiently.
If you have a million elements and want the top 10, this is a good choice.
If you want a much larger fraction of these elements, then a modified version
of quicksort may be better.
