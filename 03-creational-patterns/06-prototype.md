# Prototype Pattern

## 1. Intent

> Create new objects by copying an existing object, known as the prototype.

Prototype is useful when creating a new object from scratch is expensive or when the exact concrete type should remain hidden from the client.

## 2. Basic Example

```cpp
class Shape
{
public:
    virtual std::unique_ptr<Shape> clone() const = 0;
    virtual ~Shape() = default;
};

class Circle : public Shape
{
public:
    std::unique_ptr<Shape> clone() const override
    {
        return std::make_unique<Circle>(*this);
    }
};
```

Usage:

```cpp
Circle original;

auto copy = original.clone();
```

The caller does not need to know the concrete copying mechanism.

## 3. Why `clone()`?

If the object is accessed through a base-class pointer:

```cpp
Shape* shape = ...;
```

we still want to create a copy preserving the actual derived type.

This is known as **polymorphic cloning**.

## 4. Shallow vs Deep Copy

Prototype implementations must consider ownership.

Suppose:

```cpp
class Image
{
    std::unique_ptr<PixelData> data;
};
```

Copying the object requires deciding whether the underlying data should also be copied.

A deep copy creates independent owned data.

A shallow copy would share the same underlying resource.

## 5. Example With Copy Constructor

```cpp
class Document
{
    std::string text;

public:
    Document(const std::string& text)
        : text(text)
    {
    }

    std::unique_ptr<Document> clone() const
    {
        return std::make_unique<Document>(*this);
    }
};
```

The compiler-generated copy constructor is sufficient here because `std::string` has correct value semantics.

## 6. When to Use

Prototype can be useful when:

- Object creation is expensive
- Objects have many configuration fields
- Runtime types are not known at compile time
- Polymorphic copying is required

## 7. Prototype vs Factory

```text
Factory
    Creates a new object using creation logic.

Prototype
    Creates a new object by copying an existing object.
```

## 8. C++ Considerations

C++ already has strong copy and move semantics.

Before introducing a Prototype abstraction, consider whether normal copy construction is sufficient:

```cpp
auto copy = std::make_unique<Document>(original);
```

A polymorphic `clone()` becomes more useful when the concrete type is hidden behind a base abstraction.

## 9. Interview Questions

### Q1. What is the Prototype Pattern?

It creates new objects by copying an existing prototype.

### Q2. What is polymorphic cloning?

Using a virtual `clone()` operation to copy an object while preserving its actual derived type.

### Q3. What should you consider when cloning?

Ownership, deep vs shallow copying, resource management, and correct copy semantics.
