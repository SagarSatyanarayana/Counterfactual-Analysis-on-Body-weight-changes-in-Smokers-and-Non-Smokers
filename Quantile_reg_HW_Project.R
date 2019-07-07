quant_data=read.table("C:/Users/sagar/R_working_directory/Quantile_regression_homework/swd.txt", sep=",",header=T)

#install.packages("quantreg")
library(quantreg)
library(xts)

attach(quant_data)

# splitting into ppl who kept smoking (train_obs) and ppl who quit smoking(test_obs)
train_obs = quant_data[quant_data$Quit %in% 0,]

test_obs = quant_data[quant_data$Quit %in% 1,]

# .1 quantile
change_10=rq(Change~Quit+Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = quant_data , tau =0.1);
summary(change_10)


# .5 quantile
change_50=rq(Change~Quit+Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = quant_data, tau =0.5);
summary(change_50)



#.9 quantile
change_90=rq(Change~Quit+Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = quant_data, tau =0.9);
summary(change_90)


#annova
anova(change_10, change_50, change_90 )



fit_cf_all = rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = train_obs, tau=seq(0.05, 0.95, by = 0.05))

predict_cf = predict.rq(fit_cf_all, newdata = test_obs)

#cdf
cf_plot = ecdf(predict_cf)
keep_smoking = ecdf(train_obs[, "Change"])
quit_smoking = ecdf(test_obs[, "Change"])



plot(keep_smoking, main= "Cumulative distribution function for change", xlab = "Change", ylab = "Cummulative Probability")
lines(quit_smoking, type = "n'", lwd = 0.5)
lines(cf_plot)
legend("topright", c("Kept smoking", "quit smoking", "TestFit"), lty = (1:3))


#To predict at 0.1,05 and .9

change_all_10 = rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = train_obs, tau = 0.1)
change_all_50 = rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = train_obs, tau = 0.5)
change_all_90 = rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = train_obs, tau = 0.9)
change_10_train=rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = train_obs , tau =0.1)
change_50_train=rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = train_obs , tau =0.5)
change_90_train=rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = train_obs , tau =0.9)
change_10_test=rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = test_obs , tau =0.1)
change_50_test=rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = test_obs , tau =0.5)
change_90_test=rq(Change~Activity+Age+Education+Exercise+PerDay+Sex+YearsSmoke, data = test_obs , tau =0.9)





predict_1_train = predict(change_10_train, data= train_obs)
predict_1_test = predict(change_10_test, data= test_obs)
predict_1_fit = predict(change_all_10, data = test_obs)


predict_5_train = predict(change_50_train, data= train_obs)
predict_5_test = predict(change_50_test, data= test_obs)
predict_5_fit = predict(change_all_50, data = test_obs)

predict_9_train = predict(change_90_train, data= train_obs)
predict_9_test = predict(change_90_test, data= test_obs)
predict_9_fit = predict(change_all_90, data = test_obs)
