# ENIAC-Business_Challenges

# Project Overview

This repository presents **two independent business challenges** faced by **Eniac**, an online marketplace specializing in Apple-compatible accessories.
Each challenge represents a distinct analytical problem to be explored using different data sources and tools.

The goal is to analyze each situation using **data-driven methods**, uncover insights, and deliver recommendations that can guide Eniac’s strategic decision-making.

---

# Challenge 1 — Should Eniac Partner with Magist for Its Brazilian Expansion?

## Background

Eniac’s board of directors has mandated an expansion into **Brazil** within the next year. However, the company lacks the necessary **market knowledge** and local supply chain to operate effectively in this region.

To accelerate the process, Eniac is considering a partnership with **Magist**, a Brazilian Software-as-a-Service (SaaS) platform that connects small and medium-sized retailers to Brazil’s largest online marketplaces through a centralized order management system.

Currently, Eniac sells exclusively in Europe via its own e-commerce platform and manages its own logistics network. Partnering with Magist would act as an **intermediate step** — allowing Eniac to test the Brazilian market, build brand awareness, and later decide whether to establish its own infrastructure locally.

## Concerns
Although the financial aspects of the partnership are being discussed, some executives remain unconvinced that Magist is the right partner. Their main concerns include:

* **Product Fit** – Eniac’s catalog focuses exclusively on high-end Apple-compatible tech accessories. _**Is Magist’s platform well-suited to distribute such premium products?**_
* **Delivery Performance** – Eniac’s brand reputation relies heavily on fast deliveries. Magist’s logistics network depends on Brazil’s public Post Office — cost-effective but potentially slow. _**Can Magist maintain Eniac’s service standards?**_

## Task

Magist has granted access to a snapshot of its database.
Your mission is to analyze this data and provide Eniac’s leadership with clear, evidence-based answers to key business questions.

At the end of this challenge, you should be able to recommend whether Eniac should move forward with Magist as a partner for its Brazilian expansion.


---

# Challenge 2: _Is it feasible for Eniac to continue offering product discounts?_

## Background

Independent of its expansion plans, Eniac’s leadership wants to evaluate its **discounting strategy**.
There is an ongoing debate about whether product discounts genuinely drive profitability or if they simply reduce margins without long-term sales benefits.

A dataset containing Eniac’s product, order, and sales information has been provided. However, the data **includes several inconsistencies and corrupted values**.

Your goal is to assess the financial impact of discounts and provide actionable insights.

## Task

**1. Data Quality Assessment & Cleaning**
  
  * Identify and document data issues (missing values, duplicates, inconsistent prices, incorrect formats, etc.).
  * Apply cleaning rules to repair or remove corrupted entries.
  * Generate cleaned DataFrames ready for analysis.
    
**2. Discount Impact Analysis**
  
  * Explore the relationship between discounts, sales volume, and profitability.
  * Identify which product categories respond positively to discounts and which do not.
  * Recommend an optimized pricing and discounting strategy for Eniac’s leadership.

---

# Workflow Overview

## Challenge 1
* **Objective:** Solve the queries raised by Eniac’s board and summarize insights into a concise recommendation.
* **Output:** `solved_queries.sql` and `challenge1_report.md`
* **Tech Stack:** MySQL

## Challenge 2
* **Objective:** Clean and analyze Eniac’s sales data to determine the impact of discounts.
* **Output:** Cleaned datasets and visual analysis notebooks.
* **Tech Stack:** Python (pandas, numpy, matplotlib, seaborn)

---

# Learning Goals

By completing this repository, you will learn to:

* Apply SQL for market analysis and partner evaluation.
* Use Python for real-world data cleaning and exploratory analysis.
* Translate data findings into actionable business recommendations.
* Structure and document analytical projects for professional delivery.

----
 
# Repository Structure
```
eniac-business-challenges/
├─ data/
│ ├─challenge1/
│ | |- magist_snapshot_sample.sql
│ | |- magist_schema.pdf
│ | |- queries.pdf
│ | |- solved_queries.sql
│ | |- challenge_1_report.pdf
│ ├─challenge2/
│ | |- eniac_orders.csv
│ | |- eniac_orderlines.csv
│ | |- eniac_products.csv
│ | |- eniac_brands.csv
├─ notebooks/
│ ├─ clean_dataframes.ipynb
│ ├─ analysis.ipynb
├─ requirements.txt
└─ README.md
```
---

# Final Deliverables

Challenge 1: Recommendation on whether Eniac should proceed with Magist as a partner for its Brazilian expansion.

Challenge 2: A cleaned dataset, data quality report, and a final recommendation on the future of Eniac’s discounting strategy.



🧠 Explore Freely: This repository is designed as a learning sandbox.
Use the provided data and guidance as a starting point — adapt, question, and expand your analysis. Your unique insights are the real value here.
