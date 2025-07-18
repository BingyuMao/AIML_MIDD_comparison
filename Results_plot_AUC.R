# Install and load necessary libraries
library(tidyverse)
library(readxl)

# Read the Excel file
data <- read_excel("AUC_compare_data1.xlsx")

# Reshape the data into a long format
long_data <- data %>%
  pivot_longer(
    cols = starts_with("AUC"),
    names_to = c("Dose"),
    values_to = "AUC",
    names_pattern = "AUC for Dose = (\\d+mg)"
  ) %>%
  separate(AUC, into = c("AUC_value", "SD_value"), sep = " \\(", remove = TRUE) %>%
  mutate(
    AUC_value = as.numeric(AUC_value),
    SD_value = as.numeric(gsub("\\)", "", SD_value)),
    Dose = factor(Dose, levels = c("15mg", "30mg", "60mg")),
    Method = factor(Method, levels = c("NONMEM", "LR", "LASSO", "XGBoost"))
  )

# Plotting using ggplot2
ggplot(long_data, aes(x = Method, y = AUC_value, fill = Method)) +
  geom_boxplot() +
  facet_wrap(~ Dose, scales = "free_y") +
  labs(
    title = "AUC Comparison by Method, Dose, and Sample Size",
    x = "Method",
    y = "AUC",
    fill = "Method"
  ) +
  theme_minimal() +
  theme(
    strip.text = element_text(size = 14), 
    axis.text = element_text(size = 12),  
    axis.title = element_text(size = 14), 
    plot.title = element_text(size = 16), 
    legend.title = element_text(size = 14), 
    legend.text = element_text(size = 12)  
  ) +
  scale_fill_manual(values = c("NONMEM" = "blue", "LR" = "green", "LASSO" = "red", "XGBoost" = "purple"))
