# Design Patterns — Quick Revision

## 1. SOLID

| Principle | Remember |
|---|---|
| SRP | One cohesive responsibility |
| OCP | Extend without repeatedly modifying stable code |
| LSP | Derived types preserve the base contract |
| ISP | Focused interfaces |
| DIP | Depend on abstractions |

---

# 2. Creational Patterns

| Pattern | Intent |
|---|---|
| Singleton | One controlled instance |
| Factory Method | Delegate object creation |
| Abstract Factory | Create related product families |
| Builder | Construct complex objects step by step |
| Prototype | Create objects by copying existing instances |

---

# 3. Structural Patterns

| Pattern | Intent |
|---|---|
| Adapter | Convert one interface into another |
| Bridge | Separate abstraction from implementation |
| Composite | Treat part and whole uniformly |
| Decorator | Add behavior dynamically |
| Facade | Simplify a complex subsystem |
| Flyweight | Share intrinsic state to reduce memory |
| Proxy | Control access to another object |

---

# 4. Behavioral Patterns

| Pattern | Intent |
|---|---|
| Chain of Responsibility | Pass request through handlers |
| Command | Encapsulate a request |
| Iterator | Traverse a collection |
| Mediator | Centralize object communication |
| Memento | Capture and restore state |
| Observer | One-to-many notification |
| State | Change behavior based on state |
| Strategy | Encapsulate interchangeable algorithms |
| Template Method | Define algorithm skeleton |
| Visitor | Add operations to stable object structures |

---

# 5. C++ Design Techniques

| Technique | Key Idea |
|---|---|
| RAII | Resource lifetime follows object lifetime |
| PImpl | Hide implementation details |
| Type Erasure | Use common behavior without exposing concrete type |
| CRTP | Static polymorphism |
| Rule of Five | Manage special member functions when ownership requires it |
| Rule of Zero | Prefer types that need no custom special members |
| Smart Pointers | Express ownership |
| Dependency Injection | Supply dependencies externally |

---

# 6. Fast Pattern Identification

```text
Different algorithms?
→ Strategy

Different internal states?
→ State

One object notifies many?
→ Observer

Need to queue/undo an operation?
→ Command

Incompatible interface?
→ Adapter

Simplify complex subsystem?
→ Facade

Add behavior dynamically?
→ Decorator

Control access?
→ Proxy

Need object creation abstraction?
→ Factory

Need family of related objects?
→ Abstract Factory

Complex construction?
→ Builder

Copy an existing object?
→ Prototype

Tree structure?
→ Composite

Two dimensions vary independently?
→ Bridge

Pass request through handlers?
→ Chain of Responsibility

Central coordinator?
→ Mediator

Save/restore object state?
→ Memento

Traverse collection?
→ Iterator

Algorithm skeleton with customizable steps?
→ Template Method

Many operations on stable object structure?
→ Visitor
```

---

# 7. Most Important Comparisons

## Strategy vs State

```text
Strategy → interchangeable algorithm
State    → behavior determined by current state
```

## Adapter vs Facade

```text
Adapter → changes interface
Facade  → simplifies interface
```

## Decorator vs Proxy

```text
Decorator → adds/modifies behavior
Proxy     → controls access
```

## Factory vs Abstract Factory

```text
Factory          → object creation
Abstract Factory → related product families
```

## Composition vs Inheritance

```text
Composition → has-a / assembled behavior
Inheritance → is-a / substitutable abstraction
```

## Observer vs Mediator

```text
Observer → notification relationship
Mediator → centralized coordination
```

---

# 8. C++ Ownership Cheat Sheet

```cpp
std::unique_ptr<T>
```

Use when there is one owner.

```cpp
std::shared_ptr<T>
```

Use when ownership is genuinely shared.

```cpp
std::weak_ptr<T>
```

Use for non-owning references to `shared_ptr`-managed objects, especially to break cycles.

Raw pointers/references can represent non-owning relationships when lifetime is guaranteed elsewhere.

---

# 9. Pattern Selection Process

Use this sequence:

```text
1. Understand requirements
2. Identify what changes
3. Identify ownership
4. Identify dependencies
5. Separate responsibilities
6. Define stable interfaces
7. Choose composition/inheritance
8. Select pattern if it solves a real problem
9. Consider testing
10. Consider concurrency
11. Consider failure handling
12. Explain trade-offs
```

---

# 10. Interview Answer Template

When asked:

> "Which design pattern would you use?"

Answer using:

```text
I would use [Pattern] because [specific problem].

The changing part is [X], so I would isolate it behind [abstraction].

The main benefit is [benefit].

The trade-off is [trade-off].

If the system remains simple, I would avoid introducing the pattern unnecessarily.
```

---

# 11. Pattern Selection by Real System

| System | Common Patterns |
|---|---|
| Payment | Strategy, Factory, Observer, DI |
| Logging | Facade, Strategy, Observer/Composite-style fan-out, DI |
| Notification | Strategy, Observer, Adapter, Factory |
| Parking Lot | Strategy, State, Factory |
| Vending Machine | State, Strategy, Chain of Responsibility |
| Elevator | Strategy, State, Command, Observer |
| Medical Device | Adapter, Strategy, Observer, DI, RAII, PImpl |

These are candidate patterns, not mandatory patterns.

---

# 12. Final Mental Model

Remember four questions:

### 1. What changes?

Isolate it.

### 2. What depends on what?

Invert unnecessary dependencies.

### 3. Who owns what?

Make ownership explicit.

### 4. What behavior varies?

Use composition and appropriate patterns.

---

# 13. Golden Rule

> **Do not design around patterns. Design around requirements, responsibilities, dependencies, ownership, and change.**

Patterns should make the resulting design easier to understand and evolve—not more complicated.
