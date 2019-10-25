from functools import (reduce)


def flatten(l):
    """"
    flatten(iterable) -> list

    Возвращает список из итерируемого с 
    уровнем вложенности меньшим на
    один, чем у исходного итерируемого.
    """
    return [item for sublist in l for item in sublist]


def task_1_var_7(line=None, separator=None):
    # Заданная строка
    line = line or "The quick brown fox jumps over the lazy dog"
    # Разделитель для чередования с элементами списка
    separator = separator or "zIgZaG"

    print(line)
    print(separator)

    # Получить список слов из заданной строки (использовать метод строк split)
    words = [x for x in line.split()]
    print(words)

    # Получить новый список чередованием элементов списка и произвольной строки
    joined_words = flatten(map(lambda x: [x, separator], words))
    print(joined_words)
    
    # Получить новый список чередованием элементов списка и произвольной строки
    joined_words = flatten(map(lambda x: [x, separator], words))
    print(joined_words)
    
    # Получить список всех элементов, которые состоят из прописных букв
    lowercase_words = list(filter(str.islower, joined_words))
    print(lowercase_words)


def remove_greater_than(k, lst):
    """
    Вариант 24.

    Из данного списка удалить все элементы,
    которые являются списками длинной более K. 
    """
    return list(filter(lambda x: not isinstance(x, list) or len(x) <= k, lst))


def generate_strings(n, *chars):
    """
    Вариант 6.

    Задан набор символов и число n.
    Написать функцию, которая возвращает список
    всех строк длины n, состоящих из этих символов
    и не содержащих двух одинаковых символов, идущих
    подряд. Не допускается использование циклов.
    """
    return reduce(lambda a, c: [x+y for x in a for y in c if x[-1] != y], [chars]*(n-1), [*chars])
