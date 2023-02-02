library(dplyr)

mpg_data <- read.csv("MechaCar_mpg.csv") #import the csv database 

lm( mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_data) # generate multiple linear regression model
summary(lm( mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_data)) # generate summary statistics


coil_data <- read.csv("Suspension_Coil.csv") # import csv data
coil_data # check the data
total_summary <- summarise(coil_data, Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI)) # prepare the summary
lot_grouping <- group_by(coil_data, Manufacturing_Lot) # create data with lot group
lot_summary <- summarise(lot_grouping, Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI)) # prepare the summary by lot group


t.test(coil_data$PSI, mu = 1500) # check the mean value accross the all lots


t.test(PSI ~ 1, coil_data, subset = Manufacturing_Lot %in% c('Lot1'), mu= 1500) # check the mean value for lot1

t.test(PSI ~ 1, coil_data, subset = Manufacturing_Lot %in% c('Lot2'), mu= 1500) # check the mean value for lot2

t.test(PSI ~ 1, coil_data, subset = Manufacturing_Lot %in% c('Lot3'), mu= 1500) # check the mean value for lot3






