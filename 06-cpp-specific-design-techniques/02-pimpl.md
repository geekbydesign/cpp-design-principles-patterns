# PImpl (Pointer to Implementation)

## 1. Definition

PImpl stands for **Pointer to Implementation**.

It separates a class's public interface from its private implementation details.

## 2. Problem

Without PImpl:

```cpp
// MyClass.h

#include <vector>
#include <string>

class MyClass
{
    std::vector<std::string> data;

public:
    void process();
};
```

The header exposes implementation details and can increase compilation dependencies.

## 3. PImpl Structure

Header:

```cpp
class MyClass
{
public:
    MyClass();
    ~MyClass();

    void process();

private:
    class Impl;
    std::unique_ptr<Impl> impl;
};
```

Implementation:

```cpp
class MyClass::Impl
{
public:
    std::vector<std::string> data;

    void process()
    {
    }
};
```

Constructor:

```cpp
MyClass::MyClass()
    : impl(std::make_unique<Impl>())
{
}
```

Destructor:

```cpp
MyClass::~MyClass() = default;
```

## 4. Benefits

- Hides implementation details
- Reduces header dependencies
- Can reduce recompilation
- Helps maintain ABI stability
- Separates interface from implementation

## 5. Trade-offs

- Extra heap allocation in common implementations
- Indirection
- More source-code complexity
- Copy/move semantics need explicit consideration

## 6. PImpl and `unique_ptr`

Using:

```cpp
std::unique_ptr<Impl>
```

is common because the implementation object has clear ownership.

The destructor is often defined in the `.cpp` file so the complete `Impl` type is available.

## 7. When to Use

PImpl is particularly useful for:

- Large libraries
- Public APIs
- ABI stability
- Reducing compile-time dependencies
- Hiding implementation details

## 8. Interview Question

**Q: What problem does PImpl solve?**

It separates a class's public interface from implementation details, reducing dependencies and helping preserve binary compatibility.
