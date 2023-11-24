def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """

    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    aliquot = sum(f for f in range(1, number // 2 + 1) if number % f == 0)
    if aliquot == number:
        return "perfect"
    if  aliquot < number:
        return "deficient"
    if  aliquot > number:
        return "abundant"
