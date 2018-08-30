install.packages("ggplot2")
install.packages("dplyr")
install.packages("gridExtra")

library(ggplot2)
library(dplyr)
library(gridExtra)

setwd("/Users/yeoyoung/desktop/2018 NIMS/project")

#loading data
df1<-read.csv("d1-n-data.csv", header=T)
df2<-read.csv("d1-r-data.csv", header=T)
sec<-read.csv("시간 초단위 환산.csv",header=T)
df2_1<-read.csv('obd-unitless-normaldata_KNAB3511BHT069260.csv',header=T)
speed0<-read.csv("zero_time_result_v2.csv",header=T)
data2<-read.csv('obd-unitless-normaldata_KNAB3511BHT069260.csv',header=T)



#speed=0 / visualization
ps0<-ggplot(speed0,aes(x=time_slot,y=Fuel_Level_Average,group=1))+geom_point(size=0.8)+labs(x='Time',y='Average Fuel Level',title='Average Fuel Level(Speed==0)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 14, color = "black"))+theme_bw()+theme(axis.text.x=element_blank())
ps0

#연료 주입 기준 분류
speed0_1<-speed0[1:10,]
speed0_2<-speed0[11:66,]
speed0_3<-speed0[67:74,]

#visualization
ps1=ggplot(speed0_1,aes(x=time_slot,y=Fuel_Level_Average,group=1))+geom_line(color='darkorange1',size=0.4)+geom_point(size=0.5)+labs(x='Time',y='Average Fuel Level',title='Class1_Average Fuel Level(Speed==0)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 9, color = "black"))+stat_smooth(method = lm, color = "red")+theme_bw()+theme(axis.text.x=element_blank())
ps2=ggplot(speed0_2,aes(x=time_slot,y=Fuel_Level_Average,group=1))+geom_line(color='darkorange1',size=0.4)+geom_point(size=0.5)+labs(x='Time',y='Average Fuel Level',title='Class2_Average Fuel Level(Speed==0)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 9, color = "black"))+stat_smooth(method = lm, color = "red")+theme_bw()+theme(axis.text.x=element_blank())
ps3=ggplot(speed0_3,aes(x=time_slot,y=Fuel_Level_Average,group=1))+geom_line(color='darkorange1',size=0.4)+geom_point(size=0.5)+labs(x='Time',y='Average Fuel Level',title='Class3_Average Fuel Level(Speed==0)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 9, color = "black"))+stat_smooth(method = lm, color = "red")+theme_bw()+theme(axis.text.x=element_blank())
grid.arrange(ps1,ps2,ps3,ncol=3)


#df1[,1]<-time
# fuelpercent<-fuelpercent['Instantaneous_FEF']
# list<-c(1:9186)
# fp<-data.frame(list,fuelpercent)
# head(fp)
# plot(fp[])
# plot(fp[185:300,],ylim=c(0,100),type='l')
# 
# fp[100:200,]
# ggplot(fp,aes(x=list,y=Instantaneous_FEF,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Times',y='Instantaneous_FEF')+lims(x=c(100,500),y=c(0,100))


# #engine fuel 연료 주입 기준으로 분류(두번째꺼)
# diff(Vehicle_Speed)
# Vehicle_Speed
# Engine_Runtime
# lm1<-lm(Fuel_Level~Engine_RPM+Mass_Air_Flow+Throttle_Position+Engine_Load,data=class1)
# lm2<-lm(Fuel_Level~Engine_RPM+Mass_Air_Flow+Throttle_Position+Engine_Load,data=class2)
# lm3<-lm(Fuel_Level~Engine_RPM+Mass_Air_Flow+Throttle_Position+Engine_Load,data=class3)
# lm4<-lm(Fuel_Level~Engine_RPM+Mass_Air_Flow+Throttle_Position+Engine_Load,data=class4)
# 
# lm5<-lm(Fuel_Level~Engine_RPM+Mass_Air_Flow+Throttle_Position+Engine_Load,data=data2)
# 
#engine fuel 연료 주입 기준으로 분류(첫번째꺼)
#lm4<-lm(Fuel_Level~Engine_RPM+Mass_Air_Flow+Throttle_Position+Engine_Load,data=section1)



#engine runtime 기준 visualization

section1=df1[1:199,c('TimeSlot','VehicleSpeed','EngineRuntime','FuelLevel')]
#section1[,1]<-time[1:199]
#section2=df1[200:421,c('TimeSlot','VehicleSpeed','EngineRuntime','FuelLevel')]
section3=df1[671:830,c('TimeSlot','VehicleSpeed','EngineRuntime','FuelLevel')]
section4=df1[926:1230,c('TimeSlot','VehicleSpeed','EngineRuntime','FuelLevel')]
section5=df1[1235:1554,c('TimeSlot','VehicleSpeed','EngineRuntime','FuelLevel')]


#lm
s=lm(EngineRuntime~FuelLevel,data=section1)
summary(s)


#Vehicle Speed visualization
p1=ggplot(section1,aes(x=EngineRuntime,y=VehicleSpeed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section1_Speed')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 17, color = "black"))+geom_area(fill = "greenyellow", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())
p2=ggplot(section3,aes(x=EngineRuntime,y=VehicleSpeed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section2_Speed')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 17, color = "black"))+geom_area(fill = "greenyellow", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())
p3=ggplot(section4,aes(x=EngineRuntime,y=VehicleSpeed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section3_Speed')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 17, color = "black"))+geom_area(fill = "greenyellow", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())
p4=ggplot(section5,aes(x=EngineRuntime,y=VehicleSpeed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section4_Speed')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 17, color = "black"))+geom_area(fill = "greenyellow", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())
grid.arrange(p1,p2,p3,p4,ncol=2)

#FuelLevel visualization
p11=ggplot(section1,aes(x=EngineRuntime,y=FuelLevel,group=1))+geom_line(color='darkviolet',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Fuel Level',title='Section1_Fuel Level')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 16, color = "black"))+stat_smooth(method = lm, se = TRUE, color = "red")+theme_bw() +theme(axis.text.x=element_blank())
p22=ggplot(section3,aes(x=EngineRuntime,y=FuelLevel,group=1))+geom_line(color='darkviolet',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Fuel Level',title='Section2_Fuel Level')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 16, color = "black"))+stat_smooth(method = lm, se = TRUE, color = "red") +theme_bw()+theme(axis.text.x=element_blank())
p33=ggplot(section4,aes(x=EngineRuntime,y=FuelLevel,group=1))+geom_line(color='darkviolet',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Fuel Level',title='Section3_Fuel Level')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 16, color = "black"))+stat_smooth(method = lm, se = TRUE, color = "red") +theme_bw()+theme(axis.text.x=element_blank())
p44=ggplot(section5,aes(x=EngineRuntime,y=FuelLevel,group=1))+geom_line(color='darkviolet',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Fuel Level',title='Section4_Fuel Level')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 16, color = "black"))+stat_smooth(method = lm, se = TRUE, color = "red") +theme_bw()+theme(axis.text.x=element_blank())
grid.arrange(p11,p22,p33,p44,ncol=2)


#연비구하기
class1<-data2[1:2968,]
class2<-data2[2970:5995,]
class3<-data2[5996:7644,]
class4<-data2[7646:9187,]

attach(data2)

#쓴연료/주행거리 = 쓴연료 

distance1=c(15.48,9.43,16.91,17.86)
distance2=c(24.5627, 22.1282,22.7424)

####연료량 계산
fuel1<-function(x){
  15.48/(x*0.04032)
}
15.48/0.04032
fuel1(35)

fuel2<-function(x){
  9.43/(x*0.01712)
}
9.43/0.01712
fuel2(35)

fuel3<-function(x){
  16.91/(x*0.04642)
}
16.91/0.04642
fuel3(35)

fuel4<-function(x){
  17.86/(x*0.07303)
}
17.86/0.07303
fuel4(35)

(fuel1(35)+fuel2(35)+fuel3(35)+fuel4(35))/4

#-----

fuel1_1<-function(x){
  24.5627/(x*0.05583)
}

24.5627/0.05583
fuel1_1(35)

fuel2_1<-function(x){
  22.1282/(x*0.05687)
}
22.1282/0.05687
fuel2_1(35)

# fuel3_1<-function(x){
#   16.91/(x*0.04959)
# }
# 16.91/0.04959
# fuel3_1(35)

fuel4_1<-function(x){
  22.7424/(x*0.05325)
}
22.7424/0.05325
fuel4_1(35)
mean(fuel1_1(35),fuel2_1(35),fuel4_1(35))

(fuel1_1(35)+fuel2_1(35)+fuel4_1(35))/3



#------
#Vehicle Speed visualization
class1=df2_1[2392:2615,]
class2=df2_1[2616:2886,]
class3=df2_1[6350:6478,]
class4=df2_1[7418:7624,]

pp1=ggplot(class1,aes(x=Engine_Runtime,y=Vehicle_Speed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section1_Speed(data2)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "black"))+geom_area(fill = "plum1", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())
pp2=ggplot(class2,aes(x=Engine_Runtime,y=Vehicle_Speed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section2_Speed(data2)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "black"))+geom_area(fill = "plum1", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())
#pp3=ggplot(class3,aes(x=Engine_Runtime,y=Vehicle_Speed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section3_Speed(data2)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "black"))+geom_area(fill = "plum1", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())
pp4=ggplot(class4,aes(x=Engine_Runtime,y=Vehicle_Speed,group=1))+geom_line(color='darkblue',size=0.4)+geom_point(size=0.5)+labs(x='Engine Runtimes',y='Vehicle Speed',title='Section3_Speed(data2)')+ theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "black"))+geom_area(fill = "plum1", alpha = 0.5)+theme_bw()+theme(axis.text.x=element_blank())

grid.arrange(pp1,pp2,pp4,ncol=3,nrow=2)



