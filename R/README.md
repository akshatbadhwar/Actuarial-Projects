**📊 Health Insurance Analysis**

This project explores and analyses health insurance data to uncover key factors affecting insurance charges. It focusses on **Data Visualisation, Statistical Testing and Regression Modelling** using R.

**🔍 Problem Statement**

The aim of this project is to analyse how demographic and lifestyle variables influence insurance charges.

Key features studied include:

*   **Age**
*   **BMI (Body Mass Index)**
*   **Number of Children**
*   **Region**
*   **Smoking Status**
*   **Sex**

By identifying cost drivers and relationships among these factors, insurers can gain insights for **Pricing strategies, Customer Segmentation and Risk Management**.

**🧪 Key Features**

*   **Data Cleaning and Exploration**
    *   Removed inconsistencies in categorical variables (e.g., smoker status).
    *   Identified and visualised outliers in charges.
*   **Descriptive Statistics and Visualisation**
    *   Histograms of age, BMI and charges.
    *   Boxplots comparing charges across smokers vs. non-smokers.
*   **Statistical Tests**
    *   **t-test**: Compared mean charges of smokers vs. non-smokers.
    *   **ANOVA**: Tested differences in average charges across regions.
    *   **Chi-Square Test**: Checked relationship between smoking status and gender.
*   **Correlation Analysis**
    *   Examined relationships between numerical features (age, BMI, children, charges).
*   **Regression Modelling**
    *   Built a **Multiple Linear Regression model** with predictors: Age, BMI, Children, Smoker, Sex and Region.
    *   Conducted diagnostic checks (residuals, leverage, normality).

**📈 Insights**

*   **Smokers pay significantly higher insurance charges** compared to non-smokers.
*   **Regional differences** exist in average charges, especially between Southeast and Northwest.
*   **Smoking and gender are statistically related**.
*   **Age, BMI, and smoking status** are the strongest predictors of charges in the regression model.