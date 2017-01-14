context("deviance")

test_that("testing the function deviance.blm", {
  # Making of random data for the test
  alpha = 1; beta = 0.2;
  w0 = 0.2; w1 = 0.1; w2 = 0.5;
  d1 = data.frame(x=rnorm(5), z = rnorm(5));
  d1$y = rnorm(5, w0-w1*d1$x+w2*d1$z, 1/beta)
  m1 = y ~ x + z
  # Using make_prior and blm to construct a valid blm
  prior1 = make_prior(m1, alpha)
  blm1 = blm(m1, prior1, beta, d1)
  dev1 = deviance(blm1)

  # Test cases

  # Testing that the deviance is positive
  expect_false(dev1 < 0)
  # Testing that we output the right class
  expect_true(class(dev1) == "numeric")
  # Testing that the output is not an error
  expect_error(deviance(blm1), NA)
  # Testing if the output is NULL
  expect_false(is.null(dev1))

  # Make a flawed blm:
  blm1$beta = NULL
  # Call deviance with that blm to get an error
  expect_error(deviance(blm1))
})