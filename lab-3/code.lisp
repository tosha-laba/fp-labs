;; Exercise 15 (old)
(defun one-element-p (x)
  (and (listp x) (car x) (null (cdr x))))

(defun flat-helper (x in-depth)
           (cond
             ((atom x) x)
             ((and (one-element-p x) in-depth) (flat-helper (car x) T))
             (T (cons (flat-helper (car x) T) (flat-helper (cdr x) nil)))))

(defun flat (x)
  (flat-helper x nil))

;; Exercise 7
;; first-entry-helper - вспомогательная функция, необходимая для сокрытия накапливающегося параметра n. n - начальная глубина поиска
(defun first-entry-helper (x e n)
  (cond
    ((null x) nil) ;; Терминальная ветвь - если голова (или хвост) - пустой список - элемент не найден
    ((atom x) (if (eq x e) (- n 1) nil)) ;; Терминальная ветвь - если элемент - атом, тогда, если это атом x - результат n-1, иначе - элемент не найден
    (T (or (first-entry-helper (car x) e (+ n 1)) (first-entry-helper (cdr x) e n))))) ;; Рекурсивная ветвь - обрабатываем голову и хвост, если обработка в голове успешна - результат - искомая глубина, иначе - возвращаем результат обработки хвоста

;; first-entry ищет глубину, на которой находится первое вхождение атома e в список x
(defun first-entry (x e)
  (first-entry-helper x e 0)) ;; в качестве тела функции - обращение к функции first-entry-helper

; Exercise 15
;; one-element-p проверяет, является ли x списком из одного элемента
(defun one-element-p (x)
  (and (listp x) (car x) (null (cdr x))))

;; conj работает как cons, но вместо точечных пар формирует список (a b)
(defun conj (a b)
  (cond
    ((and (atom b) (null (null b))) (cons a (cons b nil))) ; Если b - атом, не равный nil, сконструировать список a:[b]
    (T (cons a b))))

; flatten в списке произвольной структуры каждый подсписок из одного атома заменяет на сам атом.
(defun flatten (x)
  (cond
    ((null x) nil)
    ((atom x) x)
    ((one-element-p x) (flatten (car x)))
    (T (conj (flatten (car x)) (flatten (cdr x))))))
