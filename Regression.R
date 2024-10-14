# Main Script: Sales Analysis and Linear Regression
# This script analyzes the relationship between advertising costs and revenue
# using linear regression. It includes data preprocessing, visualization,
# and model creation.

# Load required libraries
library(readxl)
library(ggplot2)
library(imputeTS)
library(caTools)

# Read and preprocess the dataset
dataset <- read_xlsx('sales.xlsx')
dataset <- dataset[2:3]  # Select only columns 2 and 3

# Visualize the distribution of advertising cost and revenue
ggplot(data = dataset, aes(x = advert_cost)) +
  geom_density()
ggplot(data = dataset, aes(x = revenue)) +
  geom_density()



# Visualize the linear regression model on the testing set
ggplot() +
  geom_point(aes(x = testing_set$advert_cost, y = testing_set$revenue), color = 'black') +
  geom_line(aes(x = training_set$advert_cost, y = predict(linear_model, newdata = training_set)),
            color = 'blue') +
  ggtitle('Revenue vs Advertising Cost - Test Set') +
  xlab('Advertising Cost') +
  ylab('Revenue') +
  theme_minimal()