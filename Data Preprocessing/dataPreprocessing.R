# Data Preprocessing Template
dataset = read.csv('Data.csv')

dataset$Age = ifelse(is.na(dataset$Age),
                     mean(dataset$Age, na.rm = TRUE),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                        mean(dataset$Salar, na.rm = TRUE),
                        dataset$Salary)

dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))

set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])