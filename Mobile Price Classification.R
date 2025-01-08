library(tidyverse)
library(caret)
library(e1071)
library(randomForest)
library(corrplot)


# Load dataset
data <- read.csv("C:/Users/shubh/OneDrive/Documents/MobilePriceRange.csv")


# Quick data inspection
str(data)
summary(data)

# Data Cleaning
sum(is.na(data))

# Correlation plot
cor_data <- cor(data %>% select_if(is.numeric))
library(ggcorrplot)
ggcorrplot(cor_data, lab = TRUE)

# Visualize relationships
ggplot(data, aes(x = RAM, y = PriceRange, color = factor(PriceRange))) +
  geom_point()

# Distribution of Target Variable
ggplot(data, aes(x = PriceRange, fill = PriceRange)) +
  geom_bar() +
  labs(title = "Distribution of Price Range", x = "Price Range", y = "Count") +
  theme_minimal()

# Numeric Feature Distributions
ggplot(data, aes(x = RAM)) +
  geom_histogram(binwidth = 200, fill = "black", color = "white") +
  labs(title = "RAM Distribution", x = "RAM (in MB)", y = "Frequency") +
  theme_minimal()

# Correlation Heatmap
cor_data <- cor(data %>% select_if(is.numeric))
corrplot(cor_data, method = "color", type = "upper", tl.cex = 0.7, title = "Correlation Heatmap")

# Scatter Plots
ggplot(data, aes(x = BatteryPower, y = RAM, color = PriceRange)) +
  geom_point(alpha = 0.7) +
  labs(title = "Battery Power vs RAM by Price Range", x = "Battery Power", y = "RAM") +
  theme_minimal()

# Box Plot 
ggplot(data, aes(x = PriceRange, y = RAM, fill = PriceRange)) +
  geom_boxplot() +
  labs(title = "RAM Distribution by Price Range", x = "Price Range", y = "RAM") +
  theme_minimal()

# Bar Charts for Categorical Variables
ggplot(data, aes(x = factor(DualSim), fill = PriceRange)) +
  geom_bar(position = "dodge") +
  labs(title = "Dual SIM Phones by Price Range", x = "Dual SIM (0 = No, 1 = Yes)", y = "Count") +
  theme_minimal()

# Pair Plot 
library(GGally)
ggpairs(data, columns = c("RAM", "BatteryPower", "PxHeight", "PxWeight", "PriceRange"),
        aes(color = PriceRange, alpha = 0.5)) +
  theme_minimal()

# Facet Grid
ggplot(data, aes(x = RAM, fill = PriceRange)) +
  geom_histogram(binwidth = 200) +
  facet_wrap(~ PriceRange) +
  labs(title = "RAM Distribution by Price Range", x = "RAM", y = "Frequency") +
  theme_minimal()

data$PriceRange <- as.factor(data$PriceRange)
set.seed(123)  # For reproducibility
trainIndex <- createDataPartition(data$PriceRange, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Train Random Forest model
rf_model <- randomForest(PriceRange ~ ., data = trainData, ntree = 100)

# Check model performance
rf_pred <- predict(rf_model, testData)
confusionMatrix(rf_pred, testData$PriceRange)

tuneGrid <- expand.grid(.mtry = c(2, 4, 6))
tunedModel <- train(PriceRange ~ ., data = trainData, method = "rf", tuneGrid = tuneGrid)
print(tunedModel)

varImp <- varImpPlot(rf_model, main = "Feature Importance", n.var = 10)