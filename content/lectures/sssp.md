---
# Title, summary, and page position.
linktitle: Single Source Shortest Path 
summary: How and Why
weight: 2
icon: book
icon_pack: fas

# Page metadata.
title: Single Source Shortest Path 
date: "2021-08-17T00:00:00Z"
lecturedate: "2010-10-19T12:30:00Z"
type: page
---

## Synopsis

A single source shortest path algorithm discovers the shortest paths
between a single node and all the other nodes.  There are three algorithms
that can do this, depending on the situation.

  - Unweighted graphs use BFS
  - Weighted graphs with no negative edges use Dijkstra's algoritm
  - Weighted graphs with negative edges use the Bellman Ford algorithm.

## Videos

  - [BFS for Shortest Path]({{% ref "/videos/bfs-shortest-path" %}})
  - [Dijkstra's Algorithm]({{% ref "/videos/dijkstra-shortest-path" %}})
  - [Bellman-Ford and SPFA]({{% ref "/videos/bellman-ford-and-spfa" %}})

## Recommended Reading

  - Competitive Programming 4, section 4.4

## Problem

  - {{<UVa id="370" name="429 - Word Transformation" >}}
