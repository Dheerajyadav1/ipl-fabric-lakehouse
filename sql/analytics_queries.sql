# Batsman Analytics Queries
-- Top 10 Run Scorers in IPL History

SELECT TOP 10
    batsman,
    total_runs
FROM gold_batsman_stats
ORDER BY total_runs DESC;

-- Highest Strike Rate (Minimum 500 Runs)

SELECT TOP 10
    batsman,
    total_runs,
    strike_rate
FROM gold_batsman_stats
WHERE total_runs >= 500
ORDER BY strike_rate DESC;

-- Most Sixes in IPL History

SELECT TOP 10
    batsman,
    sixes
FROM gold_batsman_stats
ORDER BY sixes DESC;

-- Most Fours in IPL History

SELECT TOP 10
    batsman,
    fours
FROM gold_batsman_stats
ORDER BY fours DESC;


# Bowler Analytics Queries
-- Top Wicket Takers

SELECT TOP 10
    bowler,
    wickets
FROM gold_bowler_stats
ORDER BY wickets DESC;

-- Best Economy Bowlers
-- Filter out very small sample sizes

SELECT TOP 10
    bowler,
    overs,
    economy
FROM gold_bowler_stats
WHERE overs >= 50
ORDER BY economy ASC;

-- Highest Dot Ball Percentage

SELECT TOP 10
    bowler,
    dot_ball_percentage
FROM gold_bowler_stats
WHERE overs >= 50
ORDER BY dot_ball_percentage DESC;

# All Rounder Analytics Queries
-- Top All-Rounders

SELECT
    b.batsman,
    b.total_runs,
    bw.wickets
FROM gold_batsman_stats b
INNER JOIN gold_bowler_stats bw
ON b.batsman = bw.bowler
WHERE b.total_runs > 1000
AND bw.wickets > 20
ORDER BY b.total_runs DESC, bw.wickets DESC;

# Team Analytics Queries
-- Team Win Percentage

SELECT
    team,
    ROUND(AVG(win_percentage),2) AS avg_win_percentage
FROM gold_team_season_performance
GROUP BY team
ORDER BY avg_win_percentage DESC;

-- Most Wins Across Seasons

SELECT
    team,
    SUM(wins) AS total_wins
FROM gold_team_season_performance
GROUP BY team
ORDER BY total_wins DESC;

-- Team Performance by Season

SELECT
    season,
    team,
    matches_played,
    wins,
    win_percentage
FROM gold_team_season_performance
ORDER BY season, win_percentage DESC;


-- Data Description
-- Distinct Batters

SELECT COUNT(*) AS total_batters
FROM gold_batsman_stats;

-- Distinct Bowlers

SELECT COUNT(*) AS total_bowlers
FROM gold_bowler_stats;

-- Seasons Covered

SELECT
    MIN(season) AS first_season,
    MAX(season) AS latest_season,
    COUNT(DISTINCT season) AS total_seasons
FROM silver_matches;
