# Design Pattern Interview Questions

## 1. What is a Design Pattern?

A design pattern is a reusable design approach for a recurring software-design problem.

A pattern is **not** a library and not a piece of code that must be copied exactly.

---

## 2. What are the GoF Patterns?

The Gang of Four catalog contains 23 patterns.

### Creational

1. Singleton
2. Factory Method
3. Abstract Factory
4. Builder
5. Prototype

### Structural

1. Adapter
2. Bridge
3. Composite
4. Decorator
5. Facade
6. Flyweight
7. Proxy

### Behavioral

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

---

## 3. Factory Method vs Abstract Factory

### Factory Method

Usually creates one type of product through an abstraction.

### Abstract Factory

Creates families of related products.

```text
AbstractFactory
   ├── ProductA
   └── ProductB
```

Interview question:

**When would you choose Abstract Factory?**

When the system needs related products that should be compatible with each other.

---

## 4. Strategy vs State

### Strategy

Selects an interchangeable algorithm.

```text
Payment
 ├── CardStrategy
 └── UpiStrategy
```

### State

Behavior changes according to an object's current state.

```text
VendingMachine
 ├── Idle
 ├── PaymentPending
 └── Dispensing
```

---

## 5. Adapter vs Facade

### Adapter

Makes incompatible interfaces work together.

```text
Client → Adapter → Existing API
```

### Facade

Provides a simpler interface to a complex subsystem.

```text
Client → Facade → Complex Subsystem
```

---

## 6. Decorator vs Proxy

Both wrap another object.

### Decorator

Adds or modifies behavior.

```text
Component
   ↑
Decorator
```

### Proxy

Controls access to another object.

Examples:

- Lazy loading
- Access control
- Remote access
- Caching

---

## 7. Observer

One-to-many dependency.

```text
Subject
 / | \
A  B  C
```

When the subject changes, observers are notified.

### C++ concern

Observer lifetime must be handled carefully.

Dangling observer pointers are a common problem.

---

## 8. Command

Encapsulates a request as an object.

Useful for:

- Undo
- Queues
- Scheduling
- Logging operations
- Macro commands

---

## 9. Template Method

Defines an algorithm skeleton in a base class.

```text
algorithm()
  ↓
step1()
step2()
step3()
```

Subclasses customize selected steps.

---

## 10. Visitor

Separates operations from the object structure.

Useful when:

- Element types are relatively stable
- Many operations need to be performed

Trade-off:

Adding new element types can become expensive.

---

## 11. Singleton

### Question

Why can Singleton be problematic?

Because it introduces global state and hidden dependencies.

It can make:

- Testing harder
- Dependencies less explicit
- Lifetime management less obvious

C++ local static initialization is thread-safe since C++11, but that does not make every Singleton operation thread-safe.

---

## 12. RAII vs Singleton

RAII is a C++ resource-management technique.

Singleton is an object-creation/access pattern.

They solve different problems.

---

## 13. Composition vs Inheritance

Prefer composition when behavior should be assembled or changed independently.

Inheritance is appropriate when there is a genuine substitutable abstraction.

---

## 14. What Pattern Would You Use?

### Payment methods

**Strategy**

### Third-party incompatible API

**Adapter**

### Complex subsystem with simple public interface

**Facade**

### Undo operation

**Command**

### Runtime state-dependent behavior

**State**

### Event notification

**Observer**

### Object creation based on a type

**Factory**

### Add responsibilities dynamically

**Decorator**

### Access control or lazy loading

**Proxy**

### Multiple related product families

**Abstract Factory**

---

## 15. Interview Answer Framework

When asked to design using patterns:

```text
1. Clarify requirements
2. Identify changing behavior
3. Identify ownership
4. Identify dependencies
5. Define interfaces
6. Select patterns
7. Explain trade-offs
8. Discuss testing
9. Discuss concurrency if relevant
```

Avoid saying:

> "I will use Strategy because it is a common pattern."

Instead say:

> "The payment algorithm varies independently from the payment service, so I would isolate it behind an interface and use Strategy."

That demonstrates understanding.
