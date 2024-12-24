def square_root(number):
    root = 0
    while root**2 < number:
        root += 1
    return root
