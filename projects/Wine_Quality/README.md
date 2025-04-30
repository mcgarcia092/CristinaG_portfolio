# 🍷 Wine Quality Prediction – Linear Regression Model

## 📌 Overview
This project aims to predict wine quality using multiple linear regression based on physicochemical attributes. The dataset includes measurements such as acidity, sugar content, and alcohol percentage, with the goal of identifying how these factors influence wine quality ratings.

---

## 📂 Dataset

- **Source:** UCI Machine Learning Repository – Wine Quality Data Set  
- **Features:** 11 physicochemical variables (e.g., pH, sulphates, citric acid, residual sugar, alcohol, etc.)  
- **Target:** Wine quality score (integer value from 0 to 10)

---

## 🎯 Objective

To develop a multiple linear regression model that predicts wine quality based on the given features and evaluates which factors most significantly impact the quality score.

---

## ⚙️ Methodology

1. **Data Preprocessing**
   - Checked for missing values
   - Normalized feature scales
   - Split data into training (80%) and testing (20%) sets

2. **Modeling**
   - Applied `LinearRegression()` from `sklearn.linear_model`
   - Evaluated using R² and RMSE on both training and testing sets

3. **Feature Analysis**
   - Identified the variable with the highest predictive power
   - Alcohol content emerged as the most positively correlated factor

---

## 📊 Results

- **Highest Coefficient Feature:** `Alcohol`  
- **Model Performance:**
  - **Training Set RMSE:** _[0.6525]_  
  - **Testing Set RMSE:** _[0.6201]_  
  - **R² Score:** _[0.3284]_  

> The model performed slightly better on the testing set, indicating good generalization and minimal overfitting.

---

## 📎 Key Takeaways

- Alcohol content is the strongest predictor of wine quality in this dataset.
- Linear regression provides interpretable coefficients to understand feature impact.

---

## 🛠️ Tools & Libraries

- Python  
- Pandas  
- Scikit-learn  
- Matplotlib / Seaborn
- NumPy

---

## 📘 Notebook Preview (via nbviewer)

👉 [View Notebook on nbviewer](https://nbviewer.org/github/mcgarcia092/CristinaG_portfolio/projects/Wine_Quality/Module3_Exercise_Wine_Quality.ipynb)



