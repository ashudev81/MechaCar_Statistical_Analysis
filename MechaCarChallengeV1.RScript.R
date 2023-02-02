library(dplyr)

mpg_data <- read.csv("MechaCar_mpg.csv") #import the csv database 

lm( mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_data) # generate multiple linear regression model
summary(lm( mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_data)) # generate summary statistics


coil_data <- read.csv("Suspension_Coil.csv") # import csv data
coil_data # check the data
total_summary <- summarise(coil_data, Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI)) # prepare the summary
lot_grouping <- group_by(coil_data, Manufacturing_Lot) # create data with lot group
lot_summary <- summarise(lot_grouping, Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI)) # prepare the summary by lot group

# t.test(coil_data$PSI, mu = mean(coil_data$PSI)) # check the mean value accross the all lots
t.test(coil_data$PSI, mu = 1500) # check the mean value accross the all lots

coil_lot1 <- subset(coil_data, coil_data$Manufacturing_Lot == "Lot1") # filter by lot1
t.test(coil_lot1$PSI, coil_data$PSI)
t.test(coil_lot1$PSI, mu=1500)

coil_lot2 <- subset(coil_data, coil_data$Manufacturing_Lot == "Lot2") # filter by lot1
t.test(coil_lot2$PSI, coil_data$PSI)
t.test(coil_lot2$PSI, mu=1500)

coil_lot3 <- subset(coil_data, coil_data$Manufacturing_Lot == "Lot3") # filter by lot1
t.test(coil_lot3$PSI, coil_data$PSI)
t.test(coil_lot3$PSI, mu=1500)


# t.test(PSI ~, data = coil_data, subset = Manufacturing_Lot %in% "Lot1")
#t.test(subset(coil_data, coil_lot1$PSI, coil_data$PSI)

t.test(PSI ~ 1, coil_data, subset = Manufacturing_Lot %in% c('Lot1', 'Lot2', 'Lot3'))

t.test(PSI ~ 1, coil_data, subset = Manufacturing_Lot %in% c('Lot1'), mu= 1500)

t.test(PSI ~ 1, coil_data, subset = Manufacturing_Lot %in% c('Lot2'), mu= 1500)

t.test(PSI ~ 1, coil_data, subset = Manufacturing_Lot %in% c('Lot3'), mu= 1500)

t.test(PSI ~ 1, coil_data)

t.test(coil_data$PSI, data=coil_data, Manufacturing_Lot=lot1)





