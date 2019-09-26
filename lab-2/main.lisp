;;;; Welcome to Portacle, the Portable Common Lisp Environment.
;; For information on Portacle and how to use it, please read the website at
;;   https://github.com/Shinmera/portacle
;; or see the *portacle-help* buffer. You can switch to it by pressing this:
;;   Ctrl+h h
;; or by clicking on the *scratch* field below until it changes to read
;; *portacle-help*.
;;
;; You can use this buffer for notes and tinkering with small pieces of code.

 (defun enumerate (x n)
           (cond
             ((null x) nil)
             (T (cons (+ n 1) (enumerate (cdr x) (+ n 1))))))

(defun find-n (x n cur)
  (cond
    ((null x) nil)
    ((= n (+ cur 1)) (car x))
    (T (find-n (cdr x) n (+ cur 1)))))

(defun denumerate (x p)
  (cond
    ((null x) nil)
    (T (cons (find-n p (car x) 0) (denumerate (cdr x) p)))))
