# Really important: This code assumes balanced panels
using Distributions
using Statistics
using StatsBase
using LinearAlgebra
using DataFrames
using CSV
using Optim
using LineSearches
using ForwardDiff

using Revise

# using Pkg; Pkg.develop("~/Documents/repos/QLD")
using QLD

df = DataFrame(
  CSV.File("examples/df_ex_factor.csv")
)

res_overall = qld_imputation(
  df;
  y=:y,
  id=:id,
  t=:t,
  g=:g,
  W=[
    :W1,
    :W2,
  ],
  do_within_transform=false,
  p=-1,
  type="overall",
)

res = qld_imputation(
  df;
  y=:y,
  id=:id,
  t=:t,
  g=:g,
  W=[
    :W1,
    :W2,
  ],
  do_within_transform=false,
  p=-1,
  type="dynamic",
)

res_uniform_cb = qld_imputation(
  df;
  y=:y,
  id=:id,
  t=:t,
  g=:g,
  W=[
    :W1,
    :W2,
  ],
  do_within_transform=false,
  p=-1,
  type="dynamic",
  vcov_type="uniform"
)

