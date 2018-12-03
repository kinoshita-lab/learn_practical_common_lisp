;; vector
(vector)
(vector 1 2 3)
#(1 2 3)

#("unko" 1 2)

(make-array 5 :initial-element nil)

(make-array 5 :fill-pointer 0)

(defparameter *x* (make-array 5 :fill-pointer 0))

(vector-push 'a *x*)
*x*                                         ; #(A)

(vector-push 'b *x*)
*x* ; #(A B)


(make-array 5 :fill-pointer 0 :adjustable t) ; variable length

(defparameter *x* #(1 2 3))

(length *x*)
(elt *x* 0)
(elt *x* 4)

(setf (elt *x* 0) 10)


(remove-if-not #'(lambda (x) (char= (elt x 0) #\f))
               #("foo" "bar" "baz" "foom"))

;; hash
(defparameter *h* (make-hash-table))
(gethash 'foo *h*)
;; NIL
;; NIL
(setf (gethash 'foo *h*) 'quux)
(gethash 'foo *h*)
;; QUUX
;; T


(defun show-value (key hash-table)
  (multiple-value-bind (value present) (gethash key hash-table)
    (if present
        (format nil "Value ~a actually present." value)
        (format nil "Value ~a because key not found." value))))

(setf (gethash 'bar *h*) nil)
(show-value 'foo *h*)
(show-value 'bar *h*)
(show-value 'baz *h*)

;; hash table iteration

(maphash #'(lambda (k v) (format t "~a => ~a~%" k v)) *h*)

;; loopも使える
(loop for k being the hash-keys in *h* using (hash-value v)
     do (format t "~a => ~a~%" k v))
