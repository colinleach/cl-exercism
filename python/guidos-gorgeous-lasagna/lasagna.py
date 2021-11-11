EXPECTED_BAKE_TIME = 40 # mins
PREPARATION_TIME = 2    # mins/layer

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers):
    """Calculate the prep time.

    :param number_of_layers: int layers to add.
    :return: int total prep time

    Function that takes the layer count and returns total prep time
    based on the `PREPARATION_TIME` per layer.
    """

    return PREPARATION_TIME * number_of_layers

def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the total elapsed time, prep + baking.

    :param number_of_layers: int layers to add.
    :param elapsed_bake_time: int baking time already elapsed.
    :return: int total elapsed time

    Function that takes the layer count and elapsed bake time,
    returns total elapsed time.
    """

    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
