# Composition vs Inheritance

## 1. Overview

Composition and inheritance are fundamental object-oriented design techniques.

## 2. Inheritance

Inheritance models an **is-a** relationship.

```cpp
class Animal
{
public:
    virtual void speak() = 0;
    virtual ~Animal() = default;
};

class Dog : public Animal
{
public:
    void speak() override {}
};
```

A `Dog` is an `Animal`.

## 3. Composition

Composition models a **has-a** relationship.

```cpp
class Engine
{
public:
    void start() {}
};

class Car
{
    Engine engine;

public:
    void start()
    {
        engine.start();
    }
};
```

A `Car` has an `Engine`.

## 4. Comparison

| Composition | Inheritance |
|---|---|
| Has-a relationship | Is-a relationship |
| Usually lower coupling | Tighter coupling |
| Behavior can be replaced | Behavior inherited from hierarchy |
| Uses objects | Uses class hierarchy |
| Often more flexible | Useful for polymorphic substitution |

## 5. Prefer Composition When

- You want to combine behavior
- Dependencies may change
- You do not need subtype polymorphism
- You want to avoid deep inheritance hierarchies

## 6. Use Inheritance When

- There is a genuine subtype relationship
- Polymorphic substitution is required
- The base abstraction defines a meaningful contract
- LSP is satisfied

## 7. Relationship to SOLID

Composition often supports:

- SRP
- OCP
- DIP
- LSP-friendly designs

But inheritance is not inherently bad.

The important question is whether the relationship represents the correct abstraction.

## 8. Easy Way to Remember

```text
Inheritance → "is-a"

Composition → "has-a"
```

## 9. Interview Question

**Q: Why is composition often preferred over inheritance?**

It generally reduces coupling and allows behavior to be assembled or replaced more flexibly. However, inheritance remains appropriate when a genuine subtype relationship exists.
