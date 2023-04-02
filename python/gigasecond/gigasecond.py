from datetime import timedelta

_delta = timedelta(seconds=1e9)


def add(moment):
    return moment + _delta
