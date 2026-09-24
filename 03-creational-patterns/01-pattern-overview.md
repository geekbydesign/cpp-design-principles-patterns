# Creational Design Patterns — Overview

## 1. What Are Creational Patterns?

Creational design patterns deal with **how objects are created**.

Instead of allowing object creation logic to be scattered throughout the application, these patterns provide structured approaches for creating objects.

## 2. The Five GoF Creational Patterns

| Pattern | Main Purpose |
|---|---|
| Singleton | Ensure one shared instance |
| Factory Method | Delegate creation to subclasses/implementations |
| Abstract Factory | Create related families of objects |
| Builder | Construct complex objects step by step |
| Prototype | Create objects by copying an existing object |

## 3. Why Object Creation Matters

Direct construction can create tight coupling:

```cpp
MySQLDatabase database;
```

If many parts of the application directly construct `MySQLDatabase`, replacing it with another implementation becomes difficult.

Creational patterns can move or centralize creation decisions.

## 4. Important Principle

A design pattern should solve a real creation problem.

Do not introduce a factory or builder merely because a pattern exists.

Simple code such as:

```cpp
auto user = std::make_unique<User>();
```

is often preferable when no additional creation complexity exists.

## 5. Pattern Selection

```text
Need exactly one shared instance?
        → Singleton

Need to choose one product implementation?
        → Factory Method

Need a family of related products?
        → Abstract Factory

Need many optional construction steps?
        → Builder

Need to create by copying an existing object?
        → Prototype
```

## 6. C++ Considerations

Modern C++ provides language and library features that reduce the need for some traditional patterns:

- Constructors
- `std::make_unique`
- `std::make_shared`
- Templates
- Lambdas
- Move semantics
- RAII

Always consider the simplest C++ solution before applying a pattern.
