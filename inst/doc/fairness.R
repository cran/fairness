## ---- include=FALSE-----------------------------------------------------------
devtools::load_all('.')

## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = '#>'
)
library(fairness)

## ----eval = FALSE-------------------------------------------------------------
#  install.packages('fairness')
#  library(fairness)

## ----eval = TRUE--------------------------------------------------------------
data('compas')

## ----eval = FALSE-------------------------------------------------------------
#  data('germancredit')

## ----eval = FALSE-------------------------------------------------------------
#  dem_parity(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds_levels = c('no','yes'),
#             cutoff  = 0.5,
#             base    = 'Caucasian')

## ----eval = FALSE-------------------------------------------------------------
#  prop_parity(data    = compas,
#              outcome = 'Two_yr_Recidivism',
#              group   = 'ethnicity',
#              probs   = 'probability',
#              preds_levels = c('no','yes'),
#              cutoff  = 0.5,
#              base    = 'Caucasian')

## ----eval = FALSE-------------------------------------------------------------
#  equal_odds(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds_levels = c('no','yes'),
#             cutoff = 0.5,
#             base   = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  pred_rate_parity(data    = compas,
#                   outcome = 'Two_yr_Recidivism',
#                   group   = 'ethnicity',
#                   probs   = 'probability',
#                   preds_levels = c('no','yes'),
#                   cutoff = 0.5,
#                   base   = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  acc_parity(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds   = NULL,
#             preds_levels = c('no','yes'),
#             cutoff = 0.5,
#             base   = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  fnr_parity(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds_levels = c('no','yes'),
#             cutoff = 0.5,
#             base   = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  fpr_parity(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds_levels = c('no','yes'),
#             cutoff = 0.5,
#             base   = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  npv_parity(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds_levels = c('no','yes'),
#             cutoff = 0.5,
#             base   = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  spec_parity(data    = compas,
#              outcome = 'Two_yr_Recidivism',
#              group   = 'ethnicity',
#              probs   = 'probability',
#              preds_levels = c('no','yes'),
#              cutoff = 0.5,
#              base   = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  roc_parity(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds_levels = c('no','yes'),
#             base = 'African_American')

## ----eval = FALSE-------------------------------------------------------------
#  mcc_parity(data    = compas,
#             outcome = 'Two_yr_Recidivism',
#             group   = 'ethnicity',
#             probs   = 'probability',
#             preds_levels = c('no','yes'),
#             cutoff = 0.5,
#             base   = 'African_American')

## ----echo = FALSE-------------------------------------------------------------
output <- pred_rate_parity(data = compas, 
                           outcome = 'Two_yr_Recidivism', 
                           group   = 'ethnicity',
                           probs   = 'probability', 
                           preds_levels = c('no','yes'), 
                           cutoff = 0.5, 
                           base   = 'Caucasian')

## -----------------------------------------------------------------------------
output$Metric

## ----echo = FALSE-------------------------------------------------------------
output <- pred_rate_parity(data = compas, 
                           outcome = 'Two_yr_Recidivism', 
                           group   = 'ethnicity',
                           probs   = 'probability', 
                           preds_levels = c('no','yes'), 
                           cutoff = 0.5, 
                           base   = 'Hispanic')

## -----------------------------------------------------------------------------
output$Metric

## ---- fig.width=5, fig.height=3-----------------------------------------------
output$Metric_plot

## ---- fig.width=5, fig.height=3-----------------------------------------------
output$Probability_plot

## ----echo = FALSE-------------------------------------------------------------
output <- pred_rate_parity(data = compas, 
                           outcome = 'Two_yr_Recidivism', 
                           group   = 'Female',
                           probs   = 'probability', 
                           preds_levels = c('no','yes'), 
                           cutoff = 0.4, 
                           base = 'Male')

## ---- fig.width=5, fig.height=3-----------------------------------------------
output$Probability_plot

## ----echo = FALSE, message=FALSE----------------------------------------------
output <- roc_parity(data = compas, 
                     outcome  = 'Two_yr_Recidivism', 
                     group    = 'Female',
                     probs    = 'probability', 
                     preds_levels = c('no', 'yes'), 
                     base = 'Male')

## ---- fig.width=5, fig.height=3-----------------------------------------------
output$ROCAUC_plot

