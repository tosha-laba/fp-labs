import functools

def compose(f, g):
    return lambda x: f(g(x))

def foo():
    pass