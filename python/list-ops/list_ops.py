def append(list1, list2):
    return list1 + list2


def concat(lists):
    result = []
    for item in lists:
        result += item
    return result


def filter(function, input_list):
    return [item for item in input_list if function(item)]


def length(input_list):
    return sum(1 for item in input_list)


def map(function, input_list):
    return [function(item) for item in input_list ]


def foldl(function, input_list, initial):
    result = initial
    for item in input_list:
        result = function(result, item)
    return result


def foldr(function, input_list, initial):
    return foldl(function, input_list[::-1], initial)


def reverse(input_list):
    return input_list[::-1]
