# Liskov Substitution Principle (LSP)

## Definition

> Objects of a derived class should be replaceable with objects of the base class without breaking the correctness of the program.

In simple terms:

If `B` is a subtype of `A`, code expecting `A` should be able to use `B` without unexpected behavior.

## Example

Suppose:

```cpp
class Bird
{
public:
    virtual void fly() = 0;
};
```

Now consider:

```cpp
class Penguin : public Bird
{
public:
    void fly() override
    {
        throw std::runtime_error("Penguins cannot fly");
    }
};
```

This inheritance relationship violates the expected contract of `Bird`.

A better design is to separate the concepts:

```cpp
class Bird
{
public:
    virtual ~Bird() = default;
};

class FlyingBird : public Bird
{
public:
    virtual void fly() = 0;
};

class Penguin : public Bird
{
};

class Eagle : public FlyingBird
{
public:
    void fly() override
    {
        // fly
    }
};
```

## LSP Violations

Common warning signs:

- Derived classes throw exceptions for normal base-class operations
- Derived classes ignore base-class behavior
- Preconditions become stronger in derived classes
- Postconditions become weaker
- A subtype requires callers to perform special checks

## Relationship With Polymorphism

Inheritance is not automatically a good design.

The derived type must honor the behavioral contract established by the base abstraction.

## Benefits

- Reliable polymorphism
- Fewer special cases
- Better substitutability
- More predictable behavior

## Interview Question

**Q: Is every inheritance relationship an example of LSP?**

No. Inheritance should represent a valid behavioral subtype relationship. Merely sharing implementation or having an "is-a" phrase is not sufficient.
