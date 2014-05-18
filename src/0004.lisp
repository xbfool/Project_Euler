(defun palindromicp (x)
  (let ((x-str (write-to-string x)))
    (string= x-str (reverse x-str))))

(defun gen-3x3-numbers-list ()
  (sort
   (reduce #'append (loop for x from 100 to 999 collect
                         (loop for y from 100 to 999 collect (* x y))))
   #'>))

(defun solution-0004 ()
  (find-if #'palindromicp (gen-3x3-numbers-list)))
