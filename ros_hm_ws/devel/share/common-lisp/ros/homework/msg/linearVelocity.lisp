; Auto-generated. Do not edit!


(cl:in-package homework-msg)


;//! \htmlinclude linearVelocity.msg.html

(cl:defclass <linearVelocity> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type cl:float
    :initform 0.0))
)

(cl:defclass linearVelocity (<linearVelocity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <linearVelocity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'linearVelocity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name homework-msg:<linearVelocity> is deprecated: use homework-msg:linearVelocity instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <linearVelocity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader homework-msg:linear-val is deprecated.  Use homework-msg:linear instead.")
  (linear m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <linearVelocity>) ostream)
  "Serializes a message object of type '<linearVelocity>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linear))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <linearVelocity>) istream)
  "Deserializes a message object of type '<linearVelocity>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<linearVelocity>)))
  "Returns string type for a message object of type '<linearVelocity>"
  "homework/linearVelocity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'linearVelocity)))
  "Returns string type for a message object of type 'linearVelocity"
  "homework/linearVelocity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<linearVelocity>)))
  "Returns md5sum for a message object of type '<linearVelocity>"
  "aeedbad760b28cbccafc1668ae4ed22c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'linearVelocity)))
  "Returns md5sum for a message object of type 'linearVelocity"
  "aeedbad760b28cbccafc1668ae4ed22c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<linearVelocity>)))
  "Returns full string definition for message of type '<linearVelocity>"
  (cl:format cl:nil "float32 linear~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'linearVelocity)))
  "Returns full string definition for message of type 'linearVelocity"
  (cl:format cl:nil "float32 linear~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <linearVelocity>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <linearVelocity>))
  "Converts a ROS message object to a list"
  (cl:list 'linearVelocity
    (cl:cons ':linear (linear msg))
))
