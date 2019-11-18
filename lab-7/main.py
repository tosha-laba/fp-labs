from functools import reduce
from sys import stdin

# Input
(parties, votes, _) = reduce(
    lambda a, c: \
        (a[0], a[1], True) if c == "VOTES:" else \
        (a[0] + [c], a[1], False) if a[2] == False else \
        (a[0], a[1] + [c], True),
    map(lambda s: s[:-1], stdin.readlines()[1:]),
    ([], [], False)
)

# Processing and output
print(
    *map(
        lambda x: x[0],
        filter(
            lambda x: len(votes) > 0 and x[1]/len(votes) >= 0.07,
            reduce(
                lambda a, c: a.update({c: a[c] + 1}) or a,
                votes,
                dict(map(lambda x: (x, 0), parties))
            ).items()
        )
    ),
    sep='\n'
)