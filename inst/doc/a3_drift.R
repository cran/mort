## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo=FALSE,warning=FALSE,message=FALSE-----------------------------
library(mort)
library(ggplot2)

## ----ddd_table,echo=FALSE-----------------------------------------------------
ddd_ex<-ddd[(nrow(ddd)-5):nrow(ddd),]
row.names(ddd_ex)<-NULL
knitr::kable(ddd_ex,align="c")

## ----drift_data,echo=FALSE,results=FALSE--------------------------------------
drift.data<-drift(data=events,type="mort",ID="ID",station="Station.Name",
                  ddd=ddd,from.station="From",to.station="To",
                  cutoff=1,cutoff.units="days")

## ----drift_table, echo=FALSE--------------------------------------------------
drift.subset<-drift.data[c(6,66),]
row.names(drift.subset)<-NULL
knitr::kable(drift.subset,align="c")

## ----before_drift,echo=FALSE,results=FALSE,fig.width=7------------------------
plot<-mortsplot(data=events[events$ID %in% c("L","K"),],
                type="mort",ID="ID",station="Station.Name",
                season.start="2003-09-26",season.end="2004-03-08")
plot<-plot+
  scale_colour_manual(name="Station Name",
                      values=c("#F8766D","#A3A500","#00B0F6","#E76BF3"))
plot

## ----after_drift,echo=FALSE,results=FALSE,fig.width=7-------------------------
plot<-mortsplot(data=drift.data[drift.data$ID %in% c("L","K"),],
                type="mort",ID="ID",station="Station.Name",
                season.start="2003-09-26",season.end="2004-03-08")
plot<-plot+
  scale_colour_manual(name="Station Name",
                      values=c("#F8766D","#A3A500","#00B0F6","#E76BF3","#00BF7D"))
plot

## ----drift_ex_inf, eval=FALSE-------------------------------------------------
#  drift_ex<-infrequent(data=events,type="mort",ID="ID",station="Station.Name",
#                       ddd=ddd,from.station="From",to.station="To",
#                       drift.cutoff=1,drift.units="days")

## ----no_drift,results=FALSE---------------------------------------------------
no_drift<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="all")

## ----no_drift_plot,echo=FALSE,fig.width=7-------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",
                morts=no_drift)
plot<-plot+
  theme(legend.position="none")
plot

## ----drift_ex_morts,results=FALSE---------------------------------------------
drift_ex<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="all",
                drift="morts",ddd=ddd,from.station="From",to.station="To",
                drift.cutoff=1,drift.units="days")

## ----drift_ex_morts_plot,echo=FALSE,fig.width=7-------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=drift_ex)
plot<-plot+
  theme(legend.position="none")
plot

## ----df, eval=FALSE-----------------------------------------------------------
#  drift.data<-drift(data=events,type="mort",ID="ID",station="Station.Name",
#                    ddd=drift.dataframe,from.station="From",to.station="To",
#                    cutoff=1,cutoff.units="days")

