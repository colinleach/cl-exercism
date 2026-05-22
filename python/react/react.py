class InputCell:
    def __init__(self, initial_value):
        self.value = initial_value
        self.callbacks = []


class ComputeCell:
    def __init__(self, inputs, compute_function):
        self.value = compute_function(*inputs)

    def add_callback(self, callback):
        self.callbacks.append(callback)

    def remove_callback(self, callback):
        self.callbacks.
    