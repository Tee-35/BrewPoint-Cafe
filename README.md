# BrewPoint Cafe ☕ — Member Insights & Sales Intelligence

A machine learning portfolio project built around a fictional coffee shop 
membership scheme. The project follows a full data science pipeline — from 
synthetic data generation through SQL feature engineering to four distinct 
ML models — designed to demonstrate both analytical and data science 
capability.

---

## Project Background

BrewPoint Cafe runs a membership card scheme that tracks every purchase made 
by its 100 registered members across Q1 2026. This project uses that 
transactional data to move beyond reporting what happened and start 
predicting what will happen next.

---

## Business Questions

1. **How much will a member spend on their next visit?**
2. **What type of customer is each member?**
3. **What will a member buy next?**
4. **What will revenue look like over the next 4 weeks?**

---

## Dataset

Synthetic dataset generated to reflect realistic cafe trading patterns.

| Table | Rows | Description |
|---|---|---|
| `transactions` | 8,000 | Q1 2026 member purchases |
| `members` | 100 | Loyalty card holders |
| `items` | 28 | Menu items with sale price, cost price and margin |
| `promotions` | 4 | Q1 promotional campaigns |
| `promotion_redemptions` | 607 | Members who redeemed promotions |

**Trading parameters baked into the data:**
- Monday to Friday: 07:00 — 16:00
- Saturday to Sunday: 09:00 — 14:00
- Morning peak demand for hot drinks
- Fewer transactions closer to closing time

---

## ERD — Data Structure

<img width="565" height="392" alt="erd_diagram" src="https://github.com/user-attachments/assets/cd3226e2-2a3c-4ab2-8bc7-c3eb428c00b4" />


---

## Pipeline
```
5 CSV Datasets
      ↓
SQL JOIN → ml_features.csv
      ↓
Python Feature Engineering
      ↓
┌─────────────────────────────────────┐
│                                     │
Regression  Clustering  Classification  Time Series
│                                     │
Model 1     Model 2     Model 3         Model 4
```

---

## Feature Engineering

Raw transactional data was transformed into ML-ready features including:

- Datetime decomposition — hour, day of week, month, session
- Member level aggregations — total visits, average spend, favourite category
- Recency features — days since last visit, member tenure
- Promotion flags — promo used, discount percentage
- Categorical encoding — item category, session, gender, age group

---

## Models

### Model 1 — Customer Spend Predictor
**Type:** Regression  
**Goal:** Predict how much a member will spend on their next visit  
**Models trained:** Linear Regression (baseline), Random Forest Regressor  
**Evaluation:** MAE, R²

**Key finding:** When quantity was removed from features, the model relied 
on genuine behavioural signals — day of week, hour, item category and 
average spend — each contributing roughly equally. This is a more honest 
and useful predictor than one dominated by a single feature.

---

### Model 2 — Customer Segmentation
**Type:** Clustering  
**Goal:** Group members into behavioural segments  
**Model trained:** KMeans (k=4)  
**Evaluation:** Silhouette Score, Elbow Method

| Segment | Members | Avg Visits | Avg Total Spent |
|---|---|---|---|
| High Value | 17 | 92 | £419 |
| Regular | 28 | 84 | £375 |
| Promo Driven | 25 | 75 | £332 |
| Occasional | 30 | 74 | £317 |

---

### Model 3 — Purchase Prediction
**Type:** Classification  
**Goal:** Predict what category a member will buy next  
**Models trained:** Logistic Regression (baseline), Random Forest Classifier  
**Evaluation:** Accuracy, F1 Score

| Model | Accuracy | F1 Score |
|---|---|---|
| Logistic Regression | 0.6956 | 0.6027 |
| Random Forest | 0.6094 | 0.5695 |

**Key finding:** A class imbalance was identified — Hot Drinks accounted 
for 70% of transactions, causing the model to over-predict this category. 
A balanced Random Forest was trained to address this. Future work would 
explore SMOTE oversampling to further improve minority category predictions 
for Bakery, Cold Drinks and Snacks.

---

### Model 4 — Sales Forecasting
**Type:** Time Series  
**Goal:** Forecast weekly revenue for Q2 2026  
**Models trained:** Exponential Smoothing (baseline), SARIMA  
**Evaluation:** MAE, MAPE

**Output:** 4 week Q2 2026 revenue forecast exported for business 
intelligence reporting.

---

## Dashboard

<img width="1038" height="784" alt="Screenshot 2026-03-30 at 21 30 42" src="https://github.com/user-attachments/assets/af93ced8-d05d-416b-8c72-d45c1fa3b106" />


---

## Key Takeaways

- A full end-to-end ML pipeline was built from synthetic data generation 
  through to saved models and Power BI ready exports
- Four different ML techniques were applied to the same dataset — 
  regression, clustering, classification and time series
- Model evaluation surfaced a real data science challenge — class imbalance 
  — and a corrective approach was applied and documented
- Removing an obvious feature (quantity) from the spend predictor produced 
  a more meaningful and interpretable model
- SQL was used as the feature engineering layer before Python, reflecting 
  a realistic analyst to data scientist workflow

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| SQL | Data joining and feature table creation |
| Python | Feature engineering and ML pipeline |
| pandas | Data manipulation and aggregation |
| scikit-learn | Regression, classification and clustering models |
| statsmodels | Time series forecasting |
| joblib | Model serialisation |
| Power BI | Dashboard and visualisation |

---

## Repository Structure
```
Project_2_ml/
├── data/
│   ├── datasets/        ← raw synthetic datasets
│   └── *.csv            ← model outputs for Power BI
├── models/              ← saved .pkl model files
├── notebooks/           ← one notebook per model
├── sql/                 ← SQL feature engineering query
└── README.md
```
---

## Author

Tyrelle Newton  
