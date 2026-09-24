# CRTP (Curiously Recurring Template Pattern)

## 1. Definition

CRTP is a C++ pattern where a class derives from a class template using itself as the template argument.

```cpp
template<typename Derived>
class Base
{
};

class Derived : public Base<Derived>
{
};
```

## 2. Basic Example

```cpp
template<typename Derived>
class Printable
{
public:
    void print()
    {
        static_cast<Derived*>(this)->printImpl();
    }
};

class Document : public Printable<Document>
{
public:
    void printImpl()
    {
        // document printing
    }
};
```

Usage:

```cpp
Document document;
document.print();
```

## 3. Static Polymorphism

Traditional polymorphism:

```cpp
Base* ptr = new Derived;
ptr->function();
```

uses runtime dispatch.

CRTP can provide compile-time polymorphism:

```cpp
Derived object;
object.print();
```

The compiler resolves the derived implementation.

## 4. Benefits

- Static polymorphism
- Avoids virtual dispatch in suitable cases
- Enables reusable mixins
- Can enable compile-time customization

## 5. CRTP as a Mixin

CRTP is commonly used to add reusable behavior:

```cpp
template<typename Derived>
class Comparable
{
public:
    bool operator!=(const Derived& other) const
    {
        return !static_cast<const Derived*>(this)->operator==(other);
    }
};
```

A class can inherit this behavior.

## 6. Trade-offs

- More complex syntax
- Compile-time coupling
- Less flexible than runtime polymorphism
- Error messages can be difficult to understand

## 7. CRTP vs Virtual Polymorphism

| CRTP | Virtual |
|---|---|
| Compile-time | Runtime |
| Static polymorphism | Dynamic polymorphism |
| No virtual dispatch required | Virtual dispatch |
| Concrete type known at compile time | Type can be selected at runtime |

## 8. When to Use

CRTP is useful when:

- Static polymorphism is sufficient
- Performance or compile-time customization matters
- Reusable mixin behavior is useful

## 9. Interview Question

**Q: What is the key idea behind CRTP?**

A derived class passes itself as a template parameter to its base class, enabling compile-time interaction with the derived type.
