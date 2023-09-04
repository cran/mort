## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo=FALSE,message=FALSE,warning=FALSE-----------------------------
library(mort)

## ----stnchange,results=FALSE--------------------------------------------------
station_change<-stationchange(data=events,type="mort",ID="ID",station="Station.Name",
                              drift=TRUE,ddd=ddd,units="days",from.station="From",to.station="To")

## ----stnchange_table,echo=FALSE-----------------------------------------------
row.names(station_change)<-NULL
knitr::kable(head(station_change),align="c")

## ----rm_example,results=FALSE-------------------------------------------------
resmax_example<-resmax(data=events,ID="ID",station="Station.Name",
                       res.start="ResidenceStart",residences="ResidenceLength.days",
                       stnchange=station_change,drift=FALSE)

## ----rm_example_table,echo=FALSE----------------------------------------------
row.names(resmax_example)<-NULL
knitr::kable(head(resmax_example),align="c")

## ----rmcml_example,results=FALSE----------------------------------------------
resmaxcml_example<-resmaxcml(data=events,ID="ID",station="Station.Name",
                             res.start="ResidenceStart",res.end="ResidenceEnd",
                             residences="ResidenceLength.days",units="days",
                             stnchange=station_change)

## ----rmcml_example_plot,echo=FALSE--------------------------------------------
row.names(resmaxcml_example)<-NULL
knitr::kable(head(resmaxcml_example),align="c")

