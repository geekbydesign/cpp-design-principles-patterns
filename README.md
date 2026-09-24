# C++ Design Principles & Design Patterns

A comprehensive C++17-focused repository covering **SOLID principles, OOP design fundamentals, GoF design patterns, modern C++ design techniques, pattern comparisons, real-world system design examples, and interview preparation**.

The goal is to understand **why and when a design should be used**, not just memorize pattern definitions.

---

## 📚 Repository Structure

```text
cpp-design-principles-patterns/
│
├── README.md
│
├── 01-solid-principles/
│   ├── 01-overview.md
│   ├── 02-single-responsibility-principle.md
│   ├── 03-open-closed-principle.md
│   ├── 04-liskov-substitution-principle.md
│   ├── 05-interface-segregation-principle.md
│   ├── 06-dependency-inversion-principle.md
│   └── 07-solid-summary.md
│
├── 02-oop-design-foundations/
│   ├── 01-composition-vs-inheritance.md
│   ├── 02-aggregation-vs-composition.md
│   ├── 03-coupling-and-cohesion.md
│   ├── 04-program-to-an-interface.md
│   ├── 05-encapsulation-and-abstraction.md
│   └── 06-delegation.md
│
├── 03-creational-patterns/
│   ├── 01-pattern-overview.md
│   ├── 02-singleton.md
│   ├── 03-factory-method.md
│   ├── 04-abstract-factory.md
│   ├── 05-builder.md
│   └── 06-prototype.md
│
├── 04-structural-patterns/
│   ├── 01-pattern-overview.md
│   ├── 02-adapter.md
│   ├── 03-bridge.md
│   ├── 04-composite.md
│   ├── 05-decorator.md
│   ├── 06-facade.md
│   ├── 07-flyweight.md
│   └── 08-proxy.md
│
├── 05-behavioral-patterns/
│   ├── 01-pattern-overview.md
│   ├── 02-chain-of-responsibility.md
│   ├── 03-command.md
│   ├── 04-iterator.md
│   ├── 05-mediator.md
│   ├── 06-memento.md
│   ├── 07-observer.md
│   ├── 08-state.md
│   ├── 09-strategy.md
│   ├── 10-template-method.md
│   └── 11-visitor.md
│
├── 06-cpp-specific-design-techniques/
│   ├── 01-raii.md
│   ├── 02-pimpl.md
│   ├── 03-type-erasure.md
│   ├── 04-crtp.md
│   ├── 05-rule-of-five-and-design.md
│   ├── 06-smart-pointers-in-design.md
│   └── 07-dependency-injection.md
│
├── 07-pattern-comparisons/
│   ├── 01-factory-vs-abstract-factory.md
│   ├── 02-strategy-vs-state.md
│   ├── 03-adapter-vs-facade.md
│   ├── 04-decorator-vs-proxy.md
│   ├── 05-composition-vs-inheritance.md
│   └── 06-observer-vs-mediator.md
│
├── 08-design-patterns-in-real-systems/
│   ├── 01-payment-system.md
│   ├── 02-logging-system.md
│   ├── 03-notification-system.md
│   ├── 04-parking-lot.md
│   ├── 05-vending-machine.md
│   ├── 06-elevator-system.md
│   └── 07-medical-device-example.md
│
└── 09-interview-preparation/
    ├── 01-solid-interview-questions.md
    ├── 02-design-pattern-interview-questions.md
    ├── 03-pattern-identification.md
    ├── 04-common-traps.md
    └── 05-quick-revision.md
```

---

# 🎯 Learning Goals

By completing this repository, you should be able to:

* Understand the **SOLID principles** deeply.
* Write maintainable and extensible C++ code.
* Identify problems caused by tight coupling and poor abstractions.
* Understand **composition vs inheritance**.
* Apply the **23 Gang of Four (GoF) design patterns**.
* Understand when a design pattern is appropriate.
* Recognize when a design pattern is unnecessary.
* Implement patterns using modern C++17.
* Understand the trade-offs of different designs.
* Recognize patterns in existing code.
* Apply design principles to real-world systems.
* Explain design decisions clearly during C++ interviews.

---

# 🧱 Learning Path

The repository is organized in the following order:

```text
01. SOLID Principles
        ↓
02. OOP Design Foundations
        ↓
03. Creational Patterns
        ↓
04. Structural Patterns
        ↓
05. Behavioral Patterns
        ↓
06. C++-Specific Design Techniques
        ↓
07. Pattern Comparisons
        ↓
08. Real-World Systems
        ↓
09. Interview Preparation
```

The order is intentional.

Design patterns are much easier to understand after learning the principles that motivate them.

---

# 01 — SOLID Principles

SOLID provides fundamental guidelines for designing maintainable object-oriented software.

### Principles Covered

| Principle | Meaning                         |
| --------- | ------------------------------- |
| **SRP**   | Single Responsibility Principle |
| **OCP**   | Open/Closed Principle           |
| **LSP**   | Liskov Substitution Principle   |
| **ISP**   | Interface Segregation Principle |
| **DIP**   | Dependency Inversion Principle  |

Each principle will include:

* Definition
* Motivation
* Problematic design
* Improved design
* C++ examples
* Benefits
* Trade-offs
* Common mistakes
* Real-world examples
* Interview questions

---

# 02 — OOP Design Foundations

Before learning design patterns, it is important to understand the fundamental concepts used to build good object-oriented designs.

Topics include:

* Composition
* Inheritance
* Aggregation
* Coupling
* Cohesion
* Interfaces
* Abstraction
* Encapsulation
* Delegation
* Programming to an interface

These concepts form the foundation for understanding many design patterns.

---

# 03 — Creational Design Patterns

Creational patterns focus on **object creation**.

Patterns covered:

1. Singleton
2. Factory Method
3. Abstract Factory
4. Builder
5. Prototype

Key questions:

* How should objects be created?
* Who should create them?
* How can object creation be decoupled from object usage?
* How can complex object construction be simplified?

---

# 04 — Structural Design Patterns

Structural patterns focus on **how classes and objects are composed**.

Patterns covered:

1. Adapter
2. Bridge
3. Composite
4. Decorator
5. Facade
6. Flyweight
7. Proxy

Key questions:

* How can incompatible interfaces work together?
* How can functionality be added without modifying existing classes?
* How can complex subsystems be simplified?
* How can object relationships be structured efficiently?

---

# 05 — Behavioral Design Patterns

Behavioral patterns focus on **communication and responsibility between objects**.

Patterns covered:

1. Chain of Responsibility
2. Command
3. Iterator
4. Mediator
5. Memento
6. Observer
7. State
8. Strategy
9. Template Method
10. Visitor

These patterns help answer questions such as:

* How should objects communicate?
* Where should a responsibility live?
* How can behavior be changed without modifying existing code?
* How can complex object interactions be managed?

---

# 06 — C++-Specific Design Techniques

Design in C++ is not limited to the classic GoF patterns.

This section covers techniques that are particularly important in modern C++:

* RAII
* PImpl
* Type Erasure
* CRTP
* Rule of Five
* Smart pointers
* Dependency Injection

These techniques are especially relevant for **C++ system-level, embedded, automotive, and medical-device development**.

---

# 07 — Pattern Comparisons

Knowing individual patterns is not enough.

A good designer should understand the differences between patterns that appear similar.

Examples:

```text
Factory Method vs Abstract Factory
Strategy vs State
Adapter vs Facade
Decorator vs Proxy
Composition vs Inheritance
Observer vs Mediator
```

Each comparison focuses on:

* Intent
* Structure
* Key difference
* When to use
* When not to use
* C++ implementation differences
* Example use cases
* Interview questions

---

# 08 — Design Patterns in Real Systems

Patterns become much easier to understand when applied to realistic problems.

Systems covered:

* Payment System
* Logging System
* Notification System
* Parking Lot
* Vending Machine
* Elevator System
* Medical Device Example

For each system, the focus will be on:

```text
Requirements
     ↓
Identify responsibilities
     ↓
Identify dependencies
     ↓
Apply SOLID principles
     ↓
Choose appropriate patterns
     ↓
Design classes
     ↓
Implement in C++
     ↓
Discuss trade-offs
```

The goal is not to force a design pattern into every problem.

The goal is to determine **whether a pattern actually improves the design**.

---

# 09 — Interview Preparation

The final section focuses on using these concepts in technical interviews.

Topics include:

* SOLID interview questions
* Design pattern interview questions
* Pattern identification
* Common mistakes
* Quick revision

Interview preparation will focus on questions such as:

### Conceptual

* What is SRP?
* Why is composition often preferred over inheritance?
* What is dependency inversion?
* What is the difference between abstraction and encapsulation?

### Pattern-based

* When would you use Strategy?
* Factory Method vs Abstract Factory?
* Adapter vs Decorator?
* State vs Strategy?
* Why can Singleton be problematic?

### Design-based

* Design a parking lot.
* Design a vending machine.
* Design a notification system.
* Design a logging framework.
* Design a medical-device component.

---

# 💻 C++ Version

The examples in this repository primarily use:

```text
C++17
```

The examples will use modern C++ features where appropriate, including:

```cpp
std::unique_ptr
std::shared_ptr
std::weak_ptr
std::move
std::function
lambda expressions
override
final
constexpr
templates
RAII
```

The goal is to understand the **design**, not just the syntax.

---

# 🧠 How to Study

For each topic, follow this sequence:

```text
1. Understand the problem
        ↓
2. Understand the principle/pattern
        ↓
3. Study the class relationships
        ↓
4. Read the C++ implementation
        ↓
5. Understand the trade-offs
        ↓
6. Implement it yourself
        ↓
7. Identify it in real code
        ↓
8. Practice interview questions
```

Do not memorize pattern diagrams without understanding the problem they solve.

---

# ⚠️ Important Design Principle

> **A design pattern is a tool, not a requirement.**

Not every problem needs a design pattern.

A good design should prioritize:

* Simplicity
* Maintainability
* Low coupling
* High cohesion
* Testability
* Extensibility
* Clear ownership
* Appropriate abstraction

A pattern should be introduced when it solves an actual design problem.

---

# 🔗 Relationship Between SOLID and Design Patterns

SOLID principles and design patterns are complementary.

```text
SOLID
  │
  ├── Provides design principles
  │
  ├── Helps identify design problems
  │
  └── Guides better abstractions
          │
          ↓
Design Patterns
  │
  ├── Provide reusable design structures
  │
  ├── Solve recurring design problems
  │
  └── Apply principles in practical designs
```

For example:

```text
Dependency Inversion
        ↓
Program to abstractions
        ↓
Dependency Injection
        ↓
Strategy / Factory / Observer
```

The goal is to understand these relationships rather than treating each topic as an isolated concept.

---

# 📌 Recommended Prerequisites

Before starting this repository, you should be comfortable with:

* Classes and objects
* Constructors and destructors
* Inheritance
* Polymorphism
* Virtual functions
* References and pointers
* Smart pointers
* Templates
* RAII
* Basic C++17 syntax

For C++ fundamentals, refer to the separate:

**`cpp-deep-dive`** repository.

---

# 🏁 Final Goal

After completing this repository, you should be able to look at a C++ design and ask:

```text
What responsibility does this class have?

Is the class doing too much?

What depends on what?

Is the coupling too high?

Can this be extended without modifying existing code?

Should this relationship use inheritance or composition?

Should this dependency be an interface?

Would a design pattern actually simplify this?

What are the trade-offs?

Is this design easy to test?

Is the abstraction justified?
```

That mindset is more important than memorizing the names of 23 design patterns.

---

# 📖 Pattern Count

### SOLID

```text
5 principles
```

### GoF Design Patterns

```text
Creational     5
Structural     7
Behavioral    11
----------------
Total         23
```

### C++ Design Techniques

```text
7 major techniques
```

The repository combines these topics into a single learning path from **fundamental design principles → reusable patterns → modern C++ techniques → real-world systems → interview preparation**.
