import queue


class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """
    def __init__(self, message):
        self.message = message


class CircularBuffer:
    def __init__(self, capacity):
        self.capacity = capacity
        self.stored_count = 0
        self.pointer = None
        self.buffer = queue.Queue(capacity)

    def read(self):
        if self.buffer.empty():
            raise BufferEmptyException("Circular buffer is empty")
        return self.buffer.get()

    def write(self, data):
        if self.buffer.full():
            raise BufferFullException("Circular buffer is full")
        self.buffer.put(data)

    def overwrite(self, data):
        if self.buffer.full():
            _ = self.buffer.get()
        self.buffer.put(data)

    def clear(self):
        while not self.buffer.empty():
            _ = self.buffer.get()
