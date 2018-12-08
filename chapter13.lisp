;; tree
(subst 10 1 '(1 2 (3 2 1) ((1 1) (2 2))))
;; (10 2 (3 2 10) ((10 10) (2 2)))

;; set
(defparameter *set* ())
(adjoin 1 *set*)
*set*
;; NIL
(setf *set* (adjoin 1 *set*))
*set*
;; (1)

;; これと同じことしてくれるのが pushnew
(pushnew 2 *set*)
*set*
;; (2 1)
