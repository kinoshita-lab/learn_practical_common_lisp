;; Reading File Data
(let ((in (open "./test.txt")))
  (format t "~a~%" (read-line in))
  (close in))


(let ((in (open "./atest.txt" :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
       while line do (format t "~a~%" line))
    (close in)))

(let ((in (open "./test.txt" :element-type '(unsigned-byte 8))))
  (when in
    (loop for line = (read-byte in nil)
       while line do (format t "~a~%" line))
    (close in)))

;; File Output
(close (open "./output.txt" :direction :output :if-exists :supersede))

(pathname-device (pathname "/foo/bar/baz.txt"))

(make-pathname
 :directory '(:absolute "foo" "bar")
 :name "baz"
 :type "txt")

(merge-pathnames #p "foo/bar/html" #p"/www/html/")

(enough-namestring #p"/www/html/foo/bar.html" #p"/www/")
