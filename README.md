# IPL Data Lakehouse on Microsoft Fabric

![Microsoft Fabric](https://img.shields.io/badge/Microsoft-Fabric-blue)
![PySpark](https://img.shields.io/badge/PySpark-Data%20Processing-orange)
![Delta Lake](https://img.shields.io/badge/Delta-Lake-green)
![SQL](https://img.shields.io/badge/SQL-Analytics-red)
![Architecture](https://img.shields.io/badge/Architecture-Medallion-purple)

## Project Overview

This project implements an end-to-end IPL Analytics Lakehouse using Microsoft Fabric and Medallion Architecture (Bronze → Silver → Gold).

The pipeline ingests IPL ball-by-ball data covering 17 seasons (2008–2024), stores raw data in Delta Lake tables, performs data cleaning and quality validation using PySpark, and generates analytical Gold-layer tables for batting, bowling, and team performance analysis.

The project demonstrates modern data engineering practices including Lakehouse architecture, Delta tables, PySpark transformations, partitioned storage, and business KPI generation.

---

## Architecture

![Architecture Diagram](architecture/medallion_architecture.png)

---

## Dataset Overview

### Source

IPL Match & Delivery Dataset (2008–2024)

### Dataset Statistics

| Metric | Value |
|----------|----------|
| Seasons Covered | 17 |
| Matches | 1,095 |
| Deliveries | 260,920 |

---

## Technology Stack

| Technology | Purpose |
|------------|----------|
| Microsoft Fabric | Lakehouse Platform |
| OneLake | Unified Storage |
| Delta Lake | Transactional Storage |
| PySpark | Data Transformation |
| SQL | Analytics Queries |
| Medallion Architecture | Data Layering Strategy |

---

## Medallion Architecture

### Bronze Layer

Raw data ingestion layer.

Tables:

- bronze_matches
- bronze_deliveries

Features:

- Raw CSV ingestion
- Delta table storage
- Immutable historical data
- Source preservation

---

### Silver Layer

Data cleaning and standardization layer.

Transformations:

- Duplicate detection and removal
- Team name standardization
- Data quality validation
- Schema corrections
- Season-based partitioning

Standardized Team Names:

| Original | Standardized |
|-----------|-----------|
| Delhi Daredevils | Delhi Capitals |
| Kings XI Punjab | Punjab Kings |
| Rising Pune Supergiant | Rising Pune Supergiants |

---

### Gold Layer

Business-ready analytical tables.

Tables:

#### gold_batsman_stats

Contains:

- Runs scored
- Strike rate
- Fours
- Sixes
- Balls faced

#### gold_bowler_stats

Contains:

- Wickets
- Economy rate
- Dot-ball percentage
- Overs bowled

#### gold_team_season_performance

Contains:

- Matches played
- Wins
- Win percentage
- Season performance metrics

---

## Project Metrics

### Bronze Layer

| Metric | Value |
|----------|----------|
| Bronze Tables | 2 |
| Match Records | 1,095 |
| Delivery Records | 260,920 |

### Silver Layer

| Metric | Value |
|----------|----------|
| Match Records | 1,095 |
| Delivery Records | 260,917 |
| Duplicate Records Removed | 3 |
| Seasons Partitioned | 17 |
| Team Name Variants Standardized | 3 |

### Gold Layer

| Metric | Value |
|----------|----------|
| Batsman Records | 674 |
| Bowler Records | 531 |
| Team Performance Records | 146 |
| Gold Tables | 3 |

---

## Example Analytics Queries

### Top Run Scorers

```sql
SELECT batter, total_runs
FROM gold_batsman_stats
ORDER BY total_runs DESC
LIMIT 10;
```

### Best Economy Bowlers

```sql
SELECT bowler, economy
FROM gold_bowler_stats
WHERE overs > 50
ORDER BY economy ASC;
```

### Team Win Percentage

```sql
SELECT team,
AVG(win_percentage) AS avg_win_percentage
FROM gold_team_season_performance
GROUP BY team
ORDER BY avg_win_percentage DESC;
```

---

## Repository Structure

```text
ipl-fabric-lakehouse/
│
├── notebooks/
│   ├── bronze_ingestion.ipynb
│   ├── silver_transformation.ipynb
│   └── gold_aggregation.ipynb
│
├── architecture/
│   └── medallion_architecture.png
│
├── screenshots/
│
├── sql/
│   └── analytics_queries.sql
│
├── datasets/
│   └── dataset_link.txt
│
├── project_metrics.md
│
├── README.md
│
└── requirements.txt
```

---

## Screenshots

### Lakehouse Overview

_Add screenshot here_

### Bronze Tables

_Add screenshot here_

### Silver Tables

_Add screenshot here_

### Gold Tables

_Add screenshot here_

---

## Future Enhancements

- Incremental data loading
- Fabric Pipeline orchestration
- Real-time IPL data streaming
- Advanced player-performance analytics
- Match outcome prediction using Machine Learning

---

## Resume Highlight

Built an end-to-end IPL analytics lakehouse on Microsoft Fabric using Medallion Architecture (Bronze/Silver/Gold), processing 260K+ ball-by-ball records with PySpark and Delta Lake, implementing data quality validation, partition-optimized transformations, and analytics-ready Gold tables for scalable cricket performance analysis.