using System;
using System.Collections;
using System.Collections.Generic;

public class BinarySearchTree : IEnumerable<int>
{
    private bool _valueSet = false;
    private BinarySearchTree _left = null;
    private BinarySearchTree _right = null;

    public BinarySearchTree(int value) => Value = value;

    public BinarySearchTree(IEnumerable<int> values)
    {
        foreach (int val in values)
        {
            if (_valueSet) Add(val);
            else
            {
                Value = val;
                _valueSet = true;
            }
        }
    }

    public int Value { get; }

    public BinarySearchTree Left => _left;

    public BinarySearchTree Right => _right;

    public BinarySearchTree Add(int value)
    {
        if (value < Value)
        {
            if (_left == null) _left = new BinarySearchTree(value);
            else _left.Add(Value);
        }
        else
        {
            if (_right == null) _right = new BinarySearchTree(value);
            else _right.Add(Value);
        }

        return this;
    }

    public IEnumerator<int> GetEnumerator()
    {
        throw new NotImplementedException("You need to implement this function.");
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        throw new NotImplementedException("You need to implement this function.");
    }
}