(defun is-member (s x)
           (loop for y in s
                 if (eq x y) return T
                 finally (return nil)))

 (defun is-subset (b a)
           (loop for x in b
                 if (null (is-member a x)) return nil
                 finally (return T)))

(defun increase-in-dictionary (d x)
  (loop for y in d
        do (princ (car y))
        if (eq (car y) x)
        collect (cons (cons x (cons (+ (cadar y) 1) nil)) nil) into new-dict
        else collect y into new-dict
        finally (return new-dict)))

(defun make-enum (l)
           (let ((dict '()))
             (loop for x in l
                   do (setq dict (increase-in-dictionary dict x))
                   finally (return dict))))

(defun make-tuple (v1 v2)
  (cons v1 (cons v2 nil)))

(defun increase-in-dictionary (d x)
  (let ((has-x nil)
        (new-dict (loop for y in d
                        if (eq (car y) x) collect (make-tuple x (+ (cdar y) 1))
                        else collect y)))
    (if has-x new-dict (append new-dict (cons (make-tuple x 1) nil)))))
