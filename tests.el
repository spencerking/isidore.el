(load "~/Documents/isidore.el/isidore.el") ; TODO: make relative path

(ert-deftest ert-test-factorial ()
  (should (eql (isi-factorial 0) 1))
  (should (eql (isi-factorial 1) 1))
  (should (eql (isi-factorial 3) 6))
  (should (eql (isi-factorial 4) 24))
  (should (eql (isi-factorial 10) 3628800))
  (should (eql (isi-factorial -1) -1))
  (should (eql (isi-factorial -3) -6))
  (should (eql (isi-factorial -5) -120)))

(ert-deftest ert-test-binomial-coefficient ()
  (should (eql (isi-binomial-coefficient 1 0) 1))
  (should (eql (isi-binomial-coefficient 1 1) 1))
  (should (eql (isi-binomial-coefficient 6 1) 6))
  (should (eql (isi-binomial-coefficient 6 2) 15))
  (should (eql (isi-binomial-coefficient 10 4) 210))
  (should (eql (isi-binomial-coefficient 100 2) 4950)))

(ert-deftest ert-test-fishers-exact-test ()
  (should (eql (isi-fishers-exact-test 3 1 1 3) 0.22857142857142856))
  (should (eql (isi-fishers-exact-test 1 11 9 3) 0.0013460761879122358))
  (should (eql (isi-fishers-exact-test 0 12 10 2) 3.3651904697805894e-05)))
