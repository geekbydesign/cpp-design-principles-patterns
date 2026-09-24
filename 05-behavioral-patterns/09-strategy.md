# Strategy Pattern

## 1. Intent

> Define a family of algorithms, encapsulate each one, and make them interchangeable.

## 2. Problem

Suppose a payment system has multiple payment algorithms:

```cpp
if (type == "CARD")
{
    // card
}
else if (type == "UPI")
{
    // UPI
}
else if (type == "WALLET")
{
    // wallet
}
```

This can become difficult to maintain.

## 3. Strategy Interface

```cpp
class PaymentStrategy
{
public:
    virtual void pay(double amount) = 0;
    virtual ~PaymentStrategy() = default;
};
```

Concrete strategies:

```cpp
class CardPayment : public PaymentStrategy
{
public:
    void pay(double amount) override
    {
        // card payment
    }
};

class UpiPayment : public PaymentStrategy
{
public:
    void pay(double amount) override
    {
        // UPI payment
    }
};
```

Context:

```cpp
class PaymentService
{
    PaymentStrategy& strategy;

public:
    PaymentService(PaymentStrategy& strategy)
        : strategy(strategy)
    {
    }

    void process(double amount)
    {
        strategy.pay(amount);
    }
};
```

## 4. Benefits

- Removes large conditionals
- Algorithms are independently testable
- Behavior can be changed at runtime
- Supports Open/Closed Principle
- Uses composition instead of inheritance for the context

## 5. Modern C++ Alternative

For small behaviors, `std::function` may be simpler:

```cpp
class PaymentService
{
    std::function<void(double)> payment;

public:
    PaymentService(std::function<void(double)> payment)
        : payment(std::move(payment))
    {
    }

    void process(double amount)
    {
        payment(amount);
    }
};
```

This can provide Strategy-like behavior without creating a class hierarchy.

## 6. Strategy vs State

```text
Strategy
    Select an algorithm.

State
    Behavior changes with internal state.
```

## 7. When to Use

Use Strategy when:

- Multiple algorithms solve the same problem
- Algorithms should be interchangeable
- Conditional logic is growing
- Algorithms need independent testing

## 8. Interview Question

**Q: Why is Strategy often associated with composition over inheritance?**

The context contains a strategy object and delegates the algorithm to it rather than inheriting different algorithm implementations.
