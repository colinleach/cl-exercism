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
    in_root_index = inorder.index(root)
    left_in = inorder[:in_root_index]
    right_in = inorder[in_root_index + 1:]
    left_pre = preorder[1:1 + len(left_in)]
    right_pre = preorder[len(left_pre) + 1:]
    tree["l"] = tree_from_traversals(left_pre, left_in)
    tree["r"] = tree_from_traversals(right_pre, right_in)
    return tree
