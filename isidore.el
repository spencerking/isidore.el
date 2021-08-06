(defun factorial (n)
  (cond ((= 1 n) 1)
	((= 0 n) 1)
	((< n 0) (* n (factorial (+ n 1))))
	(t (* n (factorial (- n 1))))))

; TODO: Verify n >= k >= 0
(defun binomial-coefficient (n k)
  (/ (factorial n) (* (factorial k) (factorial (- n k)))))

