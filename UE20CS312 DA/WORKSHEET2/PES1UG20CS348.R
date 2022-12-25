library(tidyverse)
library(corrplot)
library(olsrr)

df <- read_csv('spotify.csv')

##Problem 1

#checking for null values
sum(is.na(df))
#data normalization

min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}
df_norm <- as.data.frame(lapply(df, min_max_norm))

##Problem 2
model <- lm(energy~key+danceability+loudness+mode+speechiness+
acousticness+instrumentalness+liveness+valence+tempo+duration_ms
+time_signature ,data = df_norm)

model
summary(model)


##Problem 3
df_cor <- cor(df_norm)
corrplot(df_cor, order = "hclust", method = "number")
plot(df_norm)
#energy has significant positive correlation with loudness, valence and tempo
#energy has significant negative correlation with acousticness, instrumentalness
#these variables are significant in the model

model_cor <- lm(energy~loudness+acousticness+valence+tempo+instrumentalness, data=df_norm)
summary(model_cor)

##Problem 4
anova(model_cor, model)
#Null hypothesis: simpler model is better
#Alternate hypothesis: Complex model is better
#As p value is very small, we reject null hypothesis and conclude that the more complex model is better than
#the model with selected variables

##Problem 5
model_ols <- lm(energy ~ ., data = df_norm)
k <- ols_step_forward_aic(model_ols, progress = TRUE, details = FALSE)

##Problem 6
plot(fitted(model), resid(model))
plot(fitted(model_cor), resid(model_cor))
plot(fitted(model_ols), resid(model_ols))

