# 🚀 Data Warehouse & Analytics End-to-End Project

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Architecture: Medallion](https://img.shields.io/badge/Architecture-Medallion%20(Bronze%2FSilver%2FGold)-blue.svg)](#️-data-architecture)
[![Database: SQL Server](https://img.shields.io/badge/Database-SQL%20Server-red.svg)](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

Welcome to the **Data Warehouse and Analytics Project** repository! 

This project demonstrates an end-to-end data warehousing and business intelligence solution—spanning raw ingestion, cleansing, star-schema modeling, and analytical reporting. Built as a enterprise-style portfolio project, it highlights industry best practices in modern data engineering and analytics using a Medallion Architecture.

---

## 🏗️ Data Architecture

The platform architecture follows the **Medallion Architecture** pattern using **Bronze**, **Silver**, and **Gold** processing layers:


1. **Bronze Layer (Raw)**: Ingests raw source data as-is from CSV files into staging tables within Microsoft SQL Server.
2. **Silver Layer (Cleansed)**: Executes data cleansing, deduplication, standardized data typing, and structural normalization.
3. **Gold Layer (Curated)**: Transforms cleaned data into dimensional models (**Star Schema**) optimized for high-performance analytical queries and BI reporting.

---

## 📖 Project Overview & Core Scope

This project delivers solutions across the entire data lifecycle:

* **Data Architecture**: Multi-tiered pipeline design using SQL Server.
* **ETL Pipelines**: Automated extraction, transformation, and load routines linking ERP and CRM sources.
* **Data Modeling**: Designing production-grade Fact and Dimension tables (Star Schema).
* **Analytics & Reporting**: SQL-driven analytical queries for executive and operational KPIs.

### Target Skillset Demonstrated
* **Database & SQL Development:** T-SQL, Stored Procedures, CTEs, Window Functions.
* **Data Engineering & Architecture:** Medallion Layering, Ingestion Pipelines, Schema Normalization.
* **Data Modeling:** Dimensional Modeling (Star Schema, Fact & Dimension Design).
* **Business Intelligence:** Product performance analysis, customer segmentation, and revenue metrics.

---

## 🚀 Project Requirements

### 1. Data Engineering (Warehouse Ingestion & Transformation)
* **Data Sources**: Consolidated ingestion from two disparate source systems (**ERP** and **CRM**).
* **Data Quality**: Automated resolution of data anomalies, missing values, and formatting discrepancies in the Silver layer.
* **Unified Model**: Merging cross-system data into a single, intuitive star schema.
* **Processing Strategy**: Focus on current state processing (Historization/SCD not required for current release).
* **Data Governance**: Fully documented schema definitions, data dictionaries, and naming conventions.

### 2. Analytics & Business Intelligence
Deliver T-SQL scripts and reporting structures focusing on three key business domain metrics:
* **Customer Behavior**: Segmentation, acquisition patterns, and order history analysis.
* **Product Performance**: Revenue drivers, category volume distribution, and item margins.
* **Sales Trends**: Time-series revenue, period-over-period growth, and channel distribution.

---

## 🛠️ Stack & Essential Tools

* **Database Engine:** [Microsoft SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
* **Database Management:** [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
* **Diagramming & Architecture:** [Draw.io](https://www.drawio.com/)
* **Version Control:** [Git & GitHub](https://github.com/)
* **Project Documentation:** [Notion Project Blueprint](https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4)

---

## 📂 Repository Structure

```text
data-warehouse-project/
│
├── datasets/                   # Raw ERP and CRM source datasets (CSV format)
│
├── docs/                       # Project documentation & architectural blueprints
│   ├── etl.drawio              # Visual execution plan for ETL transformations
│   ├── data_architecture.drawio# System architecture schematic
│   ├── data_catalog.md         # Data dictionary, field specifications & metadata
│   ├── data_flow.drawio        # End-to-end data flow lineage diagram
│   ├── data_models.drawio      # Entity-Relationship & Star Schema diagrams
│   └── naming-conventions.md   # Standardized SQL object naming guidelines
│
├── scripts/                    # SQL transformation & pipeline logic
│   ├── bronze/                 # DDL & Bulk Ingestion scripts (Raw layer)
│   ├── silver/                 # Data cleansing & transformation scripts
│   └── gold/                   # Analytical star schema creation & views
│
├── tests/                      # Automated data validation & quality check scripts
│
├── README.md                   # Primary repository documentation
├── LICENSE                     # MIT License specifications
├── .gitignore                  # Git tracking exclusion rules
└── requirements.txt            # System dependencies & environment specs
