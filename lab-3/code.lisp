;; Exercise 15
(defun one-element-p (x)
  (and (listp x) (car x) (null (cdr x))))

(defun flat-helper (x in-depth)
           (cond
             ((atom x) x)
             ((and (one-element-p x) in-depth) (flat-helper (car x) T))
             (T (cons (flat-helper (car x) T) (flat-helper (cdr x) nil)))))

(defun flat (x)
  (flat-helper x nil))

;; first-entry-helper - вспомогательная функция, необходимая для сокрытия накапливающегося параметра n. n - начальная глубина поиска
(defun first-entry-helper (x e n)
  (cond
    ((null x) nil) ;; Терминальная ветвь - если голова (или хвост) - пустой список - элемент не найден
    ((atom x) (if (eq x e) (- n 1) nil)) ;; Терминальная ветвь - если элемент - атом, тогда, если это атом x - результат n-1, иначе - элемент не найден
    (T (or (first-entry-helper (car x) e (+ n 1)) (first-entry-helper (cdr x) e n))))) ;; Рекурсивная ветвь - обрабатываем голову и хвост, если обработка в голове успешна - результат - искомая глубина, иначе - возвращаем результат обработки хвоста

;; first-entry ищет глубину, на которой находится первое вхождение атома e в список x
(defun first-entry (x e)
  (first-entry-helper x e 0)) ;; в качестве тела функции - обращение к функции first-entry-helper
