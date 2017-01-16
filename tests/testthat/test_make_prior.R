context("make_prior")

test_that("testing that we can create a prior distribution", {
  # Making of random data for the test
  alpha = 1; beta = 0.2;
  w0 = 0.2; w1 = 0.1; w2 = 0.5;
  d1 = data.frame(x=rnorm(5), z = rnorm(5));
  d1$y = rnorm(5, w0-w1*d1$x+w2*d1$z, 1/beta)
  m1 = y ~ x + z
  # Make a prior distribution
  prior1 = make_prior(m1, alpha)

  # Test cases

  # Testing if the error works, negative alpha
  expect_error(make_prior(m1, -1))
  # Testing if the output has right dimensions
  expect_true(all(dim(prior1$Sigma) == 3))
  # Testing if the output has right class
  expect_true(class(prior1$mean) == "numeric")

})