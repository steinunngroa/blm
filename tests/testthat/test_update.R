context("update")

test_that(" we can update a prior with new data and obtain a posterior", {

  # Making of random data for the test
  alpha = 1; beta = 0.2;
  w0 = 0.2; w1 = 0.1; w2 = 0.5;
  d1 = data.frame(x=rnorm(5), z = rnorm(5));
  d1$y = rnorm(5, w0-w1*d1$x+w2*d1$z, 1/beta)
  m1 = y ~ x + z
  # Calling make_prior to get a prior dist for the update function
  prior1 = make_prior(m1, alpha)
  updatetest = update(m1, prior1, beta, d1)

  # Test cases

  # Testing if the error works, negative beta
  expect_error(update(m1, prior1, -1, d1))
  # Testing that the output gives the right class
  expect_true(class(updatetest) == "list")
  # Testing that the output of Sigma is correct
  expect_true(all(dim(updatetest$Sigma) == 3))
  # Testing that the output is not an error
  expect_error(updatetest, NA)

})