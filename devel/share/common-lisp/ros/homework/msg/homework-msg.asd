
(cl:in-package :asdf)

(defsystem "homework-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "linearVelocity" :depends-on ("_package_linearVelocity"))
    (:file "_package_linearVelocity" :depends-on ("_package"))
  ))