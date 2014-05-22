(defun solution-0009 ()
  (remove 'nil
          (loop for a from 0 to 1000 collect
               (loop for b from 0 to (- 1000 a) 
                  when (= (+ (* a a) (* b b)) (* (- 1000 a b) (- 1000 a b)))
                  collect (* a b (- 1000 a b))))))
