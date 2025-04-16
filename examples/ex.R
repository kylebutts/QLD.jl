library(tidyverse)
library(JuliaCall)
julia_setup()
julia_install_package_if_needed("QLD")
julia_eval("using QLD")
df <- read_csv("examples/df_ex_factor.csv", show_col_types = FALSE)

res_overall <- julia_call(
  "QLD.qld_imputation",
  df,
  y = "y",
  id = "id",
  t = "t",
  g = "g",
  W = c("W1", "W2"),
  do_within_transform = FALSE,
  p = -1L,
  type = "overall"
)
str(res_overall)

res <- julia_call(
  "QLD.qld_imputation",
  df,
  y = "y",
  id = "id",
  t = "t",
  g = "g",
  W = c("W1", "W2"),
  do_within_transform = FALSE,
  p = -1L,
  type = "dynamic"
)
str(res)

res_uniform_cb <- julia_call(
  "QLD.qld_imputation",
  df,
  y = "y",
  id = "id",
  t = "t",
  g = "g",
  W = c("W1", "W2"),
  do_within_transform = FALSE,
  p = -1L,
  type = "dynamic",
  vcov_type = "uniform"
)
str(res_uniform_cb)
