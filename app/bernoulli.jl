using CmdStan
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
"

bernoullidata = Dict("N" => 10, "y" => [0, 1, 0, 1, 0, 0, 0, 0, 0, 1])
stanmodel = Stanmodel(Variational(),name="bernoulli",model=bernoullistanmodel)

rc, chns, cnames = stan(stanmodel, bernoullidata, ProjDir, CmdStanDir=CMDSTAN_HOME)
# sim = stan(stanmodel, bernoullidata, ProjDir, CmdStanDir=CMDSTAN_HOME)
# sim_p = sim[1:1000, ["lp__", "theta", "accept_stat__"], :]
# p_plot = plot(sim, [:trace, :mean, :density, :autocor], legend=true)
