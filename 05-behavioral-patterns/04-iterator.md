# Iterator Pattern

## 1. Intent

> Provide a way to access elements of a collection sequentially without exposing its underlying representation.

C++ uses the Iterator concept extensively through the Standard Library.

## 2. Basic Usage

```cpp
std::vector<int> values{10, 20, 30};

for (auto it = values.begin(); it != values.end(); ++it)
{
    std::cout << *it << '\n';
}
```

The caller does not need to know how `std::vector` stores its elements internally.

## 3. Iterator Interface

A conceptual iterator may provide:

```cpp
class Iterator
{
public:
    virtual bool hasNext() = 0;
    virtual int next() = 0;
    virtual ~Iterator() = default;
};
```

## 4. C++ Iterators

C++ provides different iterator categories:

- Input iterator
- Output iterator
- Forward iterator
- Bidirectional iterator
- Random-access iterator
- Contiguous iterator

Different containers support different capabilities.

For example:

```text
vector → random access
list   → bidirectional
forward_list → forward
```

## 5. Benefits

- Hides collection representation
- Provides a standard traversal interface
- Separates traversal from collection implementation
- Supports generic algorithms

## 6. Modern C++

Range-based `for` loops simplify iteration:

```cpp
for (const auto& value : values)
{
    std::cout << value;
}
```

C++20 ranges extend this idea further, but the underlying iterator model remains fundamental.

## 7. Interview Question

**Q: Why is Iterator useful?**

It allows clients to traverse a collection without depending on its internal representation.
