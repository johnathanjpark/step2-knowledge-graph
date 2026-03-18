# Step 2 Clinical Knowledge Graph

## Overview
This project is a structured system for analyzing clinical reasoning errors during USMLE Step 2 preparation.

The system integrates:
- structured logging of missed questions
- relational database modeling (PostgreSQL)
- analytical pipelines (Python / Pandas)
- conceptual relationship mapping (Neo4j)

## Objectives
- identify patterns in diagnostic and management errors
- quantify cognitive biases such as premature closure
- track performance over time
- build a clinical reasoning knowledge graph

## Architecture
Spreadsheet intake -> PostgreSQL storage -> Pandas analysis -> Neo4j relationships

## Status
Phase 1: logging and basic analytics