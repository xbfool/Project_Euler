(defun modp (x y)
  (let ((rem (mod x y)))
    (if (= rem 0)
        t
        nil)))

(defun primep (x primelist)
  (notany #'(lambda (y) (and (> x y) (modp x y))) primelist))

(defun gen-prime-list-iter(list number max)
  (if (> number max)
      list
      (if (primep number list)
          (gen-prime-list-iter (cons number list) (+ number 1) max)
          (gen-prime-list-iter list (+ number 1) max))))


(defun gen-prime-list (max)
  (reverse (gen-prime-list-iter '(2) 3 max)))

(defun get-prime-factor-iter(factor-list start number)
  (if (> start number)
      factor-list
      (if (modp number start)
          (get-prime-factor-iter
           (cons start factor-list)
           (+ 1 start)
           (/ number start))
          (get-prime-factor-iter
           factor-list
           (+ 1 start)
           number))))


(defun solution-0003 ()
  (first (get-prime-factor-iter '() 2 600851475143)))
