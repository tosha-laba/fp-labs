def main():
    print("help (h) - справка, quit (q) - выход")
    while True:
        entered = input('> ').split(' ')
        command, args = entered[0], entered[1:]
        if command == "quit" or command == "q":
            break
        elif command == "domatrix":
            try:
                n = int(args[0])
                m = int(args[1]) if len(args) > 1 else None
                matrix = make_matrix(n, m)
                print("Матрица:")
                print_matrix(matrix)
                print("Список:")
                print(process_matrix(matrix))
            except:
                continue
        elif command == "help" or command == "h":
            print("Команды:\n"
                  "quit\t\t\tВыйти из программы.\n"
                  "domatrix n, &m\t\tСформировать и распечатать матрицу, "
                  "обработать её и вывести получившийся список.\n")
            continue

# Задание 1 (7)


def make_matrix(n, m=None):
    "Формирует матрицу по ее внешнему виду:"
    "|5   4  3  2  1|"
    "|6   7  8  9 10|"
    "|15 14 13 12 11|"
    # Если аргумент m опускается,
    # подразумевается, что матрица - квадратная
    if m is None:
        m = n

    matrix = []
    is_forward = False

    for i in range(n):
        matrix.append([])
        for j in range(m):
            matrix[i].append(i*n + (j+1 if is_forward else m-j))
        is_forward = not is_forward

    return matrix


def print_matrix(matrix):
    "Выводит матрицу в консоль"
    for r in matrix:
        for c in r:
            print('{:<10}'.format(c), end='')
        print()

# Задание 2 (9)


def process_matrix(matrix):
    "Обрабатывает матрицу по требованию:"
    "Вернуть одномерный список из 1-х, 2-х, 3-х элементов столбцов"
    cols = len(matrix[0]) if (len(matrix)) > 0 else 0
    rows = len(matrix)
    return list(map(lambda r, i: r[i], matrix, range(min(cols, rows))))


if __name__ == "__main__":
    main()
