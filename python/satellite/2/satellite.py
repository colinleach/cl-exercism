def tree_from_traversals(preorder, inorder):
    if len(preorder) != len(inorder):
        raise ValueError("traversals must have the same length")

    if set(preorder) != set(inorder):
        raise ValueError("traversals must have the same elements")

    if len(preorder) != len(set(preorder)):
        raise ValueError("traversals must contain unique items")

    if not preorder:
        return {}

    root = preorder[0]
    tree = {"v": root}
    inx = inorder.index(root)
    tree["l"] = tree_from_traversals(preorder[1:1 + inx], inorder[:inx])
    tree["r"] = tree_from_traversals(preorder[inx + 1:], inorder[inx + 1:])
    return tree
