% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/options.R
\name{season}
\alias{season}
\title{Select residence events from specified seasons}
\usage{
season(
  data,
  type = "mort",
  ID,
  station,
  res.start = "auto",
  res.end = "auto",
  residences = "auto",
  units = "auto",
  season.start,
  season.end,
  overlap = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{data}{a dataframe of residence events. Residence events must include
tag ID, start time, end time, and duration.}

\item{type}{the method used to generate the residence events. Options are
"mort", "actel", "glatos", "vtrack", or "manual". If "manual", then user
must specify \code{res.start}, \code{res.end}, \code{residences}, and \code{units}.}

\item{ID}{a string of the name of the column in \code{data} that holds the tag or
sample IDs.}

\item{station}{a string of the name of the column in \code{data} that holds the
station name or receiver location.}

\item{res.start}{a string of the name of the column in \code{data} that holds the
start date and time. Must be specified and in POSIXt or character in the format
YYYY-mm-dd HH:MM:SS if \code{type="manual"}.}

\item{res.end}{a string of the name of the column in \code{data} that holds the
end date and time. Must be specified and in POSIXt or character in the format
YYYY-mm-dd HH:MM:SS if \code{type="manual"}.}

\item{residences}{a character string with the name of the column in \code{data}
that holds the duration of the residence events.}

\item{units}{Units of the duration of the residence events in \code{data}. Options are "secs",
"mins", "hours", "days", and "weeks".}

\item{season.start}{the start date/time(s) of the period of interest. If the
period of interest is the same in all study years, must be a character string
in format "dd-mm". Otherwise, must be in POSIXt, or a character string in
format YYYY-mm-dd HH:MM:SS.}

\item{season.end}{the end date/time(s) of the period of interest. If the
period of interest is the same in all study years, must be a character string
in format "dd-mm". Otherwise, must be in POSIXt, or a character string in
format YYYY-mm-dd HH:MM:SS.}

\item{overlap}{option to include residence events that overlap either the
beginning or the end of the period of interest. If \code{TRUE}, the full overlapping
residence events will be retained. If \code{FALSE}, only the portion of the
residence events that is within the period of interest will be retained,
and \code{residences} will be recalculated, using specified \code{units}.
Default is \code{TRUE}.}

\item{verbose}{option to display updates and progress bars as
functions is run. Default is TRUE.}
}
\value{
a dataframe in the same format as the input data, with residence
events limited to the period(s) of interest.
}
\description{
Select residence events from specified seasons, to be used to
identify potential mortalities or expelled tags. Useful when animals show
strong seasonal patterns in behaviour. For example, a reduction in movement during
winter may be falsely identified as a mortality, or
increase the threshold use to identify mortalities, which would then cause
potential mortalities to be missed.
}
\examples{
# Seasons in format dd-mm
season.events<-season(data=events,type="mort",ID="ID",
station="Station.Name",season.start="01-06",season.end="31-10",
verbose=FALSE)
head(season.events)

# Seasons in format YYYY-mm-dd HH:MM:SS
season.start<-c("2003-06-15","2004-06-21")
season.end<-c("2003-10-15","2004-10-30")
season.events<-season(data=events,type="mort",ID="ID",
station="Station.Name",season.start=season.start,season.end=season.end,verbose=FALSE)
head(season.events)
}
