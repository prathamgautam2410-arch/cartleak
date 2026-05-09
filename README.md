# CartLeak — E-Commerce Funnel Drop-Off Analysis

> Identifying where and why users abandon the purchase journey using 42M behavioural events from a real e-commerce platform.

---

## Project Overview

This project analyses the October 2019 e-commerce events dataset from [REES46](https://www.kaggle.com/datasets/mkechinov/ecommerce-behavior-data-from-multi-category-store) to understand funnel drop-off across three stages: **view → cart → purchase**.

Only **1 in 9 users** who view a product ever buy it. This project finds out why — and where the biggest opportunities to fix it are.

---

## Key Findings

| Stage    | Users     | Conversion Rate | Drop-Off |
|----------|-----------|-----------------|----------|
| View     | ~301,710  | 100%            | —        |
| Cart     | ~33,772   | 11.19%          | 88.81%   |
| Purchase | ~34,792   | 11.53%          | 88.47%   |

- **Electronics & smartphones** drive the most traffic and convert at **3.21%** — 6x the store average
- **Apparel.shoes** received 75,000+ views but recorded **zero cart additions** — likely a broken tracking event
- Purchase activity peaks **18:00–21:00**; cart abandonment is highest **10:00–14:00**

---

## Tools Used

| Tool     | Purpose                              |
|----------|--------------------------------------|
| SQLite   | Database storage and querying        |
| DBeaver  | SQL editor and database management   |
| Python   | Data analysis and chart generation   |
| pandas   | Data manipulation                    |
| Plotly   | Funnel chart and line chart          |
| seaborn  | Heatmap visualisation                |
| Power BI | Interactive dashboard                |
| reportlab| PDF report generation                |

---

## Repository Structure

```
cartleak/
├── queries/
│   └── queries.sql          # All 3 SQL queries with comments
├── analysis/
│   └── cartleak_analysis_v2.ipynb  # Python analysis notebook
├── dashboard/
│   └── CartLeak_Dashboard.pbix     # Power BI dashboard
├── reports/
│   └── CartLeak_Report.pdf         # Final PDF report
└── data/
    └── raw/
        ├── cartleak_funnel.csv
        ├── cartleak_category.csv
        └── cartleak_hourly.csv
```

---

## How to Run

1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/mkechinov/ecommerce-behavior-data-from-multi-category-store)
2. Import into SQLite using DBeaver
3. Run `queries/queries.sql` to reproduce the analysis
4. Open `analysis/cartleak_analysis_v2.ipynb` in Jupyter to generate charts
5. Open `dashboard/CartLeak_Dashboard.pbix` in Power BI Desktop

---

## Recommendations

1. **Simplify checkout** — reduce to 3 steps max and enable guest checkout to cut the 88.5% drop-off
2. **Fix shoes tracking** — zero cart additions on 75K views signals a broken event or untracked flow
3. **Double down on smartphones** — highest traffic + highest conversion = best ROI for ad spend
4. **Target evening users** — retarget abandoned carts between 18:00–21:00 when intent is highest

---

## About

Built by [Pratham Gautam](https://github.com/prathamgautam2410-arch) as a portfolio project demonstrating end-to-end data analysis using SQL, Python, and Power BI.
