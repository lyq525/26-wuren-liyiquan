;; Auto-generated. Do not edit!


(when (boundp 'homework::linearVelocity)
  (if (not (find-package "HOMEWORK"))
    (make-package "HOMEWORK"))
  (shadow 'linearVelocity (find-package "HOMEWORK")))
(unless (find-package "HOMEWORK::LINEARVELOCITY")
  (make-package "HOMEWORK::LINEARVELOCITY"))

(in-package "ROS")
;;//! \htmlinclude linearVelocity.msg.html


(defclass homework::linearVelocity
  :super ros::object
  :slots (_linear ))

(defmethod homework::linearVelocity
  (:init
   (&key
    ((:linear __linear) 0.0)
    )
   (send-super :init)
   (setq _linear (float __linear))
   self)
  (:linear
   (&optional __linear)
   (if __linear (setq _linear __linear)) _linear)
  (:serialization-length
   ()
   (+
    ;; float32 _linear
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _linear
       (sys::poke _linear (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _linear
     (setq _linear (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get homework::linearVelocity :md5sum-) "aeedbad760b28cbccafc1668ae4ed22c")
(setf (get homework::linearVelocity :datatype-) "homework/linearVelocity")
(setf (get homework::linearVelocity :definition-)
      "float32 linear
")



(provide :homework/linearVelocity "aeedbad760b28cbccafc1668ae4ed22c")


