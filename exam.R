# Making of random data for the test
alpha = 1; beta = 1;
w0 = 0.4; w1 = 0.2; w2 = 0.1;
d1 = data.frame(x=rnorm(100), z = rnorm(100));
d1$y = rnorm(100, w0-w1*d1$x+w2*d1$z, 1/beta)
m1 = y ~ x + z

# Using make_prior and blm to construct a valid blm
prior1 = make_prior(m1, alpha)
blm1 = blm(m1, prior1, beta, d1)

# Printing, plotting and doing a summary
print(blm1)
plot(blm1)
summary(blm1)
