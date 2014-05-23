(defun modp (x y)
  (let ((rem (mod x y)))
    (if (= rem 0)
        t
        nil)))

(defun new-list-1 (x primelist)
  (reverse
   (new-list-iter nil (sqrt x) (reverse primelist))))

(defun new-list-iter (ret x primelist)
  (if (not primelist)
      ret
      (if (< x (car primelist))
          ret
          (new-list-iter (cons (car primelist) ret) x (cdr primelist)))))
(defun new-list (x primelist)
  (remove-if
   #'(lambda (z) (< (sqrt x) z)) primelist))

(defun primep (x primelist)
  (notany #'(lambda (y) (modp x y)) (new-list-1 x primelist)))



(defun primep-1-iter (x primelist)
  (let ((xx (sqrt x)))
    (if (not primelist)
        t
        (if (> (car primelist) xx)
            t
            (if (modp x (car primelist))
                nil
                (primep-1-iter x (cdr primelist)))))))

(defun primep-1 (x primelist)
  (primep-1-iter x (reverse primelist)))
    
(defun gen-prime-list-iter(list number max)
  (if (> number max)
      list
      (if (primep-1 number list)
          (gen-prime-list-iter (cons number list) (+ number 2) max)
          (gen-prime-list-iter list (+ number 1) max))))


(defun gen-prime-list (max)
  (reverse (gen-prime-list-iter '(2) 3 max)))

(defun solution-0010 ()
  (apply #'+ (gen-prime-list 2000000)))
