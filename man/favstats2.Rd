% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reexports.R
\name{favstats2}
\alias{favstats2}
\title{Aggregating functions}
\usage{
favstats2(x, ..., data = NULL, groups = NULL, na.rm = TRUE)
}
\arguments{
\item{x}{a numeric vector or a formula}

\item{...}{additional arguments}

\item{data}{a data frame in which to evaluate formulas (or bare names).
Note that the default is \code{data = parent.frame()}.  This makes it convenient to
use this function interactively by treating the working envionment as if it were
a data frame.  But this may not be appropriate for programming uses.
When programming, it is best to use an explicit \code{data} argument
-- ideally supplying a data frame that contains the variables mentioned.}

\item{groups}{a grouping variable, typically a name of a variable in \code{data}}

\item{na.rm}{a logical indicating whether \code{NA}s should be removed before computing}
}
\description{
The \code{mosaic} package makes several summary statistic functions (like \code{mean} and \code{sd})
formula aware.
}
\details{
Many of these functions mask core R functions to provide an additional formula
interface.  Old behavior should be unchanged.  But if the first argument is a formula,
that formula, together with \code{data} are used to generate the numeric vector(s)
to be summarized.  Formulas of the shape \code{x ~ a} or \code{~ x | a} can be used to
produce summaries of \code{x} for each subsect defined by \code{a}.  Two-way aggregation
can be achieved using formulas of the form \code{x ~ a + b} or \code{x ~ a | b}.  See
the examples.
}
\section{Note}{


Earlier versions of these functions supported a "bare name + data frame" interface.  This
functionality has been removed since it was (a) ambiguous in some cases, (b) unnecessary,
and (c) difficult to maintain.

}

\examples{
mean(HELPrct$age)
mean( ~ age, data = HELPrct)
mean( ~ drugrisk, na.rm = TRUE, data = HELPrct)
mean(age ~ shuffle(sex), data = HELPrct)
mean(age ~ shuffle(sex), data = HELPrct, .format = "table")
# wrap in data.frame() to auto-convert awkward variable names
data.frame(mean(age ~ shuffle(sex), data = HELPrct, .format = "table"))
mean(age ~ sex + substance, data = HELPrct)
mean( ~ age | sex + substance, data = HELPrct)
mean( ~ sqrt(age), data = HELPrct)
sum( ~ age, data = HELPrct)
sd(HELPrct$age)
sd( ~ age, data = HELPrct)
sd(age ~ sex + substance, data = HELPrct)
var(HELPrct$age)
var( ~ age, data = HELPrct)
var(age ~ sex + substance, data = HELPrct)
IQR(width ~ sex, data = KidsFeet)
iqr(width ~ sex, data = KidsFeet)
favstats(width ~ sex, data = KidsFeet)

cor(length ~ width, data = KidsFeet)
cov(length ~ width, data = KidsFeet)
tally(is.na(mcs) ~ is.na(pcs), data = HELPmiss)
cov(mcs ~ pcs, data = HELPmiss)             # NA because of missing data
cov(mcs ~ pcs, data = HELPmiss, use = "complete")  # ignore missing data
# alternative approach using filter explicitly
cov(mcs ~ pcs, data = HELPmiss \%>\% filter(!is.na(mcs) & !is.na(pcs)))
}
