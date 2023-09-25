using System;
using System.Collections.Generic;

public class CircularBuffer<T>
{
    private Queue<T> _buff = new Queue<T>();
    private readonly int _capacity;
    
    public CircularBuffer(int capacity) => _capacity = capacity;

    public T Read()
    {
        if (_buff.Count == 0) throw new InvalidOperationException("buffer is empty");

        return _buff.Dequeue();
    }

    public void Write(T value)
    {
        if (_buff.Count == _capacity) throw new InvalidOperationException("buffer is full");
        _buff.Enqueue(value);
    }

    public void Overwrite(T value)
    {
        if (_buff.Count == _capacity) _buff.Dequeue();
        Write(value);
    }

    public void Clear() => _buff.Clear();
}