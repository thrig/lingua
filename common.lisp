; from PAIP (mostly)

(defparameter *grammar* nil)

(defun mappend (function list) (apply #'append (mapcar function list)))
(defun random-elt (choices) (elt choices (random (length choices))))

(defun rule-lhs (rule) (first rule))
(defun rule-rhs (rule) (rest (rest rule)))
(defun rewrites (category) (rule-rhs (assoc category *grammar*)))

(defun generate (phrase)
  (if (listp phrase)
    (mappend #'generate phrase)
    (let ((choices (rewrites phrase)))
      (if (null choices)
        (list phrase)
        (generate (random-elt choices))))))

(defmacro repeat (count &body body)
  (let ((repnum (gensym)))
    `(progn
       (if (or (not (integerp ,count)) (< ,count 1))
         (error "repeat count must be positive integer"))
       (do ((,repnum ,count (1- ,repnum)))
         ((< ,repnum 1) (values))
         ,@body))))
