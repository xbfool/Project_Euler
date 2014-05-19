(defun solution-0005 ()
  (apply #'lcm (loop for x from 1 to 20 collect x)))
