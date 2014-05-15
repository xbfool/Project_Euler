(defun build-number-list-help (ret start end)
  (if (> start end)
      (reverse ret)
      (build-number-list-help (cons start ret) (+ 1 start) end)))

(defun build-number-list (max)
  (build-number-list-help '() 1 max))

(defun my-floor (x)
  (values (floor x)))

(defun build-number-list-mul (base max)
  (mapcar #'(lambda (x) (* x base))
          (build-number-list
           (my-floor
            (/ max base)))))

(defun merge-list (list1 list2)
  (reverse
   (reduce
    #'(lambda (x y)
        (if
         (and
          (consp x)
          (= y (car x)))
         x
         (cons y x)))
    (merge 'list list1 list2 #'<)
    :initial-value '())))

(defun solution-0001 ()
  (reduce #'+
          (merge-list
           (build-number-list-mul 3 999)
           (build-number-list-mul 5 999))))

