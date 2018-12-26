#--多因素方差分析


#-----1、随机区组设计资料（双因素实验设计）的方差分析实例


  随机区组设计考虑了个体差异的影响，可分析处理因素与个体差异对实验效应的影响，所以又称为两因素实验
设计，比完全随机设计的检验效率高。
  该设计是将受试对象先按配比条件配成组，每一个组有3个或3个以上的受试对象，再按随机化原则将受试对象分配到各个处理组。
  在随机区组试验结果的统计分析时，将处理看作A因素，将区组看作B因素，分析这类资料可以运用两因素方差分析方法进行分析。


  研究注射不同剂量雌激素对老鼠子宫重量的影响，取4窝不同种的老鼠，每窝3只，随机分配到3个组内接受不同剂量的雌激素注射，然后测定其子宫重量。问注射不同计量的雌激素对老鼠子宫重量是否有影响？
  
  老鼠种类                雌激素剂量
                      0.2     0.4      0.8 
      A               106     116      145
      B               42      68       115
      C               70      111      133
      D               42      63       87

      
      
library(multcomp)
library(gplots)
example8_6<-read.csv('F:\\课件\\资源\\《R语言统计分析与应用》配套程序\\第八章\\example8_6.csv',header=TRUE)
attach(example8_6)
block<-factor(block,ordered = F)
dose<-factor(dose,ordered = F)
table(block,dose)

aggregate(weight,by=list(block),mean)
aggregate(weight,by=list(block),sd)
aggregate(weight,by=list(dose),mean)
aggregate(weight,by=list(dose),sd)

fit1<-aov(weight~block+dose)
summary(fit1)
TukeyHSD(fit1,'dose')
TukeyHSD(fit1,'block')

detach(example8_6)


#------2、析因设计资料的方差分析


  析因设计资料的方差分析，考虑两个因素和两个因素的交互影响。
  
  格式：fit<-aov(X~a+b+a:b)


#-----3、正交试验设计资料的方差分析

  多个因素共同作用，考虑多因素和规定因素交互之间的影响。

  格式： fit<-aov(x~a+b+c+d+a:b)   --a:b因素根据实际情况自行设置

#-----4、


  
  
  