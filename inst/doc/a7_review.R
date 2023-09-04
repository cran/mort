## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo=FALSE,message=FALSE,warning=FALSE-----------------------------
library(mort)
library(ggplot2)

## ----alive_ex,echo=FALSE,results=FALSE,fig.width=7----------------------------
new.events<-rbind(events,new.data)
morts<-morts(data=events,type="mort",ID="ID",station="Station.Name",
             method="all")
plot<-mortsplot(data=new.events,type="mort",ID="ID",station="Station.Name",
                morts=morts)
plot<-plot+
  geom_vline(aes(xintercept=as.POSIXct("2006-10-25")),linetype="dashed")+
  theme(legend.position="none")
plot

## ----rev_ex,results=FALSE-----------------------------------------------------
review_example<-review(morts=morts,new.data=new.data,type="mort",
                       ID="ID",station="Station.Name")

## ----rev_ex_table,echo=FALSE--------------------------------------------------
row.names(review_example)<-NULL
knitr::kable(review_example,align="c")

## ----old_data,eval=FALSE------------------------------------------------------
#  review_example<-review(morts=morts,new.data=new.data,old.data=events,
#                         type="mort",ID="ID",station="Station.Name")

## ----rev_drift,eval=FALSE-----------------------------------------------------
#  drift_review<-review(morts=morts,new.data=new.data,old.data=old.data,
#                       type="morts",ID="ID",station="Station.Name",
#                       res.end="auto",residences="auto",units="auto",
#                       ddd=ddd,from.station="From",to.station="To")

