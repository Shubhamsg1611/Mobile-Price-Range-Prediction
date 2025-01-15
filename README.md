# Mobile-Price-Range-Prediction
## Overview:
This project aims to predict the price range of mobile phones based on various features such as RAM, battery power, and other technical specifications. This project aims to predict the price range of mobile phones based on various features such as RAM, battery power, and other technical specifications. The model utilizes a Random Forest classifier to categorize mobile phones into four price categories: Low, Medium, High, and VeryHigh. The dataset contains information about 20 different features, including hardware specifications, to help classify the price range.

## Dataset:
Dataset
The dataset used for this project is titled MobilePriceRange.csv, and contains the following columns:

- BatteryPower: Battery power of the mobile phone.
- Blue: Bluetooth availability (0 or 1).
- ClockSpeed: Speed of the mobile's processor.
- DualSim: Dual SIM availability (0 or 1).
- FC: Front camera mega pixels.
- IntMemory: Internal memory of the mobile phone in MB.
- MWeight: Mobile weight.
- NFC: Near Field Communication (0 or 1).
- PC: Primary camera mega pixels.
- RAM: RAM in MB.
- TalkTime: Battery talk time in hours.
- TouchScreen: Whether the mobile has a touchscreen (0 or 1).
- PriceRange: The target variable representing the mobile's price range, categorized as:
i) Low (0)
ii) Medium (1)
iii) High (2)
iv) VeryHigh (3)

## Packages:

```
# You can install these packages using the following R commands:

install.packages("tidyverse")
install.packages("caret")
install.packages("e1071")
install.packages("randomForest")
install.packages("ggplot2")
install.packages("corrplot")
```

## Data Visualization:
- Battery Power vs Ram
- Correlation Heatmap
- Distribution of Price Range
- Dual Sim Phones
- Feature Importance
- Pair Plot
- Ram Distribution

## Model Training:

The model is trained using the Random Forest algorithm. The following steps are followed in the script:

- Data Cleaning: Handling missing values and checking the structure of the data.
- Exploratory Data Analysis (EDA): Visualizing relationships between variables using graphs such as scatter plots, bar plots, and correlation matrices.
- Data Splitting: Dividing the dataset into training (80%) and testing (20%) sets.
- Random Forest Model: Training the Random Forest model on the training data using the randomForest function.
= Hyperparameter Tuning: Optimizing the model by tuning the mtry hyperparameter (number of features to consider when splitting nodes).
- Model Evaluation: Using a confusion matrix to assess the performance of the model.

## Model Results:

After tuning the model, the final Random Forest model achieved an accuracy of 87% with the following performance metrics:

- Accuracy: 87%
- Kappa: 0.8267 (indicating a high level of agreement beyond chance)
- Class-wise Performance: Sensitivity and Specificity were high for all price range classes (Low, Medium, High, VeryHigh).

## Conclusion:

The Mobile Price Range Prediction project successfully demonstrates the application of data preprocessing, feature engineering, and machine learning to classify mobile devices into predefined price ranges. Using a Random Forest classifier, we achieved a high accuracy of 87% on the test dataset.




