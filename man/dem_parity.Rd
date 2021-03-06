% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dem_parity.R
\name{dem_parity}
\alias{dem_parity}
\title{Demographic parity}
\usage{
dem_parity(
  data,
  outcome,
  group,
  probs = NULL,
  preds = NULL,
  outcome_base = NULL,
  cutoff = 0.5,
  base = NULL,
  group_breaks = NULL
)
}
\arguments{
\item{data}{Data.frame that contains the necessary columns.}

\item{outcome}{Column name indicating the binary outcome variable (character).}

\item{group}{Column name indicating the sensitive group (character).}

\item{probs}{Column name or vector with the predicted probabilities (numeric between 0 - 1). Either probs or preds need to be supplied.}

\item{preds}{Column name or vector with the predicted binary outcome (0 or 1). Either probs or preds need to be supplied.}

\item{outcome_base}{Base level of the outcome variable (i.e., negative class). Default is the first level of the outcome variable.}

\item{cutoff}{Cutoff to generate predicted outcomes from predicted probabilities. Default set to 0.5.}

\item{base}{Base level of the sensitive group (character).}

\item{group_breaks}{If group is continuous (e.g., age): either a numeric vector of two or more unique cut points or a single number >= 2 giving the number of intervals into which group feature is to be cut.}
}
\value{
\item{Metric}{Absolute number of positive classifications for all groups and metrics standardized for the base group (demographic parity metric). Lower values compared to the reference group mean lower number of positively predicted observations in the selected subgroups}
\item{Metric_plot}{Bar plot of Demographic parity metric}
\item{Probability_plot}{Density plot of predicted probabilities per subgroup. Only plotted if probabilities are defined}
}
\description{
This function computes the Demographic parity metric

Formula: (TP + FP)
}
\details{
This function computes the Demographic parity metric (also known as Statistical Parity, Equal Parity,
Equal Acceptance Rate or Independence) as described by Calders and Verwer 2010. Demographic parity is calculated
based on the comparison of the absolute number of all positively classified individuals in all subgroups of the data. In the returned
named vector, the reference group will be assigned 1, while all other groups will be assigned values
according to whether their proportion of positively predicted observations are lower or higher compared to the reference group. Lower
proportions will be reflected in numbers lower than 1 in the returned named vector.
}
\examples{
data(compas)
compas$Two_yr_Recidivism_01 <- ifelse(compas$Two_yr_Recidivism == 'yes', 1, 0) 
dem_parity(data = compas, outcome = 'Two_yr_Recidivism_01', group = 'ethnicity',
probs = 'probability', cutoff = 0.4, base = 'Caucasian')
dem_parity(data = compas, outcome = 'Two_yr_Recidivism_01', group = 'ethnicity',
preds = 'predicted', cutoff = 0.5, base = 'Hispanic')

}
