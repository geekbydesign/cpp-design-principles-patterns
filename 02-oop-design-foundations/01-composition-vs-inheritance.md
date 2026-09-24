# Composition vs Inheritance

## 1. Overview

Composition and inheritance are two ways to reuse behavior and model relationships between classes.

### Inheritance

Inheritance represents an **is-a** relationship.

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
    void speak() override
    {
        // Dog speaks
    }
};
```

A `Dog` is an `Animal`.

### Composition

Composition represents a **has-a** relationship.

```cpp
class Engine
{
public:
    void start()
    {
        // start engine
    }
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

## 2. Composition

Composition means a class is built using other objects.

```cpp
class Logger
{
public:
    void log()
    {
    }
};

class PaymentService
{
    Logger logger;

public:
    void process()
    {
        logger.log();
    }
};
```

### Advantages

- Lower coupling
- More flexible behavior
- Easier testing
- Dependencies can often be replaced
- Avoids deep inheritance hierarchies

## 3. Inheritance

Inheritance allows a derived class to reuse and specialize a base class.

```cpp
class Vehicle
{
public:
    virtual void move() = 0;
    virtual ~Vehicle() = default;
};

class Car : public Vehicle
{
public:
    void move() override
    {
    }
};
```

### Advantages

- Supports polymorphism
- Models genuine subtype relationships
- Allows shared interface and behavior

### Risks

- Tight coupling between base and derived classes
- Fragile base-class changes
- Deep hierarchies become difficult to understand
- Incorrect inheritance can violate LSP

## 4. Composition Over Inheritance

A common design guideline is:

> Prefer composition over inheritance when inheritance does not represent a genuine subtype relationship.

This is not an absolute rule.

Use inheritance when polymorphic substitution is actually required.

Use composition when you mainly need to reuse or combine behavior.

## 5. Interview Questions

### Q1. What is the difference between composition and inheritance?

Inheritance models an is-a relationship, while composition models a has-a relationship.

### Q2. Why is composition often preferred?

Composition generally produces less coupling and makes behavior easier to replace or combine.

### Q3. Is inheritance bad?

No. Inheritance is useful when the derived class is a true behavioral subtype of the base class.
