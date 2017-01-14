context("predict")

test_that("We can make prediction using BLM and optional new data.", {
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

  # Testing if the error works
  expect_error(predict(NULL, d1))
  # Testing the class of the output
  expect_true(class(predict(blm1, d1)) == "data.frame")

  # Make a flawed blm:
  blm1$beta = NULL
  # Call predict with that blm to get an error
  expect_error(predict(blm1, d1))

})