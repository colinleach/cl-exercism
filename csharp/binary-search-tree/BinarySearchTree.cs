using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class BinarySearchTree : IEnumerable<int>
{
    private bool _valueSet = false;

    public BinarySearchTree(int value)
    {
        Value = value;
        _valueSet = true;
    }

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

    public BinarySearchTree Left { get; private set; } = null;

    public BinarySearchTree Right { get; private set; } = null;

    public BinarySearchTree Add(int value)
    {
        if (value <= Value)
        {
            Left = Left == null ? new BinarySearchTree(value) : Left.Add(value);
        }
        else
        {
            Right = Right == null ? new BinarySearchTree(value) : Right.Add(value);
        }
        return this;
    }

    public IEnumerator<int> GetEnumerator()
    {
        if (Left != null)
        {
            foreach (int val in Left.AsEnumerable()) yield return val;
        }

        yield return Value;
        
        if (Right != null)
        {
            foreach (int val in Right.AsEnumerable()) yield return val;
        }
    }

    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
}