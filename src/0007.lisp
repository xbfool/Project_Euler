(defun is-prime (prime-list number)
  (if (not prime-list)
      t
      (let ((iter (car prime-list)))
        (if (> (* iter iter) number)
            t
            (if (= 0 (mod number iter))
                nil
                (is-prime (cdr prime-list) number))))))

(defun nth-prime (prime-list iter n)
  (if (= (length prime-list) n)
      (car prime-list)
      (if (is-prime (reverse prime-list) iter)
          (nth-prime (cons iter prime-list) (+ iter 1) n)
          (nth-prime prime-list (+ iter 1) n))))

(defun solution-0007 ()
  (nth-prime '(2) 3 10001))
