#### Install R pkgs ####

if(!require(bruceR)) devtools::install_github("psychbruce/bruceR")
# Install other packages with 'install.packages()'


#### Multilevel Analysis ####

library(bruceR)
library(lmerTest)

data=sleepstudy
# a demo dataset from 'lme4' package
# see: ?sleepstudy
# see also: ?HLM_summary
str(data)

hlm.0=lmer(Reaction ~ (1 | Subject), data=data)
hlm.1=lmer(Reaction ~ Days + (1 | Subject), data=data)
hlm.2=lmer(Reaction ~ Days + (Days | Subject), data=data)

summary(hlm.0)
summary(hlm.1)
summary(hlm.2)

HLM_summary(hlm.0)
HLM_summary(hlm.1)
HLM_summary(hlm.2)

anova(hlm.0, hlm.1, hlm.2)

texreg::screenreg(list(hlm.0, hlm.1, hlm.2))


#### Visualize the Random Effects ####

lattice::xyplot(Reaction ~ Days | Subject, data,
                type=c("g", "p", "r"),
                index=function(x,y) coef(lm(y ~ x))[1],
                xlab="Days of sleep deprivation",
                ylab="Average reaction time (ms)", aspect="xy")


#### Another Example ####

str(carrots)  # another demo dataset

hlm=lmer(Preference ~ Sweetness + Frequency +
           Gender * Age + (Sweetness | Consumer) +
           (1 | Product),
         data=carrots)
HLM_summary(hlm)
model_check(hlm)
# There is serious multicollinearity!
# Gender and Age should be centered.

carrots.c=carrots
carrots.c$Gender=as.numeric(carrots.c$Gender)
carrots.c$Age=as.numeric(carrots.c$Age)
carrots.c$Frequency=as.numeric(carrots.c$Frequency)
carrots.c=grand_mean_center(carrots.c, c("Gender", "Age"))
hlm.c=lmer(Preference ~ Sweetness + Frequency +
             Gender * Age + (Sweetness | Consumer) +
             (1 | Product),
           data=carrots.c)
HLM_summary(hlm.c)
model_check(hlm.c)  # OK


#### Power Analysis in HLM ####

library(simr)

## 'data': can be obtained from a pilot study or by making up
hlm.p=lmer(Reaction ~ Days + (Days | Subject), data=data)
summary(hlm.p)  # b(Days) = 10.467

## 'nsim': number of simulations (default is 1000, much slower)
powerSim(hlm.p, test=fixed("Days"), nsim=20, seed=1)

## Change b to an expected effect size and n to a larger size
hlm.p.n=extend(hlm.p, along="Subject", n=100)
fixef(hlm.p.n)["Days"]=3.0
powerSim(hlm.p.n, test=fixed("Days"), nsim=20, seed=1)

## Estimate power at a range of sample sizes
powers=powerCurve(hlm.p.n, test=fixed("Days"), along="Subject",
                  breaks=seq(10, 100, 10), nsim=20, seed=1)
plot(powers)


#### Other Packages for HLM Power Analysis (NOT Suggested!) ####

library(sjstats)
d=0.3
samplesize_mixed(eff.size=d, power=0.8, k=30)
## The same as above:
# r=d2r(d)
# f2=r^2/(1-r^2)
# samplesize_mixed(eff.size=f2, power=0.8, k=30, df=1)


library(powerlmm)
shiny_powerlmm()

