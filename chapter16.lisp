;; この章のやつは動かない
(defgeneric withdraw (account amount)
  (:documentation "amountで指定された額を口座から引きおとす
  現在の残高がamountより少なかったらエラーを通知する"))

(defmethod withdraw ((account bank-account) amount)
  (when (< (balance account) amount)
    (error "Account overdrawn."))
  (decf (balance account amount)))

(defmethod withdraw ((account checking-account) amount)
  (let ((overdraft (- amount (balance account))))
    (when (plusp overdraft)
      (withdraw (overdraft-account account) overdraft)))
  (call-next-method))
