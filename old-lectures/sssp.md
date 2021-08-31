---
title: Single Source Shortest Paths
date: 2021-03-03
links:
  - category: Videos
    links:
      - title: BFS for Shortest Path
        url: /videos/bfs-shortest-path
        display: true
      - title: Dijkstra's Algorithm
        url: /videos/dijkstra-shortest-path
        display: true
      - title: Bellman-Ford and SPFA
        url: /videos/bellman-ford-and-spfa
        display: true
---

## Synopsis

A single source shortest path algorithm discovers the shortest paths
between a single node and all the other nodes.  There are three algorithms
that can do this, depending on the situation.

  - Unweighted graphs use BFS
  - Weighted graphs with no negative edges use Dijkstra's algoritm
  - Weighted graphs with negative edges use the Bellman Ford algorithm.

## Recommended Reading

  - Competitive Programming 3, section 4.4

## Problem

  - {{<UVa id="370" name="429 - Word Transformation" >}}
