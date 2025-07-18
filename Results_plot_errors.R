
# *******************************************************
# Obj: Plotting results
#  
# ********************************************************
rm(list = ls())
library(tidyverse)

# ------------------- RMSE dataset -----------------------------
dt.rmse10=data.frame(SSize=c(10,10,10,10),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                   Perf=c(1.2208,1.7947,1.8675,2.4932))
dt.rmse50=data.frame(SSize=c(50,50,50,50),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                     Perf=c(1.4219,1.3753,1.3768,2.1890))
dt.rmse100=data.frame(SSize=c(100,100,100,100),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                     Perf=c(1.4770,1.2114,1.2124,1.9828))
dt.rmse500=data.frame(SSize=c(500,500,500,500),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                      Perf=c(1.5363,1.2540,1.2543,2.3581))
dt.rmse=rbind(dt.rmse10,dt.rmse50,dt.rmse100,dt.rmse500)
dt.rmse$Metric="RMSE"

p1.rmse=ggplot(data=dt.rmse,aes(x=SSize,y=Perf,color=Mth))+
  geom_point(size=10,alpha = 1/2)+
  geom_line()+
  facet_wrap(~Metric)+
  theme_bw()+
  theme(legend.title = element_blank())+
  theme(legend.position = "top")+
  xlab("Sample Size")+
  ylab("RMSE")+
  theme(axis.title.y=element_text(size=30))+
  theme(text = element_text(size=30))

png(paste0("RMSE_Data2","_",Sys.Date(),".png"), width =700, height = 500,
    units = 'px', pointsize = 12,bg = "white",res = NA)
p1.rmse
dev.off()

# ------------------- MAE dataset -----------------------------
dt.mae10=data.frame(SSize=c(10,10,10,10),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                     Perf=c(0.9640,1.6231,1.7044,1.8296))
dt.mae50=data.frame(SSize=c(50,50,50,50),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                     Perf=c(1.1304,1.0258,1.0324,1.5524))
dt.mae100=data.frame(SSize=c(100,100,100,100),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                      Perf=c(1.1760,0.9519,0.9581,1.4433))
dt.mae500=data.frame(SSize=c(500,500,500,500),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                      Perf=c(1.2240,1.0231,1.0238,1.6615))
dt.mae=rbind(dt.mae10,dt.mae50,dt.mae100,dt.mae500)
dt.mae$Metric="MAE"

p1.mae=ggplot(data=dt.mae,aes(x=SSize,y=Perf,color=Mth))+
  geom_point(size=10,alpha = 1/2)+
  geom_line()+
  facet_wrap(~Metric)+
  theme_bw()+
  theme(legend.title = element_blank())+
  theme(legend.position = "top")+
  xlab("Sample Size")+
  ylab("MAE")+
  theme(axis.title.y=element_text(size=30))+
  theme(text = element_text(size=30))

png(paste0("MAE_Data2","_",Sys.Date(),".png"), width =700, height = 500,
    units = 'px', pointsize = 12,bg = "white",res = NA)
p1.mae
dev.off()


# ------------------- R2 dataset -----------------------------
dt.r2.10=data.frame(SSize=c(10,10,10,10),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                    Perf=c(0.9947,0.7704,0.7514,0.5570))
dt.r2.50=data.frame(SSize=c(50,50,50,50),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                    Perf=c(0.9933,0.8207,0.8203,0.5456))
dt.r2.100=data.frame(SSize=c(100,100,100,100),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                     Perf=c(0.9938,0.8080,0.8077,0.4856))
dt.r2.500=data.frame(SSize=c(500,500,500,500),Mth=c("NONMEM","LR","LASSO","XGBoost"),
                     Perf=c(0.9935,0.8494,0.8493,0.4673))
dt.r2=rbind(dt.r2.10,dt.r2.50,dt.r2.100,dt.r2.500)
dt.r2$Metric="R^2"

p1.r2=ggplot(data=dt.r2,aes(x=SSize,y=Perf,color=Mth))+
  geom_point(size=10,alpha = 1/2)+
  geom_line()+
  facet_wrap(~Metric)+
  theme_bw()+
  theme(legend.title = element_blank())+
  theme(legend.position = "top")+
  xlab("Sample Size")+
  ylab("R^2")+
  theme(axis.title.y=element_text(size=30))+
  theme(text = element_text(size=30))

png(paste0("R2_Data2","_",Sys.Date(),".png"), width =700, height = 500,
    units = 'px', pointsize = 12,bg = "white",res = NA)
p1.r2
dev.off()



