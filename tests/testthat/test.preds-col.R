context("Predicted_variable")
library(fairness)

data("compas")
compas$Two_yr_Recidivism_01 <- ifelse(compas$Two_yr_Recidivism == 'yes', 1, 0)


test_that("no errors in acc_parity", {
  expect_error(acc_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                          probs = NULL, preds = "predicted", 
                          cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in dem_parity", {
  expect_error(dem_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                          probs = NULL, preds = "predicted",
                          cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in equal_odds", {
  expect_error(equal_odds(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                          probs = NULL, preds = "predicted", 
                          cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in fnr_parity", {
  expect_error(fnr_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                          probs = NULL, preds = "predicted", 
                          cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in fpr_parity", {
  expect_error(fpr_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                          probs = NULL, preds = "predicted",
                          cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in mcc_parity", {
  expect_error(mcc_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                          probs = NULL, preds = "predicted",
                          cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in npv_parity", {
  expect_error(npv_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                          probs = NULL, preds = "predicted", 
                          cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in pred_rate_parity", {
  expect_error(pred_rate_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                                probs = NULL, preds = "predicted", 
                                cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in prop_parity", {
  expect_error(prop_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                           probs = NULL, preds = "predicted",
                           cutoff = 0.5, base = "Caucasian"), NA)})

test_that("no errors in spec_parity", {
  expect_error(spec_parity(data = compas, outcome = "Two_yr_Recidivism_01", group = "ethnicity",
                           probs = NULL, preds = "predicted", 
                           cutoff = 0.5, base = "Caucasian"), NA)})
