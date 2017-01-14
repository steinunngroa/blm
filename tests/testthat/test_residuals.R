context("residuals")

test_that("testing the function residuals.blm", {
  # Making of random data for the test
  alpha = 1; beta = 0.2;
  w0 = 0.2; w1 = 0.1; w2 = 0.5;
  d1 = data.frame(x=rnorm(5), z = rnorm(5));
  d1$y = rnorm(5, w0-w1*d1$x+w2*d1$z, 1/beta)
  m1 = y ~ x + z
  # Using make_prior and blm to construct a valid blm
  prior1 = make_prior(m1, alpha)
  blm1 = blm(m1, prior1, beta, d1)
  res1 = residuals(blm1)

  # Test cases

  # Testing that the residuals are of the right type
  expect_true(class(res1) == "matrix")
  # Testing that the output is not an error
  expect_error(residuals(blm1), NA)
  # Testing that the length of the output is correct
  expect_true(length(res1) == 5)
})