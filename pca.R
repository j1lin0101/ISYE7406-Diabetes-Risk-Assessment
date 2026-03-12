diabetes <- read.table(file = "data/diabetes.csv", sep = ",", header=T)

diabetes$family_history_diabetes <- as.integer(diabetes$family_history_diabetes)