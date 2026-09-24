# Delegation

## 1. Definition

Delegation means an object passes responsibility for a task to another object instead of implementing the task itself.

It is a common way to use composition.

## 2. Example

Instead of making `Car` implement all engine behavior:

```cpp
class Engine
{
public:
    void start()
    {
        // engine startup
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

`Car` delegates engine startup to `Engine`.

## 3. Why Use Delegation?

Delegation can:

- Reduce class complexity
- Separate responsibilities
- Improve reuse
- Reduce coupling
- Support composition

## 4. Delegation vs Inheritance

Inheritance:

```text
Car
  ↓
Vehicle
```

Delegation:

```text
Car ──delegates──> Engine
```

With inheritance, the derived class receives behavior through the base class relationship.

With delegation, one object explicitly asks another object to perform work.

## 5. Example with Strategy

Delegation is commonly used with the Strategy Pattern.

```cpp
class PaymentStrategy
{
public:
    virtual void pay() = 0;
    virtual ~PaymentStrategy() = default;
};

class CardPayment : public PaymentStrategy
{
public:
    void pay() override
    {
    }
};

class PaymentService
{
    PaymentStrategy& strategy;

public:
    PaymentService(PaymentStrategy& strategy)
        : strategy(strategy)
    {
    }

    void process()
    {
        strategy.pay();
    }
};
```

`PaymentService` delegates payment behavior to the selected strategy.

## 6. Delegation vs Composition

Composition describes the structural relationship:

```text
PaymentService HAS-A PaymentStrategy
```

Delegation describes the behavior:

```text
PaymentService DELEGATES payment work to PaymentStrategy
```

They are often used together.

## 7. Interview Question

**Q: Why is delegation useful?**

Delegation allows responsibilities to be moved to specialized objects, reducing class complexity and making behavior easier to replace.
