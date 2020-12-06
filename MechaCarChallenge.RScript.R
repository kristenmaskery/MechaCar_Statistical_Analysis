library(dplyr)

#Deliverable 1 

#Read in CSV File 
MechaCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
MechaCar
#Perform Linear Regression Model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data= MechaCar)
#Determine p-value and r-squared value 
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data= MechaCar))

#Deliverable 2
#Read in CSV File 
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
Suspension_Coil
#Create a total summary Data Frame 
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD=sd(PSI))
#Create a lot summary 
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD=sd(PSI))

#Deliverable 3 
#Perform a t-test across all lots
t.test(Suspension_Coil$PSI,mu=1500)
#Perform a t-test on each lot
#Lot 1 
t.test(subset(Suspension_Coil,Manufacturing_Lot=="Lot1")$PSI, mu=1500)
#Lot 2 
t.test(subset(Suspension_Coil,Manufacturing_Lot=="Lot2")$PSI,mu=1500)
#Lot 3
t.test(subset(Suspension_Coil,Manufacturing_Lot=="Lot3")$PSI,mu=1500)
