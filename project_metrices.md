# Project Metrics

## Dataset Overview

| Metric | Value |
|----------|----------|
| Seasons Covered | 17 (2008–2024) |
| Matches Processed | 1,095 |
| Deliveries Processed | 260,920 |

## Bronze Layer

| Metric | Value |
|----------|----------|
| Bronze Tables | 2 |
| Raw Match Records | 1,095 |
| Raw Delivery Records | 260,920 |
| Storage Format | Delta Lake |

## Silver Layer

| Metric | Value |
|----------|----------|
| Clean Match Records | 1,095 |
| Clean Delivery Records | 260,917 |
| Duplicate Records Removed | 3 |
| Seasons Partitioned | 17 |
| Team Name Standardization | Applied |
| Data Quality Validation | Applied |

## Gold Layer

| Metric | Value |
|----------|----------|
| Batsman Statistics Records | 674 |
| Bowler Statistics Records | 531 |
| Team Performance Records | 146 |
| Gold Tables Created | 3 |

## Technology Stack

- Microsoft Fabric
- Fabric Lakehouse
- PySpark
- Delta Lake
- SQL
- Medallion Architecture