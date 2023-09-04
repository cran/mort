## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo=FALSE,warning=FALSE,message=FALSE-----------------------------
library(mort)
library(ggplot2)

## ----stnchange_plot_data,echo=FALSE,results=FALSE-----------------------------
stn.change<-stationchange(data=events[events$ID %in% c("G","K"),],type="mort",ID="ID",station="Station.Name")
plot<-mortsplot(data=events[events$ID %in% c("G","K"),],
                type="mort",ID="ID",station="Station.Name",
                season.start="2004-06-22",season.end="2004-07-01")

## ----stnchange_plot,echo=FALSE,fig.width=7------------------------------------
plot<-plot+
  geom_point(data=stn.change,aes(x=ResidenceStart,y=ID))+
  scale_colour_discrete(name="Station Name")+
  guides(colour=guide_legend(nrow=1,byrow=TRUE))+
  theme(legend.position="bottom")
plot

## ----resmax_ex,echo=FALSE,results=FALSE---------------------------------------
stn.change<-stationchange(data=events,type="mort",ID="ID",station="Station.Name")
rm_example<-resmax(data=events,ID="ID",station="Station.Name",
                   res.start="ResidenceStart",residences="ResidenceLength.days",
                   stnchange=stn.change)

## ----resmax_table,echo=FALSE--------------------------------------------------
rm_example<-rm_example[order(rm_example$ResidenceLength.days,decreasing=TRUE),]
row.names(rm_example)<-NULL
knitr::kable(head(rm_example),align="c")

## ----morts_last_ex,eval=FALSE-------------------------------------------------
#  last_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="last")

## ----morts_last_ex_run,include=FALSE------------------------------------------
last_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="last")

## ----last_ex_plot,echo=FALSE,fig.width=7--------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",
                morts=last_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----morts_any_ex,eval=FALSE--------------------------------------------------
#  any_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="any")

## ----morts_any_ex_run,include=FALSE-------------------------------------------
any_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="any")

## ----morts_any_plot,echo=FALSE,fig.width=7------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=any_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----actel_any_ex,eval=FALSE--------------------------------------------------
#  actel_ex<-morts(data=data,type="actel",ID="auto",station="auto",method="any")

## ----manual_ex,eval=FALSE-----------------------------------------------------
#  manual_ex<-morts(data=data,type="manual",ID="ID",station="Station.Name",
#                   res.start="ResidenceStart",res.end="ResidenceEnd",
#                   residences="ResidenceLength.days",units="days",method="any")

## ----sc_cmlres_plot,echo=FALSE,results=FALSE----------------------------------
cml_res<-data.frame(ID=c("C","L"),
                   Start=as.POSIXct(c("2004-03-26 13:39:43",
                                      "2004-04-20 15:21:35")),
                   End=as.POSIXct(c("2004-06-08 23:21:49",
                                    "2004-06-09 22:20:20")))
plot<-mortsplot(data=events[events$ID %in% c("C","L"),],
                type="mort",ID="ID",station="Station.Name",
                season.start="2004-03-26",season.end="2004-06-23")

## ----sc_cmlres_plot_adjust,echo=FALSE,fig.width=7-----------------------------
plot<-plot+
  geom_point(data=cml_res,aes(x=Start,y=ID))+
  geom_point(data=cml_res,aes(x=End,y=ID))+
  scale_colour_discrete(name="Station Name")+
  theme(legend.position="bottom")
plot

## ----resmaxcml_ex,echo=FALSE,results=FALSE------------------------------------
stn.change<-stationchange(data=events,type="mort",ID="ID",station="Station.Name")
rmc_example<-resmaxcml(data=events,ID="ID",station="Station.Name",
                   res.start="ResidenceStart",
                   res.end="ResidenceEnd",
                   residences="ResidenceLength.days",
                   units="days",
                   stnchange=stn.change)

## ----resmaxcml_ex_table,echo=FALSE--------------------------------------------
rmc_example<-rmc_example[order(rmc_example$ResidenceLength.days,
                               decreasing=TRUE),]
row.names(rmc_example)<-NULL
knitr::kable(head(rmc_example),align="c")

## ----cumulative_ex,eval=FALSE-------------------------------------------------
#  cumulative_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="cumulative")

## ----clm_ex_run,include=FALSE-------------------------------------------------
cumulative_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="cumulative")

## ----clm_ex_plot,echo=FALSE,fig.width=7---------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=cumulative_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----all_ex,eval=FALSE--------------------------------------------------------
#  all_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="all")

## ----all_ex_run,include=FALSE-------------------------------------------------
all_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="all")

## ----all_ex_plot,echo=FALSE,fig.width=7---------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=all_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----all_ex_table,echo=FALSE--------------------------------------------------
row.names(all_ex)<-NULL
knitr::kable(head(all_ex),align="c")

## ----inf_plot,echo=FALSE,results=FALSE----------------------------------------
plot<-mortsplot(data=events[events$ID %in% c("M","I"),],
                type="mort",ID="ID",station="Station.Name",
                season.start="2005-09-25",season.end="2006-09-25")

## ----inf_plot_adjust,echo=FALSE,fig.width=7-----------------------------------
plot<-plot+
  theme(legend.position="none")
plot

## ----recent_ex,eval=FALSE-----------------------------------------------------
#  recent_ex<-infrequent(data=events,type="mort",ID="ID",station="Station.Name",
#                        method="recent",threshold=72,threshold.units="hours",
#                        recent.period=52,recent.units="weeks")

## ----recent_ex_run,include=FALSE----------------------------------------------
recent_ex<-infrequent(data=events,type="mort",ID="ID",station="Station.Name",
                      method="recent",threshold=72,threshold.units="hours",
                      recent.period=52,recent.units="weeks")

## ----rec_plot,echo=FALSE,fig.width=7------------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=recent_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----defined_ex, eval=FALSE---------------------------------------------------
#  defined_ex<-infrequent(data=events,type="mort",ID="ID",station="Station.Name",
#                         method="defined",threshold=12,threshold.units="hours",
#                        start="2006-06-15",end="2006-10-15")

## ----defined_ex_run,include=FALSE---------------------------------------------
defined_ex<-infrequent(data=events,type="mort",ID="ID",station="Station.Name",
                       method="defined",threshold=12,threshold.units="hours",
                      start="2006-06-15",end="2006-10-15")

## ----def_plot,echo=FALSE,fig.width=7------------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=defined_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----datetime_ex--------------------------------------------------------------
start=as.POSIXct("2022-06-15",tz="America/Edmonton")
start
attributes(start)$tzone<-"UTC"
start

## ----mortsprev_ex,eval=FALSE--------------------------------------------------
#  prev_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",morts.prev=recent_ex)

## ----backwards,include=FALSE--------------------------------------------------
morts.all<-morts(data=events,type="mort",ID="ID",station="Station.Name",
                 method="any")
morts.all.bw<-morts(data=events,type="mort",ID="ID",station="Station.Name",
                 method="any",backwards=TRUE)

## ----backwards_plot,echo=FALSE,fig.width=7------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name")
plot<-plot+
  geom_point(data=morts.all,aes(x=ResidenceStart,y=ID),colour="black")+
  geom_point(data=morts.all.bw,aes(x=ResidenceStart,y=ID),colour="blue")
plot<-plot+
  theme(legend.position="none")
plot

