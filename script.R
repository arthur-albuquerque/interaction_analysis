# Install packages

if (!require("stringr")) install.packages("stringr")

# Data

nonICU_meanRR = log(0.46)
ICU_meanRR = log(0.92)

nonICU_width = log(0.81) - log(0.27)
ICU_width = log(1.39) - log(0.62)

ICU_SE = ICU_width/(2*1.96)
nonICU_SE = nonICU_width/(2*1.96)

# Difference between log relative risks
d = nonICU_meanRR - ICU_meanRR

# Standard error
SE_d = sqrt(ICU_SE^2 + nonICU_SE^2)

# P-values
# https://www.statology.org/p-value-of-z-score-r/

z_score = -d/SE_d
p_value_2_tailed = 2*pnorm(q=z_score, lower.tail=FALSE) 


# Ratio of Relative Risk

RRR = stringr::str_c(
  round(exp(d), 3), " [95% CI ", round(exp(d - 1.96*SE_d), 3),
  ", ",
  round(exp(d + 1.96*SE_d), 3),
  "]; P value = ",
  round(p_value_2_tailed,3)
)

RRR


