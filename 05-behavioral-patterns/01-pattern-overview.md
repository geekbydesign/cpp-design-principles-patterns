# Behavioral Design Patterns — Overview

## 1. What Are Behavioral Patterns?

Behavioral design patterns focus on **how objects communicate, distribute responsibilities, and change behavior**.

They help reduce tightly coupled interactions and make behavior easier to vary.

## 2. The Eleven GoF Behavioral Patterns

| Pattern | Main Purpose |
|---|---|
| Chain of Responsibility | Pass a request through a chain of handlers |
| Command | Encapsulate a request as an object |
| Iterator | Traverse a collection without exposing its representation |
| Mediator | Centralize communication between objects |
| Memento | Capture and restore object state |
| Observer | Notify dependent objects when state changes |
| State | Change behavior when internal state changes |
| Strategy | Encapsulate interchangeable algorithms |
| Template Method | Define an algorithm skeleton and allow steps to vary |
| Visitor | Add operations to object structures without changing element classes |

## 3. Pattern Selection

```text
Request should pass through multiple handlers?
        → Chain of Responsibility

Need to represent an action as an object?
        → Command

Need standardized traversal?
        → Iterator

Many objects communicate with each other?
        → Mediator

Need undo/restore state?
        → Memento

Need one-to-many notifications?
        → Observer

Object behavior depends on its state?
        → State

Need interchangeable algorithms?
        → Strategy

Algorithm structure is fixed but some steps vary?
        → Template Method

Need to add operations to a stable object structure?
        → Visitor
```

## 4. Important

Behavioral patterns should reduce complexity, not create another layer of complexity.

Modern C++ also provides alternatives such as:

- Lambdas
- `std::function`
- Function objects
- Templates
- Iterators
- `std::variant`
- RAII

Choose the simplest appropriate technique.
