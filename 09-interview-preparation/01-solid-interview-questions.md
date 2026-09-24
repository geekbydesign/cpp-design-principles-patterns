# SOLID Interview Questions

## 1. What is SOLID?

SOLID is a set of five object-oriented design principles:

- **S** — Single Responsibility Principle
- **O** — Open/Closed Principle
- **L** — Liskov Substitution Principle
- **I** — Interface Segregation Principle
- **D** — Dependency Inversion Principle

The goal is to make software easier to understand, change, test, and maintain.

---

## 2. Single Responsibility Principle

### Question

What does SRP mean?

### Answer

A class should have one primary responsibility and therefore one reason to change.

It does **not** mean that a class can contain only one method.

### Bad

```cpp
class Report
{
public:
    void generate();
    void saveToFile();
    void sendEmail();
};
```

The class has reporting, persistence, and notification responsibilities.

### Better

```cpp
class ReportGenerator {};
class ReportRepository {};
class EmailSender {};
```

### Interview follow-up

**Does SRP mean one class should have only one function?**

No. A class can have multiple methods as long as those methods belong to the same cohesive responsibility.

---

## 3. Open/Closed Principle

### Question

What is OCP?

### Answer

Software entities should be open for extension but closed for modification.

### Example

Instead of:

```cpp
double calculateArea(const Shape& shape)
{
    if (shape.type() == ShapeType::Circle)
        // ...

    if (shape.type() == ShapeType::Rectangle)
        // ...

    return 0;
}
```

Use polymorphism:

```cpp
class Shape
{
public:
    virtual double area() const = 0;
    virtual ~Shape() = default;
};
```

New shapes can be added without modifying the area calculation logic.

### Interview follow-up

OCP does not mean **never modify existing code**.

It means stable code should not require repeated modification merely because new behavior is being added.

---

## 4. Liskov Substitution Principle

### Question

What does LSP mean?

### Answer

Objects of a derived class should be usable wherever objects of the base class are expected without breaking the expected behavior or contract.

### Classic example

If:

```cpp
class Bird
{
public:
    virtual void fly() = 0;
};
```

then making `Penguin` inherit from `Bird` creates a behavioral problem if penguins cannot fly.

The abstraction is wrong.

### Better design

Separate capabilities:

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
```

### Interview follow-up

LSP is about **behavioral substitutability**, not merely whether the code compiles.

---

## 5. Interface Segregation Principle

### Question

What is ISP?

### Answer

Clients should not be forced to depend on methods they do not use.

### Bad

```cpp
class Machine
{
public:
    virtual void print() = 0;
    virtual void scan() = 0;
    virtual void fax() = 0;
};
```

A simple printer is forced to implement scanning and faxing.

### Better

```cpp
class Printer
{
public:
    virtual void print() = 0;
};

class Scanner
{
public:
    virtual void scan() = 0;
};
```

---

## 6. Dependency Inversion Principle

### Question

What is DIP?

### Answer

High-level modules should not depend directly on low-level implementation details. Both should depend on abstractions.

Also, abstractions should not depend on details; details should depend on abstractions.

### Example

```cpp
class Database
{
public:
    virtual void save() = 0;
    virtual ~Database() = default;
};

class UserService
{
    Database& database;

public:
    explicit UserService(Database& database)
        : database(database)
    {
    }
};
```

`UserService` does not create or depend directly on `MySqlDatabase`.

---

## 7. DIP vs Dependency Injection

These are related but not identical.

**DIP** is a design principle.

**Dependency Injection** is a technique for supplying dependencies from outside.

```cpp
UserService service(database);
```

This is dependency injection.

---

## 8. Composition and SOLID

Composition often helps implement SOLID designs.

```cpp
class PaymentService
{
    PaymentStrategy& strategy;
};
```

Instead of embedding every payment algorithm inside `PaymentService`, behavior is composed from an abstraction.

---

## 9. Common Interview Questions

### Q1. Which SOLID principle is most important?

There is no universally most important principle.

The appropriate principle depends on the design problem.

### Q2. Can SOLID be overused?

Yes.

Too many abstractions can produce:

- More classes
- More indirection
- Harder debugging
- Unnecessary complexity

### Q3. Are SOLID principles rules?

No.

They are design guidelines. Context matters.

### Q4. Can a class violate multiple SOLID principles?

Yes.

For example, a large class may violate SRP, OCP, ISP, and DIP simultaneously.

### Q5. How does SOLID improve testing?

Good separation and dependency inversion make components easier to isolate and replace with test doubles.

---

## 10. Quick Interview Summary

| Principle | Core Idea |
|---|---|
| SRP | One cohesive responsibility |
| OCP | Extend without repeatedly modifying stable code |
| LSP | Derived types preserve the base contract |
| ISP | Keep interfaces focused |
| DIP | Depend on abstractions |

### Interview Tip

Do not only define SOLID.

Explain:

```text
Problem → Design issue → Principle → Refactoring → Benefit
```
