;; is-member проверяет, входит ли элемент x в множество s
(defun is-member (s x)
           (cond
             ((null s) nil) ;; Терминальная ветвь - если текущее подмножество пустое (вошли в пустой хвост списка) - элемента в нём нет - "ложь"
             ((eq x (car s)) T) ;; Терминальная ветвь - если обозреваемый элемент подмножества равен искомому (голова списка равна элементу x) - элемент в нём есть - "истина" 
             (T (is-member (cdr s) x)))) ;; Рекурсивная ветвь - если текущее (под)множество не пустое, но обозреваемый элемент не равен x, проверяем вхождение x в подмножество без обозреваемого элемента

;; is-subset проверяет, является ли множество B подмножеством A
 (defun is-subset (b a)
           (cond
             ((null b) T) ;; Терминальная ветвь - пустое множество входит в любое множество - "истина". (Но это не значит, что результат функции всегда "истина"!)
             (T (and ;; Рекурсивная ветвь - возвращает результат логического "И" для двух выражений:
                 (is-member a (car b)) ;; входит ли голова списка (обозреваемый элемент B) в множество A
                 (is-subset (cdr b) a))))) ;; входит ли хвост списка (подмножество B без обозреваемого элемента) в множество A

;; increase-in-dictionary представляет список d как коллекцию "(ключ значение)", если ключ x в d есть, увеличивает значение на 1, иначе, добавляет пару (ключ 1) в конец списка
(defun increase-in-dictionary (d x)
  (cond
    ((null d) (cons (list x 1) nil)) ;; Терминальная ветвь - хвост списка пуст - подсписка с головой-"ключом" нет => создаем такой подсписок
    ((eq (caar d) x) (cons (list x (+ (cadar d) 1)) (cdr d))) ;; Терминальная ветвь - первый элемент головы-подсписка равен "ключу" x => возвращаем список, где у головы второй элемент стал на 1 больше
    (T (cons (car d) (increase-in-dictionary (cdr d) x))))) ;; Рекурсивная ветвь - если ни одно из вышеописанных условий не выполнено, конструируем новый список, где голова та же, а хвост обрабатывается функцией

;; make-enum-helper - вспомогательная функция, необходимая, для сокрытия накапливающегося параметра d
(defun make-enum-helper (l d)
  (cond
    ((null l) d) ;; Терминальная ветвь - если хвост списка пустой - дошли до конца - возвращаем сформированный список
    (T (make-enum-helper (cdr l) (increase-in-dictionary d (car l)))))) ;; Рекурсивная ветвь - формируем список на основании хвоста l, накапливающийся параметр увеличивается за счет головы l

; make-enum строит список, определяющий, сколько раз встречается каждый элемент в списке l
(defun make-enum (l)
  (make-enum-helper l '())) ;; Обращение к вспомогательной функции, накапливающийся параметр - пустой список

;; Версия функции make-enum без использования накапливающегося параметра.
(defun make-enum-no-acc (l)
  (cond
    ((null l) nil) ;; Терминальная ветвь - если хвост списка l пуст - возвращаем пустой список
    (T (increase-in-dictionary (make-enum-no-acc (cdr l)) (car l))))) ;; Рекурсивная ветвь - увеличиваем в списке, получившемся при обработке хвоста l, голову l