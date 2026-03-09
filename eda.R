# Call dataset
diabetes_raw <- read.table(file = "data/diabetes_raw.csv", sep = ",", header=T)

# Check if any null values
rows_with_na <- diabetes_raw[!complete.cases(diabetes_raw), ]
# No null values
print(rows_with_na)

# Edit gender column
# Male = 0, Female = 1
diabetes$gender <- as.integer(ifelse(diabetes$gender == "Female", 1, 0))

# Edit physical activity column
# Low = 0, Moderate = 1, High = 2
diabetes$physical_activity_level <- as.integer(ifelse(
  diabetes$physical_activity_level == "Low", 0,
  ifelse(diabetes$physical_activity_level == "Moderate", 1, 2)
))

# Edit family history 
# Yes = TRUE, No = FALSE
diabetes$family_history_diabetes <- diabetes$family_history_diabetes == "Yes"

# Edit risk category
# Low Risk = 0, Prediabetes = 1, High Risk = 2
diabetes$diabetes_risk_category <- as.integer(ifelse(
  diabetes$diabetes_risk_category == "Low Risk", 0,
  ifelse(diabetes$diabetes_risk_category == "Prediabetes", 1, 2)
))

# Remove patient id column
diabetes <- diabetes[,-1]

write.csv(diabetes, file = "data/diabetes.csv", row.names = FALSE)

