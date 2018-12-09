(format t "~$" pi)
;; 3.14
(format t "~5$" pi)
;; 3.14159

(format t "~v$" 3 pi)
;; 3.142
(format t "~v$" 10 pi)
;; 3.1415926536

(format t "~,5f" pi) ;小数点以下を指定

(format t "~d" 1000000)

(format t "~:d" 1000000)

(format t "~@d" 1000000)

(format t "~@:d" 1000000)

(format nil "The value is: ~a" 10)

(format nil "The value is: ~a" "foo")

(format nil "The value is: ~a" (list 1 2 3))

;;(format t "Syntax error. Unexpected character: ~:c" char)

(format t "~@c" #\a)

(format nil "~:@c" (code-char 0))

(format nil "~12d" 1000000)

(format nil "~12,'0d" 1000000)

(format nil "~4,'0d-~2,'0d-~2,'0d" 2005 6 10)

(format nil "~:d" 1000000000)

(format nil "~,,'.,4:d" 1000000000)

(format nil "~x" 1000000)
(format nil "~o" 1000000)
(format nil "~b" 1000000)

(format nil "~r" 1000000)

;; floating point
(format nil "~f" pi)

(format nil "~,4f" pi)

(format nil "~e" pi)

(format nil "~,4e" pi)

(format nil "~$" pi)

(format nil "~2,4$" pi)

;; english language directives
(format nil "~r" 1234)

(format nil "~:r" 1234)

(format nil "~@r" 1234)

(format nil "~:@r" 1234)

(format nil "file~p" 1)

(format nil "file~p" 10)

(format nil "file~p" 0)

(format nil "~r file~:p" 1)

(format nil "~r file~:p" 10)

(format nil "~r file~:p" 0)

(format nil "~r famil~:@p" 1)

(format nil "~r famil~:@p" 10)

(format nil "~r famil~:@p" 0)

(format nil "~(~a~)" "FOO")

(format nil "~(~@r~)" 124)

(format nil "~(~a~)" "tHe Quick BROWN foX")
(format nil "~@(~a~)" "tHe Quick BROWN foX")
(format nil "~:(~a~)" "tHe Quick BROWN foX")
(format nil "~:@(~a~)" "tHe Quick BROWN foX")

;; Conditional Formatting
(format nil "~[cero~;uno~;dos~]" 0)
(format nil "~[cero~;uno~;dos~]" 1)
(format nil "~[cero~;uno~;dos~]" 2)

(format nil "~[cero~;uno~;dos~:;mucho~]" 3)
(format nil "~[cero~;uno~;dos~:;mucho~]" 100)

(defparameter *list-etc*
  "~#[NONE~;~a~;~a and ~a~:;~a, ~a~]~#[~; and ~a~:;, ~a, etc~].")

(format nil *list-etc*)
(format nil *list-etc* 'a)
(format nil *list-etc* 'a 'b)
(format nil *list-etc* 'a 'b 'c)
(format nil *list-etc* 'a 'b 'c 'd)
(format nil *list-etc* 'a 'b 'c 'd 'e)

(format t "~:[FAIL~;pass~]" nil)
(format t "~:[FAIL~;pass~]" t)

(format nil "~@[x = ~a ~]~@[y = ~a~]" 10 20)
(format nil "~@[x = ~a ~]~@[y = ~a~]" 10 nil)
(format nil "~@[x = ~a ~]~@[y = ~a~]" nil 20)
(format nil "~@[x = ~a ~]~@[y = ~a~]" nil nil)

(format nil "~{~a, ~}" (list 1 2 3))

(format nil "~{~a~^, ~}" (list 1 2 3))

(format nil "~@{~a~^, ~}" (list 1 2 3))

(format nil "~{~a~#[~;, and ~:;, ~]~}" (list 1 2 3))

(defparameter *english-list*
  "~{~#[~;~a~;~a and ~a~:;~@{~a~#[~;, and ~:;, ~]~}~]~}")
(format nil *english-list* '())
(format nil *english-list* '(1))
(format nil *english-list* '(1 2))
(format nil *english-list* '(1 2 3))
(format nil *english-list* '(1 2 3 4))

(format nil "~r ~:*(~d)" 1) ; :* で~rで参照したやつをもう一度使える。
