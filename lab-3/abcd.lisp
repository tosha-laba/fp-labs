;;;; Welcome to Portacle, the Portable Common Lisp Environment.
;; For information on Portacle and how to use it, please read the website at
;;   https://github.com/Shinmera/portacle
;; or see the *portacle-help* buffer. You can switch to it by pressing this:
;;   Ctrl+h h
;; or by clicking on the *scratch* field below until it changes to read
;; *portacle-help*.
;;
;; You can use this buffer for notes and tinkering with small pieces of code.

(defun one-element-p (x)
  (and (listp x) (car x) (null (cdr x))))

(defun flat (x)
           (cond
             ((null x) nil)
             ((one-element-p x) (flat x))
             ((atom x) x)
             (T (cons (flat (car x)) 
                      (flat (cdr x))))))
