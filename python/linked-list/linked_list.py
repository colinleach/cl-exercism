class Node:
    def __init__(self, value, succeeding=None, previous=None):
        self.value = value
        self.succeeding = succeeding
        self.previous = previous


class LinkedList:
    def __init__(self):
        self.nodes = dict()
        self.first = None
        self.last = None
        self.pos = None

    def _make_node(self, value, succeeding=None, previous=None):
        newnode = Node(value, succeeding, previous)
        key = id(newnode)
        self.nodes[key] = newnode
        return key

    def push(self, value):
        key = self._make_node(value, None, self.last)
        if self.first is None:
            self.first = key
        if self.last is not None:
            self.nodes[self.last].succeeding = key
        self.last = key

    def pop(self):
        if len(self.nodes) == 0:
            raise IndexError("List is empty")
        to_pop = self.nodes[self.last]
        del self.nodes[self.last]
        self.last = to_pop.previous
        if self.last is not None:
            self.nodes[self.last].succeeding = None
        return to_pop.value

    def unshift(self, value):
        key = self._make_node(value, self.first, None)
        if self.last is None:
            self.last = key
        if self.first is not None:
            self.nodes[self.first].previous = key
        self.first = key

    def shift(self):
        if len(self.nodes) == 0:
            raise IndexError("List is empty")
        to_shift = self.nodes[self.first]
        del self.nodes[self.first]
        self.first = to_shift.succeeding
        if self.first is not None and self.first in self.nodes:
            self.nodes[self.first].previous = None
        return to_shift.value

    def delete(self, value):
        for k, n in self.nodes.items():
            if n.value == value:
                if n.previous is None:
                    self.first = n.succeeding
                else:
                    self.nodes[n.previous].succeeding = n.succeeding
                if n.succeeding is None:
                    self.last = n.previous
                else:
                    self.nodes[n.succeeding].previous = n.previous
                del self.nodes[id(n)]
                return
        raise ValueError("Value not found")

    def __iter(self):
        self.pos = self.first
        return self

    def __next__(self):
        if self.pos != None:
            node = self.nodes[self.pos]
            self.pos = node.succeeding
            return node
        else:
            raise StopIteration

    def __len__(self):
        return len(self.nodes)