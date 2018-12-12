yards <- c(8.39, 7.67, 7.66, 7.98, 7.21, 7.53, 8.01, 7.66, 7.21, 7.16, 7.93, 7.10, 6.33, 6.76, 6.86, 7.35, 7.22, 7.94, 6.41, 6.77, 6.65, 6.94, 6.45, 7.04, 6.39, 6.58, 6.21, 7.17, 6.34, 6.18, 5.12, 5.71)
rating <- c(105.5, 97.4, 96.9, 96.2, 95, 93.8, 92.7, 91.4, 90.2, 89.4, 87.7, 87.5, 87, 86.4, 86.4, 86, 85.4, 84.7, 84.3, 81.7, 81, 80.3, 80.2, 80.1, 79.6, 77.1, 76, 73.7, 72.6, 71.4, 70, 66.5)

prediction_model <- data.frame(yards, rating)

model <- lm(rating ~ yards, data = prediction_model)

new_data <- data.frame(yards= 8.0)

predict.lm(model, newdata = new_data, interval = 'confidence', level = 0.95)
predict.lm(model, newdata = new_data, interval = 'prediction', level = 0.95)
