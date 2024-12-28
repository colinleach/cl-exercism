class Record:
    def __init__(self, record_id, parent_id):
        self.record_id = record_id
        self.parent_id = parent_id


class Node:
    def __init__(self, node_id):
        self.node_id = node_id
        self.children = []


def BuildTree(records):
    if not records:
        return None

    ids = [rec.record_id for rec in records]
    if len(ids) != len(set(ids)) or any([n not in ids for n in range(len(ids))]):
        raise ValueError("Record id is invalid or out of order.")

    nodes = []

    for rec in records:
        if rec.parent_id == rec.record_id and rec.parent_id != 0:
            raise ValueError("Only root should have equal record and parent id.")
        if rec.parent_id > rec.record_id:
            raise ValueError("Node parent_id should be smaller than it's record_id.")

        new_node = Node(rec.record_id)
        new_node.parent_id = rec.parent_id
        nodes.append(new_node)
        
    nodes.sort(key=lambda n: n.node_id)

    for node in nodes:
        node.children = [n for n in nodes
                             if n.node_id != node.node_id and n.parent_id == node.node_id]
        node.children.sort(key=lambda n: n.node_id)

    return nodes[0]
