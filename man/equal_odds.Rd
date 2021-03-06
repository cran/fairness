% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/equal_odds.R
\name{equal_odds}
\alias{equal_odds}
\title{Equalized Odds}
\usage{
equal_odds(
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
\item{Metric}{Raw sensitivities for all groups and metrics standardized for the base group (equalized odds parity metric). Lower values compared to the reference group mean lower sensitivities in the selected subgroups}
\item{Metric_plot}{Bar plot of Equalized Odds metric}
\item{Probability_plot}{Density plot of predicted probabilities per subgroup. Only plotted if probabilities are defined}
}
\description{
This function computes the Equalized Odds metric

Formula: TP / (TP + FN)
}
\details{
This function computes the Equalized Odds metric (also known as Equal Opportunity, Positive Rate Parity or Separation). Equalized Odds are calculated
by the division of true positives with all positives (irrespective of predicted values). This metrics equals to
what is traditionally known as sensitivity. In the returned
named vector, the reference group will be assigned 1, while all other groups will be assigned values
according to whether their sensitivities are lower or higher compared to the reference group. Lower
sensitivities will be reflected in numbers lower than 1 in the returned named vector, thus numbers
lower than 1 mean WORSE prediction for the subgroup.
}
\examples{
data(compas)
compas$Two_yr_Recidivism_01 <- ifelse(compas$Two_yr_Recidivism == 'yes', 1, 0) 
equal_odds(data = compas, outcome = 'Two_yr_Recidivism_01', group = 'ethnicity',
probs = 'probability', cutoff = 0.4, base = 'Caucasian')
equal_odds(data = compas, outcome = 'Two_yr_Recidivism_01', group = 'ethnicity',
preds = 'predicted', cutoff = 0.5, base = 'Hispanic')

}
