+++
title = "Floyd Warshall"
author = ["Mattox Beckman"]
draft = false
type = "page"
+++

{{< awsvideo slug="floyd-warshall" >}}

Hello, and welcome to competitive programming.
Today we are going to talk about Floyd Warshall's algorithm to find the shortest
paths between every pair of vertices.


## Objectives {#objectives}

Your objectives are to be able to implement the Floyd Warshall algorithm,
to know the upper limit of the graph size for which this will work, and
some of the problems that this algorithm can solve.


## The Algorithm {#the-algorithm}

To use this algorithm, we need an adjacency matrix, which you
remember is a two dimensional array representing
the graph.

When the algorithm starts the matrix will have zeros down the diagonal and
entries for the direct edges in the graph. All the other entries will be marked
as infinite. We'll use a number like \\(10^9\\) to mean infinity.

Now we have a triple nested loop. Notice the order of the indices, k, i, j. The
basic idea is that k will be an intermediate node, and we will loop over all
pairs of edges i and j to see what the shortest path is that goes through k.

The line in the main loop is making the following calculation: entry i,j has the
shortest path we have discovered so far that only involves nodes less than k. So
in this loop we check to see if adding node k changes anything or not, and
record the best path we find.

We'll go over an example in a minute, but here's what you should notice right
away. First, the code is dead simple. Four lines of code pretty much does it.
But second, it runs in order \\(V^3\\) time. Practically speaking, that means this
code will not be usable in a contest if the number of vertices is above 500. If
in doubt, create a test case of maximal size and see if your code runs in the
required time limit.

Now, if you know the number of vertices is going to be small, there's a big advantage
to using this algorithm even if you only need a single source shortest path.  The
code is fast to type in, and if you are paying attention you will not even need to
debug it.  You will be able to submit a solution more quickly than coders who have
to implement Dijkstra or the Fast Algorithm.

So now that you've memorized this code, let's look at an example run.


## Sample Run {#sample-run}

We'll start with this graph. We make an adjacency matrix, setting the diagonal
to zero and the incident edges to their respective weights.

Now, the first run of the k loop is going to have k=0, so that means we are going to check
for every path that has 0 as an intermediate node.

For this graph, there are three paths like that, all starting from the edge 5-0 of weight

1.  (next)

These are 5-0, 0-1; 5-0, 0-2; and 5-0, 0-3.  Notice how all the paths have length 2.

Next we are going to run with k=1, which is going to calculate the paths that could have
both 0 and 1 as an intermediate node.

(next)

There are two new paths that get added as a result.  The first is this one from 0 to 2,
and that updates our shortest path entry.

The next one is from 5 to 2.  We are making use of the 5 to 1 path we calculated in the
previous run.

As k keeps looping, we are able to combine shortest path results from longer and longer
paths.  After a k loop is done, the array will have the shortest paths found for each
pair of nodes that could have nodes k and below as intermediate nodes.


## Applications {#applications}

Here is one possible modification.  If you need to be able to produce the shortest
path, you will need to keep a parent array.  Here's the code to do that.

We add three things.  First, lines 0 through 2 initialize the parent array.
Next, the inner statement of the three loops now updates the parent array if a new
best match is found.

Finally, we have a recursive function printPath that will traverse the parent
array to emit the path.
