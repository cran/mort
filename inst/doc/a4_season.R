## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE,warning=FALSE,message=FALSE----------------------------
library(mort)
library(ggplot2)

## ----moveplot,echo=FALSE,results=FALSE,fig.width=7----------------------------
plot<-mortsplot(data=events[events$ID %in% c("C","K","L"),],
                type="mort",ID="ID",station="Station.Name",
                season.start="2004-02-01",season.end="2004-06-26")
plot<-plot+
  geom_vline(aes(xintercept=as.POSIXct("2004-06-11")),linetype="dashed")+
  guides(colour="none")
plot

## ----ddmm, eval=FALSE---------------------------------------------------------
#  day_month<-morts(data=events,type="mort",ID="ID",station="Station.Name",
#                   season.start="01-06", season.end="31-10")

## ----fulldate_mult, eval=FALSE------------------------------------------------
#  full_date<-morts(data=events,type="mort",ID="ID",station="Station.Name",
#                   season.start=c("2003-06-01","2004-06-05"),
#                   season.end=c("2003-10-31","2004-10-15"))

## ----all_ex,echo=FALSE,results=FALSE,fig.width=7------------------------------
no_season_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="all")

plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=no_season_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----season_ex,results=FALSE,echo=FALSE,fig.width=7---------------------------
season_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="all",
                 season.start=seasons$Start, season.end=seasons$End)
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=season_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----no_overlap,eval=FALSE----------------------------------------------------
#  no_overlap<-morts(data=events,type="mort",ID="ID",station="Station.Name",
#                   season.start="2003-06-01", season.end="2003-10-31",
#                   season.overlap=FALSE)

## ----overlap_plot,echo=FALSE,results=FALSE,fig.width=7------------------------
season.data<-season(data=events,type="mort",ID="ID",station="Station.Name",
                    season.start="2003-06-01", season.end="2003-10-31")
season.data<-season.data[season.data$Station.Name!="Break",]
plot<-mortsplot(data=season.data[season.data$ID=="K",],type="mort",ID="ID",station="Station.Name")
plot<-plot+
  geom_vline(aes(xintercept=as.POSIXct("2003-10-31")),linetype="dashed")+
  theme(legend.position="none")
plot

## ----no_overlap_plot,echo=FALSE,results=FALSE,fig.width=7---------------------
plot<-mortsplot(data=events[events$ID=="K",],type="mort",ID="ID",station="Station.Name",
                season.start="2003-06-01", season.end="2003-10-31")
plot<-plot+
  geom_vline(aes(xintercept=as.POSIXct("2003-10-31")),linetype="dashed")+
  theme(legend.position="none")
plot

## ----plotno_ov,echo=FALSE,fig.width=7,eval=FALSE------------------------------
#  plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=no_overlap)
#  plot<-plot+
#    theme(legend.position="none")
#  plot

## ----season_standalone,eval=FALSE---------------------------------------------
#  season.data<-season(data=events,type="mort",ID="ID",station="Station.Name",
#                      season.start="2003-06-01", season.end="2003-10-31")

