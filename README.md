# Netflix Movies and TV showes Data Analysis using SQL
![Netflix Logo](https://github.com/flamekaiser007/netflix_sql_project/blob/main/logo.png)

## Objective
The objective of this project is to perform exploratory data analysis (EDA) on the Netflix dataset using SQL. It aims to extract meaningful insights about global content trends, genre distribution, release patterns, and actor appearances. The analysis includes data cleaning, content categorization, and aggregation using advanced SQL queries such as window functions, CASE statements, and string operations. This project serves as a portfolio demonstration of SQL proficiency for real-world data analytics.

## 🧰 Tools & Technologies
MySQL (Workbench or CLI)

SQL (Window functions, CASE, GROUP BY, string operations)

CSV Dataset (Cleaned from original Netflix titles dataset)

Data Source: netflix_titles.csv (cleaned)

## 🗂 Dataset Overview
The dataset contains metadata about TV Shows and Movies available on Netflix as of 2021. It includes:

Show ID, Type (Movie/TV Show), Title

Cast and Director

Country, Date Added, Release Year

Rating, Duration

Genres (listed_in), Description

## 📊 Key SQL Analyses Performed
✅ Total number of titles on Netflix

✅ Count of Movies vs. TV Shows

✅ Most common content ratings by type

✅ Most active countries producing Netflix content

✅ Top genres using string splitting and aggregation

✅ Year-wise release trend analysis (last 5 years)

✅ Most frequent actors in Indian content

✅ Categorization of content based on violent descriptions

✅ Use of RANK(), CASE, UNNEST (PostgreSQL) / SUBSTRING_INDEX (MySQL workaround)

