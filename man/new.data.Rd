% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{new.data}
\alias{new.data}
\title{Example of new acoustic telemetry detection data}
\format{
A data frame with 35 rows (observations) and 3 variables.
}
\usage{
data(new.data)
}
\description{
These are fabricated detection data to demonstrate the use of the review
function.
}
\details{
The variables are as follows:

\itemize{
\item ResidenceStart. The start time of the residence events, in POSIXct.
\item Station.Name. Name of the receiver location.
\item ID. Unique ID of the fish.
\item ResidenceEnd. The end time of the residence events, in POSIXct.
\item ResidenceLength.days. The duration of the residence events. The units are
days, as indicated by the variable name (which is automatically generated
by mort::residences())
}
}
\keyword{datasets}
