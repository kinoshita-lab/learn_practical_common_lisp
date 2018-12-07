(defclass bank-account ()
  (customer-name
   balance))

(make-instance 'bank-account)

(defparameter *account* (make-instance 'bank-account))
(setf (slot-value *account* 'customer-name) "John Doe")
(setf (slot-value *account* 'balance) 1000)


(slot-value *account* 'customer-name)
;; "John Doe"
(slot-value *account* 'balance)
;; 1000

;; オブジェクトの初期化
(defclass bank-account ()
  ((customer-name
    :initarg :customer-name)
   (balance
    :initarg :balance
    :initform 0)))

(defparameter
    *account* (make-instance 'bank-account :customer-name "John Doe" :balance 1000))
(slot-value *account* 'customer-name)
(slot-value *account* 'balance)

(defparameter
    *account* (make-instance 'bank-account :customer-name "John Doe" ))
(slot-value *account* 'customer-name)
(slot-value *account* 'balance)

;; 初期値いれないとエラーにしたい時とか、評価される度になにかしたい時とか
(defvar *account-numbers* 0)
(defclass bank-account ()
  ((customer-name
    :initarg :customer-name
    :initform (error "Must supply a customer name."))
   (balance
    :initarg :balance
    :initform 0)
   (account-number
    :initform (incf *account-numbers*)))
  account-type) ;; account-typeは何もここでは初期化してない。 balanceの値を使って初期化したい。
;; で、こういうのを作る、と。コンストラクタでやってることが2つにわかれているイメージだろうか。

(defmethod initialize-instance :after ((account bank-account) &key)
  (let ((balance (slot-value account 'balance)))
    (setf (slot-value account 'account-type)
          (cond
            ((>= balance 100000) :gold)
            ((>= balance  50000) :silver)
            (t :bronze)))))

;; :opening-bonus-percentageを定義してあればこいつも追加で呼ばれる、とかも可能！
(defmethod initialize-instance :after ((account bank-account) &key opening-bonus-percentage)
  (when opening-bonus-percentage
    (incf (slot-value account 'balance)
          (* (slot-value account 'balance) (/ opening-bonus-percentage 100)))))


;; Accessor Functions
;; defun
(defun balance (account)
  (slot-value account 'balance))
(balance *account*)
;; 1000

;; defgeneric/defmethod
(defgeneric balance (account))

(defmethod balance ((account bank-account))
  (slot-value account 'balance))

(balance *account*)
;; 1000

;; setf defun
(defun (setf customer-name) (name account)
  (setf (slot-value account 'customer-name) name))
(macroexpand '(setf (customer-name *account*) "Sally Sue"))
;; setfのかたがきめられる
(setf (customer-name *account*) "Sally Sue")

;; setf defgeneric
(defgeneric (setf customer-name) (value account))
(defmethod (setf customer-name) (value (account bank-account))
  (setf (slot-value account 'customer-name) value))

(setf (customer-name *account*) "Un Ko")

(defgeneric customer-name (account))
(defmethod customer-name ((account bank-account))
  (slot-value account 'customer-name))
(customer-name *account*)
;; "Un Ko"

;;
(defparameter *account-numbers* 0)
(defclass bank-account ()
  ((customer-name
    :initarg :customer-name
    :initform (error "Must supply a customer name.")
    :accessor customer-name
    :documentation "Customer's name")
   (balance
    :initarg :balance
    :initform 0
    :reader balance
    :documentation "Current account balance")
   (account-number
    :initform (incf *account-numbers*)
    :reader account-number
    :documentation "Account number, unique within a bank.")
   (account-type
    :reader account-type
    :documentation "Type of account, one of :gold, :silver, or :bronze.")))

;; 試
(defparameter *account*
  (make-instance 'bank-account :customer-name "Hoge Fuga" :balance 10))

(customer-name *account*)
(setf (customer-name *account*) "un Ko") ;; すごく自然こうかきたくなるな。たしかに。
(customer-name *account*)



