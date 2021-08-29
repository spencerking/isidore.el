(load "~/Documents/isidore.el/isidore.el") ;; TODO: make relative path

(ert-deftest ert-test-sum ()
  (should (eql (isi-sum '(0)) 0))
  (should (eql (isi-sum '(1)) 1))
  (should (eql (isi-sum '(1 2)) 3))
  (should (eql (isi-sum '(-1 100)) 99))
  (should (eql (isi-sum '(1 2 3 4 5 6 7 8 9 10)) 55))
  (should (eql (isi-sum '(-12 3 -5 -76)) -90)))

(ert-deftest ert-test-product ()
  (should (eql (isi-product '(0)) 0))
  (should (eql (isi-product '(1)) 1))
  (should (eql (isi-product '(0 5 6 7)) 0))
  (should (eql (isi-product '(2 2 3)) 12))
  (should (eql (isi-product '(-1 12)) -12))
  (should (eql (isi-product '(5 10 2)) 100))
  (should (eql (isi-product '(12 -12 3)) -432))
  (should (eql (isi-product '(1.0)) 1.0))
  (should (eql (isi-product '(1.1 2 3)) 6.6000000000000005))
  (should (eql (isi-product '(12 3.75 -1)) -45.0)))

(ert-deftest ert-test-square ()
  (should (eql (isi-square 0) 0))
  (should (eql (isi-square 1) 1))
  (should (eql (isi-square -1) 1))
  (should (eql (isi-square 2) 4))
  (should (eql (isi-square -2) 4))
  (should (eql (isi-square 10) 100))
  (should (eql (isi-square 100) 10000)))

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

(ert-deftest ert-test-is-set ()
  (should (eql (isi-is-set '()) t))
  (should (eql (isi-is-set '(1)) t))
  (should (eql (isi-is-set '(1 2 3 60 400 1002)) t))
  (should (eql (isi-is-set '("a" "b" "c" "w" "x" "y" "z")) t))
  (should (eql (isi-is-set '(2 2 2)) nil))
  (should (eql (isi-is-set '(2 2 2 3 4 5)) nil))
  )

(ert-deftest ert-test-is-subset ()
  (should (eql (isi-is-subset '() '(1)) t))
  (should (eql (isi-is-subset '() '(1 2 3 4 5 1000)) t))
  (should (eql (isi-is-subset '(1) '(1)) t))
  (should (eql (isi-is-subset '(1) '(1 2)) t))
  (should (eql (isi-is-subset '(1) '(2 3 4)) nil))
  (should (eql (isi-is-subset '(2 3 6) '(2 3 4 5 6 7)) t))
  (should (eql (isi-is-subset '(1 2 3 6) '(2 3 4 5 6 7)) nil)))

(ert-deftest ert-test-set-intersection ()
  (should (equal (isi-set-intersection '(1) '(1)) '(1)))
  (should (equal (isi-set-intersection '(1) '(1 1 1)) '(1)))
  (should (equal (isi-set-intersection '(1 1) '(1 1 1)) '(1)))
  (should (equal (isi-set-intersection '(1 2 5) '(1 2 3 4 5)) '(5 2 1)))
  (should (equal (isi-set-intersection '(7 8 100 54) '(1 2 3 4 5)) '())))

(ert-deftest ert-test-set-union ()
  (should (equal (isi-set-union '() '()) '()))
  (should (equal (isi-set-union '() '(1)) '(1)))
  (should (equal (isi-set-union '(1) '(1)) '(1)))
  (should (equal (isi-set-union '(1) '(1 2)) '(1 2)))
  (should (equal (isi-set-union '(1) '(1 2 3.1)) '(1 2 3.1)))
  (should (equal (isi-set-union '(1 -5 6 7) '(1 2 3.1 54)) '(1 -5 6 7 2 3.1 54))))

(ert-deftest ert-test-set-difference ()
  (should (equal (isi-set-difference '() '()) '()))
  (should (equal (isi-set-difference '(1) '(1)) '()))
  (should (equal (isi-set-difference '(1) '()) '(1)))
  (should (equal (isi-set-difference '() '(1)) '()))
  (should (equal (isi-set-difference '(1 2 3) '(2 3 4)) '(1)))
  (should (equal (isi-set-difference '(2 3 4) '(1 2 3)) '(4)))
  (should (equal (isi-set-difference '(0 2 3 4 5.71 -12) '(1 2 3 -1 5.7 1000)) '(-12 5.71 4 0)))
  (should (equal (isi-set-difference '(1 2 3 4 5 6 7 8 9) '(1 2 3)) '(9 8 7 6 5 4)))
  (should (equal (isi-set-difference '(1 2 3) '(1 2 3 4 5 6 7 8 9)) '())))

(ert-deftest ert-test-set-symmetric-difference ()
  (should (equal (isi-set-symmetric-difference '() '()) '()))
  (should (equal (isi-set-symmetric-difference '(1) '(1)) '()))
  (should (equal (isi-set-symmetric-difference '(1) '()) '(1)))
  (should (equal (isi-set-symmetric-difference '() '(1)) '(1)))
  (should (equal (isi-set-symmetric-difference '() '(1 2 3)) '(3 2 1)))
  (should (equal (isi-set-symmetric-difference '(1 2 3) '()) '(3 2 1)))
  (should (equal (isi-set-symmetric-difference '(1 2 3) '(2 3 4)) '(4 1)))
  (should (equal (isi-set-symmetric-difference '(1 2 3) '(4 5 6)) '(6 5 4 3 2 1)))
  (should (equal (isi-set-symmetric-difference '(1 2 3) '(3 4 5 6)) '(6 5 4 2 1)))
  (should (equal (isi-set-symmetric-difference '(1 2 3 -7.6 5.1) '(3 4 5 6)) '(6 5 4 5.1 -7.6 2 1))))

(ert-deftest ert-test-mean ()
  (should (eql (isi-mean '(0)) 0))
  (should (eql (isi-mean '(1)) 1))
  (should (eql (isi-mean '(1 1)) 1))
  (should (eql (isi-mean '(1 2 3)) 2))
  (should (eql (isi-mean '(10 47 3 812)) 218))
  (should (eql (isi-mean '(1.1)) 1.1))
  (should (eql (isi-mean '(1.1 12 2 0 57 6.4)) 13.083333333333334))
  (should (eql (isi-mean '(0.1 -5 2 -1)) -0.9750000000000001)))

(ert-deftest ert-test-range ()
  (should (eql (isi-range '(1 0)) 1))
  (should (eql (isi-range '(0 1)) 1))
  (should (eql (isi-range '(-5 -100)) 95))
  (should (eql (isi-range '(2 10 11 21 23 23 22 38 38)) 36))
  (should (eql (isi-range '(2 10 11 21 23 23 22 38 38 -38)) 76)))

(ert-deftest ert-test-fishers-exact-test ()
  (should (eql (isi-fishers-exact-test 3 1 1 3) 0.22857142857142856))
  (should (eql (isi-fishers-exact-test 1 11 9 3) 0.0013460761879122358))
  (should (eql (isi-fishers-exact-test 0 12 10 2) 3.3651904697805894e-05)))
