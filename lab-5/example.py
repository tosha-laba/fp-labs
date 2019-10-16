# ЛР 5
# Императивно определить матрицу

n, m = 5, 7
matrix = []
for i in range(n):
    matrix.append([])
    for j in range(m):
        matrix[i].append(i+j)

# Красиво вывести
print(matrix)

# Обработка матрицы (map, reduce, ...)




def shit(x=10):
    return x

piss = lambda x,y: x+y

print((lambda x=10: (lambda y=20: x+y))()())

def min(*args):
    res =   float("inf")
    for arg in args:
        if arg < res:
            res = arg
    return res

print(min(1))

print(*(2,4,5))

(a,b,c)=(1,2,3)

pr = lambda s:s

namenum = lambda x: (x == 1 and pr("one")) \
                or (x == 2 and pr("two")) \
                or (x == 3 and pr("three"))

print(namenum(3))

print([1,2,3])

def processing_ver_1(matrix):
    return list(map(lambda r, i: r[i], matrix, range(len(matrix))))


# def processing_ver_2(matrix):
#     return reduce(lambda x, y: x+y, matrix)
