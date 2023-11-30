library(titanic)
head(titanic_train)

##Clean data -> Remove NA
titanic_train <- na.omit(titanic_train)

##Sampling
set.seed(50)n <- nrow(titanic_train)id <- sample(n, size=n*0.8) #Train 80% & Test 20%
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]

##Train Model
train_model <- glm (Survived ~ Sex + Age, data = train_data, family = "binomial")
train_data$prob_survived <- predict(train_model, type = "response")
train_data$pred_survived <- ifelse(train_data$prob_survived >= 0.6,1,0) #Threshold 0.6

##Test Model
test_data$prob_survived <- predict(train_model, newdata = test_data, type = "response")
test_data$pred_survived <- ifelse(test_data$prob_survived >=0.6,1,0) #Threshold 0.6

##Confusion Matrix Train Data
con_train <- table(train_data$pred_survived,        
						train_data$Survived,                   
						dnn = c("Predicted","Actual"))

##Confusion Matrix Test Data
con_test <- table(test_data$pred_survived,                  
						test_data$Survived,                  
						dnn = c("Predicted","Actual"))

##Train Model Evaluate
#Accuracy
train_acc <- (con_train[1,1]+con_train[2,2]) / sum(con_train)cat("Accuracy:", train_acc)
#Precision
train_prec <- con_train[1,1] / (con_train[1,1] + con_train[1,2])cat("Precision:", train_prec)
#Recall
train_rec <- con_train[1,1] / (con_train[1,1] + con_train[2,1])cat("Recall:",train_rec)
#F1
train_f1 <- 2*((train_prec*train_rec)/(train_prec+train_rec))cat("F1:",train_f1)

##Test Model Evaluate
#Accuracy
test_acc <- (con_test[1,1]+con_test[2,2]) / sum(con_test)cat("Accuracy:", test_acc)
#Precision
test_prec <- con_test[1,1] / (con_test[1,1] + con_test[1,2])cat("Precision:", test_prec)
#Recall
test_rec <- con_test[1,1] / (con_test[1,1] + con_test[2,1])cat("Recall:",test_rec)
#F1
test_f1 <- 2*((test_prec*test_rec)/(test_prec+test_rec))cat("F1:",test_f1)

cat("% that test data predict correctly:",mean(test_data$Survived == test_data$pred_survived))
