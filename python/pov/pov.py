from json import dumps
from typing import List


class Tree:
    def __init__(self, label: str, children=[]) -> None:
        self.label = label
        self.children = children

    def __dict__(self):
        return {self.label: [c.__dict__() for c in sorted(self.children)]}

    def __str__(self, indent=None):
        return dumps(self.__dict__(), indent=indent)

    def __lt__(self, other: str) -> bool:
        return self.label < other.label

    def __eq__(self, other):
        return self.__dict__() == other.__dict__()

    def __repr__(self):
        return f"self.label, [{[child.__repr__() for child in self.children]}]"

    def from_pov(self, from_node):
        path = self.find(from_node)
        if len(path) == 1:
            return self
        print('path: ', [p.label for p in path])
        new_tree = path[-1]
        parent = path[-2]
        # print('new_tree: ', new_tree.label, parent.label, [c.label for c in new_tree.children])
        # print('new_tree.parent: ', parent.label, [c.label for c in parent.children])
        # print('self.child: ', [c.label for c in self.children], self.children[1].children)
        # print('parent.children:', [c.label for c in parent.children], type(parent.children))
        parent.children.remove(new_tree)
        # print('parent.children:', [c.label for c in parent.children], type(parent.children))
        print(new_tree.label, 'new_tree.children:', new_tree.children, type(new_tree.children))
        print(parent.children[0].label, parent.children[0].children)
        new_tree.children.append(parent)
        print(new_tree.label, 'new_tree.children:', [c.label for c in new_tree.children], type(new_tree.children))
        print(parent.children[0].label, parent.children[0].children)
        print(new_tree.label, new_tree.children, '\n\n')
        return new_tree

    def path_to(self, from_node, to_node):
        pass

    def set_parent(self, parent):
        self.parent = parent

    def find(self, label):
        # path.append(self)
        if self.label == label:
            return self
        else:
            if len(self.children) == 0:
                return None
            else:
                for child in self.children:
                    resp = child.find(label)
                    if resp is not None:
                        return resp
        return None


if __name__ == "__main__":
    tree = Tree("parent", [Tree("x"), Tree("sibling")])
    ret_tree = tree.from_pov("x")

    print('returned: ', ret_tree.label, [c.label for c in ret_tree.children])
    for child in ret_tree.children:
        print(child.label, [c.label for c in child.children])
        for c in child.children:
            print(c.label, [c.label for c in c.children])
            for c2 in c.children:
                print(c2.label, [c.label for c in c2.children])
                for c3 in c2.children:
                    print(c3.label, [c.label for c in c3.children])
