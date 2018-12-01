(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))

;; こうしたい
;; (do-primes (p 0 19)
;;   (format t "~d " p))

(do ((p (next-prime 0) (next-prime (1+ p))))
    ((> p 19))
  (format t "~d " p))

(defmacro do-primes (var-and-range &body body)
  (let ((var (first var-and-range))
        (start (second var-and-range))
        (end (third var-and-range)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
         ((> ,var ,end))
       ,@body)))

(defmacro do-primes ((var start end) &body body)
  `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
       ((> ,var ,end))
     ,@body))

(do-primes (p 0 19)
  (format t "~d " p))
;; 2 3 5 7 11 13 17 19

(macroexpand-1
 '(do-primes (p 0 19)
   (format t "~d " p)))

;; C-c ret でも同じものがえられる
(do-primes (p 0 19)
  (format t "~d " p))
;; (DO ((P (NEXT-PRIME 0) (NEXT-PRIME (1+ P)))) ((> P 19)) (FORMAT T "~d " P))

(gensym)

(defmacro do-primes ((var start end) &body body)
  (let ((ending-value-name (gensym)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
          (,ending-value-name ,end))
         ((> ,var ,ending-value-name))
       ,@body)))

(do-primes (p 0 19)
  (format t "~d " p))

;; (DO ((P (NEXT-PRIME 0) (NEXT-PRIME (1+ P)))
;;      (#:G583 19))
;;     ((> P #:G583))
;;   (FORMAT T "~d " P))


(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(with-gensyms (a b c))
;; (LET ((A (GENSYM)) (B (GENSYM)) (C (GENSYM))))
(defmacro do-primes ((var start end) &body body)
  (with-gensyms (ending-value-name)
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var)))
          (,ending-value-name ,end))
         ,@body)))


(do-primes (p 0 19)
  (format t "~d " p))
