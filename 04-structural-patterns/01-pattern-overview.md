# Structural Design Patterns — Overview

## 1. What Are Structural Patterns?

Structural design patterns focus on **how classes and objects are combined** to form larger, flexible structures.

They help manage relationships between objects while reducing unnecessary coupling.

## 2. The Seven GoF Structural Patterns

| Pattern | Main Purpose |
|---|---|
| Adapter | Make incompatible interfaces work together |
| Bridge | Separate abstraction from implementation |
| Composite | Treat individual objects and groups uniformly |
| Decorator | Add behavior dynamically |
| Facade | Provide a simplified interface to a subsystem |
| Flyweight | Share common state to reduce memory usage |
| Proxy | Control access to another object |

## 3. Pattern Selection

```text
Incompatible interface?
        → Adapter

Abstraction and implementation vary independently?
        → Bridge

Tree structure / part-whole hierarchy?
        → Composite

Add behavior without changing the original class?
        → Decorator

Complex subsystem needs a simple entry point?
        → Facade

Many objects share common data?
        → Flyweight

Need controlled access to another object?
        → Proxy
```

## 4. Important

Structural patterns are not just class diagrams.

In C++, good structural design also depends on:

- Ownership
- Lifetime
- RAII
- Smart pointers
- Interfaces
- Composition
- Value semantics

Use the simplest structure that solves the actual problem.
