context("blm")

test_that("We can create blm objects", {
  # Making of random data for the test
  alpha = 1; beta = 0.2;
  w0 = 0.2; w1 = 0.1; w2 = 0.5;
  d1 = data.frame(x=rnorm(5), z = rnorm(5));
  d1$y = rnorm(5, w0-w1*d1$x+w2*d1$z, 1/beta)
  m1 = y ~ x + z
  # Using make_prior and blm to construct a valid blm
  prior1 = make_prior(m1, alpha)
  blm1 = blm(m1, prior1, beta, d1)

  # Test cases

  # Testing if the error works, negative beta
  expect_error(blm(m1, prior1, -1, d1))
  # Testing the dimensions of the output
  expect_true(all(dim(blm1$Sigma) == 3))
  expect_true(all(dim(blm1$mean) == c(3,1)))

})