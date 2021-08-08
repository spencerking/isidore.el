(defun isi-factorial (n)
  (cond ((= 1 n) 1)
	((= 0 n) 1)
	((< n 0) (* n (isi-factorial (+ n 1))))
	(t (* n (isi-factorial (- n 1))))))

; TODO: Verify n >= k >= 0
(defun isi-binomial-coefficient (n k)
  (/ (isi-factorial n) (* (isi-factorial k) (isi-factorial (- n k)))))

