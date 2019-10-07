(defun is-member (s x)
           (loop for y in s
                 if (eq x y) return T
                 finally (return nil)))

;; Конечный вариант
;; is-member проверяет, входит ли элемент x в множество s
(defun is-member (s x)
  (let ((retval nil))
    (dolist (y s)
      (when (eq x y)
        (setq retval T)
        (return)))
    retval))

;; is-subset проверяет, является ли множество B подмножеством A
(defun is-subset (b a)
  (let ((retval T))
    (dotimes (i (length b))
      (when (null (is-member a (car b)))
        (setq retval nil)
        (return))
      (setq b (cdr b)))
    retval))

(defun increase-hash (key table)
  (let ((ref (gethash key table)))
    (if (null ref) (setf (gethash key table) 1)
        (incf (gethash key table)))))

;; Макрос increase-hash увеличивает значение хранящееся в хэш-таблице hash
;; по ключу key на 1, если ключа key нет, добавляет пару с заданным ключом и значением 1
(defmacro increase-hash (key table)
  (let ((ref `(gethash ,key ,table)))
    `(if (null ,ref) (setf ,ref 1)
         (incf ,ref))))

;; make-enum строит список, определяющий, сколько раз встречается каждый элемент в списке l
(defun make-enum (l)
  (do ((dict (make-hash-table)) ; Блок переменных
       (retval '()))
      ;; Блок завершающих условий
      ((null l) ; Если список l пуст - преобразуем хэш-таблицу dict в список retval, возвращаем retval
       (maphash (lambda (key value)
                  (setq retval (append retval (list (list key value)))))
                dict)
       retval)
    (increase-hash (car l) dict) ; Иначе - увеличить значение по ключу из головы l
    (setq l (cdr l)))) ; и убрать из l голову

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
