## Project Overview 

This project performs exploratory data analysis (EDA) on a Student Performance dataset using MySQL.
The objective is to analyze factors influencing student exam scores and extract meaningful business insights using SQL queries, aggregations, and window functions.

## Business Objective

To identify key factors impacting student performance such as:
• Study hours
• Parental involvement
• Tutoring
• Family income
• Internet access
• Motivation level
• School type

The analysis aims to simulate real-world data analyst tasks including performance segmentation, ranking analysis, and percentage distribution studies.

## Dataset Information 

Dataset Name: Student Performance Factors

Rows: 6607

Columns: 20

Source: Kaggle

## Tools & Technologies Used

MySQL
Window Functions (RANK, NTILE, PERCENT_RANK)
Aggregations (SUM, AVG, COUNT)
Conditional Statements (CASE WHEN)
Subqueries
Percentage Distribution Analysis

# Key Analysis Performed

1. Performance Distribution
Average score by parental involvement
Score comparison by tutoring status
Performance by school type

2. Ranking & Segmentation
Top 10% students using PERCENT_RANK
Rank students based on exam score
Identify high-performing segments

3. Percentage Distribution
Internet access percentage by income group
Motivation level distribution
School type contribution

4. Running Metrics
Running average of exam scores
Cumulative performance analysis

## Key Insights

Students with higher parental involvement tend to perform better on average.
Internet access percentage increases significantly in higher income groups.
The top 10% performing students are strongly associated with high motivation levels.
Tutoring shows a measurable positive impact on average exam scores.

## Advanced SQL Concepts Used

Window Functions (RANK, PERCENT_RANK)
Partitioning and Ordering
Percentage Contribution Calculation
Correlated Subqueries
Data Segmentation Techniques

