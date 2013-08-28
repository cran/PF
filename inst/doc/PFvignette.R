### R code from vignette source 'PFvignette.Rnw'

###################################################
### code chunk number 1: PFvignette.Rnw:48-50
###################################################
require(PF)
RRsc(c(4,24,12,28))


###################################################
### code chunk number 2: PFvignette.Rnw:66-68
###################################################
RRotsst(c(4,24,12,28))
RRtosst(c(4,24,12,28))


###################################################
### code chunk number 3: PFvignette.Rnw:81-84
###################################################
RRstr(cbind(y,n) ~ tx + cluster(clus), Table6 , pf = F)
# Data matrix input:
# RRstr(Y = table6, pf = F)


###################################################
### code chunk number 4: PFvignette.Rnw:100-103
###################################################
RRmh(cbind(y,n) ~ tx + cluster(clus), Table6 , pf = F)
# Data matrix input:
# RRmh(Y = table6, pf = F)


###################################################
### code chunk number 5: PFvignette.Rnw:113-115
###################################################
bird.fit <- glm(cbind(y,n-y) ~ tx - 1, binomial, bird)
RRor(bird.fit)


###################################################
### code chunk number 6: PFvignette.Rnw:131-133
###################################################
phiWt(bird.fit, fit.only = F)$phi
summary(update(bird.fit, family = quasibinomial))$disp


###################################################
### code chunk number 7: PFvignette.Rnw:140-142
###################################################
# model weighted by phi hat
RRor(phiWt(bird.fit))


###################################################
### code chunk number 8: PFvignette.Rnw:149-151
###################################################
# model with separate phi for vaccinates and controls
RRor(phiWt(bird.fit, subset.factor = bird$tx))


###################################################
### code chunk number 9: PFvignette.Rnw:158-160
###################################################
# subtract 2 degrees of freedom
RRor(phiWt(bird.fit, subset.factor = bird$tx), degf = 2)


###################################################
### code chunk number 10: PFvignette.Rnw:168-170
###################################################
# model weighted using tau hat
RRor(tauWt(bird.fit, subset.factor = bird$tx))


###################################################
### code chunk number 11: PFvignette.Rnw:177-180
###################################################
# different cluster sizes, same cluster fractions
birdm.fit <- glm(cbind(y,n-y) ~ tx - 1, binomial, birdm)
RRor(tauWt(birdm.fit, subset.factor = birdm$tx))


###################################################
### code chunk number 12: PFvignette.Rnw:191-198
###################################################
# Compare phi and tau weights
#  
phi.wts <-phiWt(birdm.fit,fit.only = F, subset.factor = birdm$tx)$weights
tau.wts <- tauWt(birdm.fit,fit.only = F, subset.factor = birdm$tx)$weights
w <- cbind(w.phi=phi.wts,w.tau=tau.wts,nw.phi=phi.wts*birdm$n,
		nw.tau=tau.wts*birdm$n)
print(cbind(birdm[,c(3,1,2)],round(w, 2)), row.names=F)


###################################################
### code chunk number 13: PFvignette.Rnw:210-214
###################################################
# model weighted with Rao-Scott weights
RRor(rsbWt(birdm.fit, subset.factor = birdm$tx))
# just the design effect estimates
rsb(birdm$y, birdm$n, birdm$tx)$d


###################################################
### code chunk number 14: PFvignette.Rnw:225-227
###################################################
RRlsi(c(4,24,12,28))
RRlsi(c(4,24,12,28), use.alpha = T)


###################################################
### code chunk number 15: PFvignette.Rnw:239-240
###################################################
IDRsc(c(26,204,10,205), pf = F)


###################################################
### code chunk number 16: PFvignette.Rnw:250-252
###################################################
IDRlsi(c(26,204,10,205), pf = F)
IDRlsi(c(26,204,10,205), pf = F, use.alpha = T)


