# Common Design Pattern Interview Traps

## 1. Pattern Overuse

### Trap

Trying to use a design pattern for every class.

### Problem

This creates:

- Unnecessary abstractions
- More indirection
- More code
- Harder maintenance

### Better approach

Start with the simplest design that satisfies the requirements.

Introduce a pattern when it solves a real design problem.

---

## 2. "Composition Over Inheritance" Means Never Use Inheritance

False.

Inheritance is appropriate when the derived type genuinely satisfies the base abstraction and LSP holds.

Composition is often preferred when behavior needs to vary independently.

---

## 3. Strategy and State Are the Same

They are not.

### Strategy

The client/system chooses an algorithm.

### State

The object's current state determines behavior.

---

## 4. Factory Means Any Function Returning an Object

Not necessarily.

A factory pattern is about separating or encapsulating object creation when that creation varies or is complex enough to justify the abstraction.

A simple:

```cpp
auto createFoo()
{
    return Foo{};
}
```

does not automatically mean Factory Method.

---

## 5. Singleton Is Always the Correct Way to Create One Instance

False.

A single instance can often be achieved through normal ownership and dependency injection.

Singleton additionally introduces global access.

---

## 6. Abstract Class = Interface

Not exactly.

C++ does not have a separate `interface` language keyword.

A class containing only pure virtual functions can be used as an interface-like abstraction, but a C++ abstract class may also contain:

- Data
- Implemented methods
- Constructors
- Protected helpers

---

## 7. Observer Automatically Means Thread-Safe

False.

Observer implementations may have races involving:

- Subscriber registration
- Notification
- Unsubscription
- Object destruction

Thread safety must be designed explicitly.

---

## 8. Smart Pointers Solve Ownership Automatically

They help express ownership but do not automatically produce correct ownership design.

### `unique_ptr`

Exclusive ownership.

### `shared_ptr`

Shared ownership.

### `weak_ptr`

Non-owning reference to an object managed by `shared_ptr`.

Avoid using `shared_ptr` merely because ownership is unclear.

---

## 9. Shared Ownership Everywhere

This can create:

- Reference cycles
- Complex lifetimes
- Hidden ownership
- Higher overhead

Prefer `unique_ptr` unless shared ownership is actually required.

---

## 10. Decorator and Inheritance Are Interchangeable

Not generally.

Inheritance defines relationships statically.

Decorator allows behavior to be composed dynamically by wrapping objects.

---

## 11. Adapter and Facade Are the Same

No.

### Adapter

Changes an interface.

### Facade

Simplifies an interface.

---

## 12. Proxy and Decorator Are the Same

They have similar structures but different intent.

### Decorator

Adds responsibilities or behavior.

### Proxy

Controls access to the real object.

---

## 13. SOLID Means More Interfaces

Not necessarily.

Creating many tiny interfaces without a real design reason can make the system harder to understand.

The goal is appropriate dependency boundaries.

---

## 14. Dependency Injection Means Using a Framework

False.

This is valid dependency injection:

```cpp
class Service
{
    Repository& repository;

public:
    explicit Service(Repository& repository)
        : repository(repository)
    {
    }
};
```

No framework is required.

---

## 15. Every Design Pattern Must Use Inheritance

False.

Modern C++ patterns often use:

- Composition
- Templates
- Lambdas
- `std::function`
- Smart pointers
- RAII
- Type erasure

---

## 16. GoF Patterns Must Be Implemented Exactly as in the Book

No.

Patterns describe design ideas.

Modern C++ may provide simpler language/library mechanisms.

For example, a Strategy can sometimes be represented with:

```cpp
std::function<int(int, int)>
```

instead of a hierarchy of classes.

---

## 17. Pattern Names Are More Important Than Trade-offs

In interviews, simply saying:

> "Use Observer."

is weak.

Explain:

```text
Why?
What problem does it solve?
What are the dependencies?
How is lifetime managed?
What are the trade-offs?
```

---

## 18. Design Pattern = Good Design

Not necessarily.

A pattern can be correctly implemented and still be the wrong choice for a particular system.

---

## 19. Over-Abstraction

Watch for:

```text
Interface
    ↓
AbstractFactory
    ↓
Factory
    ↓
Builder
    ↓
ConcreteFactory
    ↓
ConcreteBuilder
```

when the requirement only needs:

```cpp
auto object = createObject();
```

Good design is not maximum abstraction.

---

## 20. Interview Trap: Pattern First

Bad approach:

```text
"I know Strategy, so I will use Strategy."
```

Better:

```text
Requirement
    ↓
What changes?
    ↓
What must remain stable?
    ↓
What dependency causes coupling?
    ↓
Choose design
    ↓
Pattern if useful
```

---

## 21. Interview Trap: Ignoring Ownership

In C++, always consider:

- Who owns the object?
- Who destroys it?
- Can it outlive its owner?
- Is ownership shared?
- Can there be a cycle?

This is particularly important with Observer, Composite, Proxy, and Factory designs.

---

## 22. Interview Trap: Ignoring Concurrency

For real systems, ask whether multiple threads can access:

- Shared state
- Observer lists
- Caches
- Queues
- Registries
- Singletons

A structurally correct design can still be incorrect under concurrency.

---

## 23. Interview Trap: Ignoring Failure Handling

Real systems need to consider:

```text
Timeout
Retry
Partial failure
Resource exhaustion
Invalid input
Cancellation
Recovery
```

Design patterns do not solve these automatically.

---

## 24. Best Interview Habit

Whenever you propose a pattern, state:

> "I would use this pattern because [specific design problem]."

Then mention at least one trade-off.

That demonstrates design judgment rather than pattern memorization.
