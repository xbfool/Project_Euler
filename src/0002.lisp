(defun fibonacci-iter (ret a b max)
  (if (> (+ a b) max)
      ret
      (fibonacci-iter
       (cons (+ a b) ret)
       b
       (+ a b)
       max)))

(defun fibonacci (max)
  (reverse
   (fibonacci-iter '(1) 1 1 max)))

(defun solution-0002 ()
  (reduce #'+ (remove-if #'oddp (fibonacci 4000000))))
