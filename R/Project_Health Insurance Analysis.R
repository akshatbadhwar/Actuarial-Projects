# ===============================
# Importing the Dataset
# ===============================
insurance <- read.csv('insurance.csv')

# ===============================
# Exploratory Data Analysis (EDA)
# ===============================
str(insurance) # Structure of dataset (Data types and Columns)
summary(insurance) # Summary statistics of all variables

outliers <- boxplot.stats(insurance$charges)$out # Identifies outliers in 'Charges'
outliers
length(outliers) # Count of the number of outliers

boxplot(insurance$charges, 
        main = "Charges by Smoking Status", ylab = "Charges", 
        col = "lightgreen", horizontal = TRUE)    # Visualises outliers

# ===============================
# Descriptive Statistics and Visualisation
# ===============================
hist(insurance$age, main = 'Distribution of Ages', xlab = 'Age', col = 'yellow')

hist(insurance$bmi, main = 'Distribution of BMI', xlab = 'BMI', col = 'orange', breaks = 20)

hist(insurance$charges, main = 'Distribution of Insurance Charges', xlab = 'Charges', col = 'lightblue', breaks = 30)

boxplot(charges ~ smoker, data = insurance, col=c("lightblue","pink"))

# ===============================
# Average Charges by Smoking Status
# ===============================
insurance$smoker <- trimws(tolower(insurance$smoker)) # Cleans 'Smoker' variable
unique(insurance$smoker) # Verifies unique values

avg_charges <- tapply(insurance$charges, insurance$smoker, mean, na.rm = TRUE)
names(avg_charges) <- c("Non-Smokers", "Smokers")

barplot(avg_charges, 
        main = "Average Insurance Charges: Smokers vs Non-Smokers",
        col = c("skyblue", "salmon"),
        ylab = "Average Charges",
        xlab = "Smoking Status")

# ===============================
# Hypothesis Testing (Test 1: t-test)
# ===============================
# H₀: Average charges for Smokers = Non-smokers
# H₁: Average charges for Smokers ≠ Non-smokers

smoker_charges <- insurance$charges[insurance$smoker == "yes"]
nonsmoker_charges <- insurance$charges[insurance$smoker == "no"]
t.test(charges ~ smoker, data = insurance)

# p-value < 0.05 (H0 is rejected)
# Average charges for Smokers is not equal to that of Non-Smokers

# ===============================
# Hypothesis Testing (Test 2: ANOVA Test)
# ===============================
# H₀: Mean Premiums are equal across regions
# H₁: Mean of at least one region is different

anova_result <- aov(charges ~ region, data=insurance)
summary(anova_result)
TukeyHSD(anova_result) # Identifies mean of which regions are significantly different

# p-value < 0.05 (H0 is rejected)
# Mean of at least one region is different 

# ===============================
# Hypothesis Testing (Test 3: Chi-Square Test) 
# ===============================
# H₀: Smoking and gender are independent (no relationship)
# H₁: Smoking and gender are dependent (there is a relationship)

smoke_gender <- table(insurance$smoker, insurance$sex)
chi_result <- chisq.test(smoke_gender)
chi_result

# p-value < 0.05 (H0 is rejected)
# Smoking and gender are related

# ===============================
# Correlation Analysis
# ===============================
round(cor(insurance[c("age","bmi","children","charges")]), 2) # Shows how strongly numeric variables are related

# ===============================
# Regression Analysis and Model Diagnostics
# ===============================
model <- lm(charges ~ age + bmi + children + smoker + sex + region, data=insurance)
summary(model) # Checks coefficients and significance

# ===============================
# Diagnostic plots (Residuals, Normality, Leverage)
# ===============================
par(mfrow=c(2,2))
plot(model)
par(mfrow=c(1,1))
