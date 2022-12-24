########### Part 1
############# a)
setwd("/Users/fanfan/Documents/2022fallB/GBA436R/Assignment1")
dt = read.csv("Homework 1 Data - 436R.csv", header=TRUE, sep=",")

############# b)
head(dt, 10)

############# c)
treatmentDate = dt[dt$isTreatmentPeriod == 1, ]$date
earliestDate = sort(treatmentDate, decreasing = F)[1]
earliestDate

############# d)

treatmentGroup = dt[dt$isTreatmentGroup == 1, ]
fitTreat = lm(log(revenue)~isTreatmentPeriod, data = treatmentGroup)
summary(fitTreat)

############# e)

controlGroup = dt[dt$isTreatmentPeriod == 0, ]
fitControl = lm(log(revenue)~isTreatmentGroup, data = controlGroup)
summary(fitControl)

############ f)

treatmentPeriod = dt[dt$isTreatmentPeriod == 1, ]
fitDMA = lm(log(revenue)~isTreatmentGroup, data = treatmentPeriod)
summary(fitDMA)

########### Part 2
############# a)
#Because the varibale is binary, the slope here means the difference of revenue in two different groups. And the difference doesn't equal to 0 at 5% level, which means significant difference between pre-treatment and treatment group. 