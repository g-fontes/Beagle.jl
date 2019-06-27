using CmdStan, StatsPlots
set_cmdstan_home!("/abu/cmdstan")
ProjDir = "/tmp"

const bernoullistanmodel = "
data {
  int<lower=0> N;
  int<lower=0,upper=1> y[N];
}
parameters {
  real<lower=0,upper=1> theta;
}
model {
  theta ~ beta(1,1);
  y ~ bernoulli(theta);
}
generated quantities {
  vector[N] log_lik;
  for (n in 1:N) {
        log_lik[n] = bernoulli_lpmf(y[n] | theta);
        }
}
"

bernoullidata = Dict("N" => 10, "y" => [0, 1, 0, 1, 0, 0, 0, 0, 0, 1])
stanmodel = Stanmodel(Variational(),name="bernoulli",model=bernoullistanmodel)

rc, chns, cnames = stan(stanmodel, bernoullidata, ProjDir,CmdStanDir=CMDSTAN_HOME)
plot(chns)
logliks = Array(chns)[:,1:bernoullidata["N"]] # Array for loo

# using RCall.jl
# https://mc-stan.org/loo/articles/loo2-with-rstan.html
# Exportar chns --  APENAS log-like.
# CHECAR R>help("loo.array")
# r_eff <- relative_eff(exp(chns))
# loo(chns, r_eff , cores = 3)
# print(x)
# compare(loo1,loo2)
