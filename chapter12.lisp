(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))

(defparameter *cons* (cons 1 2))
*cons*

(setf (car *cons*) 10)
*cons*

(setf (cdr *cons*) 20)
*cons*
;; (10 . 20)

(defparameter *list* (list 1 2 3 4))
(nreverse *list*)
*list*
;; (1)

(defparameter *x* (list 1 2 3))
*x*
;; (1 2 3)
(nconc *x* (list 4 5 6))
*x*
;; (1 2 3 4 5 6)


(defun upto (max)
  (let ((result nil))
    (dotimes (i max)
      (push i result))
    (nreverse result)))
(upto 10)
;; (0 1 2 3 4 5 6 7 8 9)

;; これは？
(defun upto (max)
  (let ((result nil))
    (dotimes (i max)
      (push i result))
    (reverse result)))
(upto 10)
;; (0 1 2 3 4 5 6 7 8 9)
;; いっしょじゃん
;; 速さがちがうのかな。
;; timeで調べられるらしい

(defun upto-n (max)
  (let ((result nil))
    (dotimes (i max)
      (push i result))
    (nreverse result)))

(defun upto-l (max)
  (let ((result nil))
    (dotimes (i max)
      (push i result))
    (reverse result)))

(time (upto-n 1000))
;; 55,326 processor cycles
;;   0 bytes consed
(time (upto-l 1000))
;; 90,138 processor cycles
;; 32,768 bytes consed

;; おお ぜんぜんちがう

;; mapping
