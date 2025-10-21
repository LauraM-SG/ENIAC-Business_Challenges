# ENIAC-Business_Challenges

## Project Overview

This repository presents two independent business challenges faced by Eniac, an online marketplace specializing in Apple-compatible accessories. Each challenge represents a separate analytical problem to be explored using different data sources and tools.

The goal is to analyze each situation, use data-driven methods to generate insights, and deliver recommendations that could guide Eniac’s strategic decisions.

---

# Challenge 1 — _Expansion to the Brazilian Market_

## Background

Eniac’s board of directors has mandated an expansion into Brazil within the next year. However, the company lacks experience and market knowledge in the region. To accelerate the process, Eniac is considering partnering with Magist, a Brazilian Software-as-a-Service (SaaS) company that connects small and medium-sized stores to Brazil’s biggest online marketplaces through a centralized order management system.

Currently, Eniac sells in Europe through its own e-commerce store and manages its own supply chain. In Brazil, partnering with Magist would serve as an intermediate step — helping Eniac test the market, build brand awareness, and explore the potential for setting up its own operations later.

## The Problem

Although economic terms are under discussion, some executives question whether Magist is a suitable partner:

* Eniac’s catalog consists entirely of high-end tech accessories, heavily focused on Apple-compatible products. Is Magist’s platform aligned with this market segment?
* Fast delivery is a cornerstone of Eniac’s customer experience. Magist’s logistics rely on Brazil’s public Post Office — cost-effective, but possibly too slow

## Task

You’ve been granted access to a snapshot of Magist’s database. Using MySQL, analyze the data to help Eniac’s leadership answer key business questions (questionnare is in the challenge_1 folder)

At the end of this challenge, you’ll prepare a recommendation for Eniac’s leadership: Should Eniac proceed with Magist as a partner for its Brazilian expansion?

Tools & Deliverables

* **Technology:** MySQL
* **Files:**
  - sql/challenge1_queries.sql — all analysis queries
  - reports/challenge1_summary.md — summary of findings and business recommendation
 
---

# Challenge 2: _Evaluating Product Discounts_

## Background

Independent of its market expansion plans, Eniac’s leadership wants to review its discounting strategy. There’s an internal debate about whether applying discounts actually boosts profitability or simply erodes margins without increasing long-term sales.

A separate dataset containing product and sales information has been provided. However, this dataset has inconsistencies and corrupted values that must be cleaned before analysis can begin.

## Task

Perform a data cleaning and analysis project using Python to determine whether discounting products benefits Eniac’s overall business performance.

**Part 1 — Data Quality Assessment & Cleaning**

* Identify and document data issues (missing values, duplicates, inconsistent prices, incorrect formats, etc.).
* Implement cleaning rules to repair or remove corrupted entries.
* Produce a data quality report summarizing all detected issues and applied corrections.

**Part 2 — Discount Impact Analysis**

* Investigate the relationship between discounts, sales volume, and profitability.
* Identify which product categories benefit from discounts and which do not.
* Recommend an optimal pricing and discounting strategy for Eniac.

## Tools & Deliverables

**Technology:** Python (pandas, numpy, matplotlib)

**Files:**
 - notebooks/01_data_audit.ipynb — assess data quality
 - notebooks/02_cleaning_pipeline.ipynb — clean the dataset
 - notebooks/03_discount_analysis.ipynb — analyze discount effects
 - reports/challenge2_summary.md — summarize findings and recommendations

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
│ ├─ magist_snapshot_sample.sql
│ ├─ sales_discounts_dataset.csv
│ └─ README.md
├─ sql/
│ ├─ schema.sql
│ ├─ challenge1_queries.sql
│ └─ utils.sql
├─ notebooks/
│ ├─ 01_data_audit.ipynb
│ ├─ 02_cleaning_pipeline.ipynb
│ └─ 03_discount_analysis.ipynb
├─ reports/
│ ├─ challenge1_summary.md
│ ├─ challenge2_summary.md
│ └─ executive_summary.md
├─ src/
│ ├─ db_utils.py
│ └─ cleaning.py
├─ requirements.txt
└─ README.md
```


