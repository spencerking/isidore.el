(load "~/Documents/isidore.el/isidore.el") ; TODO: make relative path

(ert-deftest ert-test-factorial ()
  (should (eql (factorial 0) 1))
  (should (eql (factorial 1) 1))
  (should (eql (factorial 3) 6))
  (should (eql (factorial 4) 24))
  (should (eql (factorial 10) 3628800))
  (should (eql (factorial -1) -1))
  (should (eql (factorial -3) -6))
  (should (eql (factorial -5) -120)))

(ert-deftest ert-test-binomial-coefficient ()
  (should (eql (binomial-coefficient 1 0) 1))
  (should (eql (binomial-coefficient 1 1) 1))
  (should (eql (binomial-coefficient 6 1) 6))
  (should (eql (binomial-coefficient 6 2) 15))
  (should (eql (binomial-coefficient 10 4) 210))
  (should (eql (binomial-coefficient 100 2) 4950)))
