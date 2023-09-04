## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,include=FALSE------------------------------------------------------
library(mort)
library(ggplot2)
library(plotly)

## ----basic,eval=FALSE---------------------------------------------------------
#  plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name")
#  plot

## ----basic_plot,fig.width=7,echo=FALSE----------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name")
plot<-plot+
  scale_colour_discrete(name="Station Name")+
  guides(colour=guide_legend(ncol=4))
plot

## ----custom,fig.width=7-------------------------------------------------------
plot<-plot+
  theme(legend.position="none")
plot

## ----interactive,eval=FALSE---------------------------------------------------
#  plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",interactive=TRUE)
#  plot

## ----screenshot,echo=FALSE, out.width="100%"----------------------------------
url <- "https://raw.githubusercontent.com/rosieluain/mort/1a8568616f52de0a5e4ff74fe0a36ef9949e25fb/man/figures/interactive_plot_ex.png"
knitr::include_graphics(url)

## ----interactive_direct,eval=FALSE--------------------------------------------
#  interactive_plot<-ggplotly(plot)
#  interactive_plot

## ----morts_ex,include=FALSE---------------------------------------------------
morts<-morts(data=events,type="mort",ID="ID",station="Station.Name",method="all")

## ----basic_withmorts----------------------------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",morts=morts)

## ----basic_withmorts_plot,echo=FALSE,fig.width=7------------------------------

plot<-plot+
  theme(legend.position="none")
plot

## ----basic_ssn,results=FALSE--------------------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",
                residences="auto",units="auto",
                season.start="2004-06-01",season.end="2004-10-31")

## ----basic_ssn_plot,echo=FALSE,fig.width=7------------------------------------
plot<-plot+
  theme(legend.position="none")
plot

## ----facet_basic,results=FALSE------------------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",facet=TRUE,
                season.start=c("2004-06-01","2004-10-01"),
                season.end=c("2004-06-30","2004-10-31"))

## ----facet_basic_plot,echo=FALSE,fig.width=7----------------------------------
plot<-plot+
  theme(legend.position="none")
plot

## ----facet_year,results=FALSE-------------------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",
                facet=TRUE,facet.by="year")

## ----facet_year_plot,echo=FALSE,fig.width=7-----------------------------------
plot<-plot+
  theme(legend.position="none")
plot

## ----facet_y,results=FALSE----------------------------------------------------
plot<-mortsplot(data=events,type="mort",ID="ID",station="Station.Name",
                facet=TRUE,facet.by="year",facet.axis="y")

## ----facet_y_plot,echo=FALSE,fig.width=7,fig.height=5-------------------------
plot<-plot+
  theme(legend.position="none")
plot

## ----sourcecode,eval=FALSE----------------------------------------------------
#  View(mortsplot)

