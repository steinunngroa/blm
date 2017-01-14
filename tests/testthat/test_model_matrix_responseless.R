context("model_matrix_responseless")

test_that("testing the model_matrix_responseless function", {

  # Making of random data for the test
  alpha = 1; beta = 0.2;
  w0 = 0.2; w1 = 0.1; w2 = 0.5;
  d1 = data.frame(x=rnorm(5), z = rnorm(5));
  d1$y = rnorm(5, w0-w1*d1$x+w2*d1$z, 1/beta)
  m1 = y ~ x + z
  # Making a responseless model matrix
  responseless1 = model_matrix_responseless(m1, d1)

  # Test cases

  # Testing if the error works, negative beta
  expect_error(model_matrix_responseless(m1, NULL))
  # Testing that the output gives the right class
  expect_true(class(responseless1) == "matrix")

})