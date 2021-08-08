(defun isi-factorial (n)
  (cond ((= 1 n) 1)
	((= 0 n) 1)
	((< n 0) (* n (isi-factorial (+ n 1))))
	(t (* n (isi-factorial (- n 1))))))

; TODO: Verify n >= k >= 0
(defun isi-binomial-coefficient (n k)
  (/ (isi-factorial n) (* (isi-factorial k) (isi-factorial (- n k)))))

(defun isi-mean (l)
  (/ (apply '+ l) (length l)))

; TODO: Return an error for single element lists
(defun isi-range (l)
  (abs (- (seq-max l) (seq-min l))))

; a and c are the positive and negative counts for class 1
; b and d are the positive and negative counts for class 2
(defun isi-fishers-exact-test (a b c d)
  (/
   (float
    (*
     (isi-factorial (+ a b))
     (isi-factorial (+ c d))
     (isi-factorial (+ a c))
     (isi-factorial (+ b d))))
   (float
    (*
     (isi-factorial a)
     (isi-factorial b)
     (isi-factorial c)
     (isi-factorial d)
     (isi-factorial (+ a b c d))))))
