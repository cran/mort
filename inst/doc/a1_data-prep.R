## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo=FALSE---------------------------------------------------------
library(mort)

## ----detection_table, echo=FALSE----------------------------------------------
data(detections)
knitr::kable(head(detections),align="c")

## ----residences,eval=FALSE----------------------------------------------------
#  res.events<-residences(data=detections,ID="ID",station="Station.Name",datetime="DateTimeUTC",
#                         cutoff=1,units="days")

## ----events_table,echo=FALSE--------------------------------------------------
knitr::kable(head(events),align="c")

## ----POSIXt_UTC,eval=FALSE----------------------------------------------------
#  data$DateTimeUTC<-as.POSIXct(data$DateTimeLocal,format="%Y-%m-%d %H:%M:%S",
#                               tz="America/Edmonton")
#  attributes(data$DateTimeUTC)$tzone<-"UTC"

## ----actel_tz_warning, echo=FALSE---------------------------------------------
warning("If actel date/times are in local time, they will be converted to UTC. Verify that time zone in actel output is correct.",call.=FALSE)

## ----VT_tz_warning,echo=FALSE-------------------------------------------------
warning("Assuming that VTrack date/times are in UTC. If they are in local
            time, please convert to UTC before running",
            call. = FALSE)

## ----VT_duration_warning,echo=FALSE-------------------------------------------
warning("When the duration of an event is 0 s (a single detection) and
            the reason for ending the event (ENDREASON) is 'timeout', Vtrack
            gives DURATION as the time between the current event and the next, not
            the duration of the current event. DURATION was recalculated as
            the duration of the events themselves, to better align with other
            packages.",
            call. = FALSE)

