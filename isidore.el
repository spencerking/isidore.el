;; Arithmetic

(defun isi-sum (l)
  (apply '+ l))

(defun isi-product (l)
  (apply '* l))

(defun isi-square (n)
  (expt n 2))

(defun isi-factorial (n)
  (cond ((= 1 n) 1)
	((= 0 n) 1)
	((< n 0) (* n (isi-factorial (+ n 1))))
	(t (* n (isi-factorial (- n 1))))))

;; TODO: Verify n >= k >= 0
(defun isi-binomial-coefficient (n k)
  (/ (isi-factorial n) (* (isi-factorial k) (isi-factorial (- n k)))))

;(defun isi-euclidean-distance (x1 y1 x2 y2)
;  (- x2 x1) (- y2 y1)
;  )

;; Sets

;; TODO: Check if a comparison using delete-dups is faster
(defun isi-is-set (s)
  (setq ret t)
  (while s
    (if (not (memq (car s) (cdr s))) (setq ret t)
      (setq ret nil)
      (setq s nil))
    (setq s (cdr s)))
  ret)

;; TODO: Validate that s1 and s2 are valid sets
(defun isi-is-subset (s1 s2)
  (setq ret t)
  (while s1
    (if (memq (car s1) s2) (setq ret t)
      (setq ret nil)
      (setq s1 nil))
    (setq s1 (cdr s1)))
  ret)

;; TODO: Validate that s1 and s2 are valid sets
(defun isi-set-intersection (s1 s2)
  (setq intersection '())
  (while s1
    (if (memq (car s1) s2) (push (car s1) intersection))
    (setq s1 (cdr s1)))
  (delete-dups intersection)) ;; delete-dups is only necessary because we haven't validated the sets

(defun isi-set-union (s1 s2)
  (delete-dups (append s1 s2)))

;; Statistics

(defun isi-mean (l)
  (/ (isi-sum l) (length l)))

;; TODO: Return an error for single element lists
(defun isi-range (l)
  (abs (- (seq-max l) (seq-min l))))

;; a and c are the positive and negative counts for class 1
;; b and d are the positive and negative counts for class 2
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
