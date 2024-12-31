from collections import namedtuple


Vertex = namedtuple('Vertex', ['row', 'col'])
Edge = namedtuple('Edge', ['start', 'end'])


def rectangles(lines):
    if not lines or not lines[0]:
        return 0

    if len(lines) < 2:
        return 0

    count = 0
    vertex_list = vertices(lines)
    hor_edges = horizontal_edges(vertex_list, lines)

    while len(hor_edges) > 0:
        top = hor_edges.pop(0)
        bottoms = [hor_edge for hor_edge in hor_edges
                   if hor_edge.start.col == top.start.col
                   and hor_edge.end.col == top.end.col
                   and test_edges(top, hor_edge, lines)]
        count += len(bottoms)
    return count


def vertices(lines):
    result = []
    for i, line in enumerate(lines):
        result += [Vertex(i, j) for j, ch in enumerate(line) if ch == '+']
    result.sort()
    return result


def horizontal_edges(vertex_list, lines):
    hor_edges = []
    for r in range(len(lines)):
        verts = [v for v in vertex_list if v.row == r]
        while len(verts) > 1:
            start = verts.pop(0)
            edges = [Edge(start=start, end=v) for v in verts]
            hor_edges += edges
    return hor_edges


def test_edges(upper, lower, lines):
    top = lines[upper.start.row][upper.start.col:upper.end.col + 1]
    bottom = lines[lower.start.row][lower.start.col:lower.end.col + 1]
    for side in (top, bottom):
        if not all([ch in ('+', '-') for ch in side]):
            return False
    left = [line[upper.start.col] for line in lines[upper.start.row:lower.start.row + 1]]
    right = [line[upper.end.col] for line in lines[upper.end.row:lower.end.row + 1]]
    for side in (left, right):
        if not all([ch in ('+', '|') for ch in side]):
            return False
    return True
