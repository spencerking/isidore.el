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
