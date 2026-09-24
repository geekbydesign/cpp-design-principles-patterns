# Open/Closed Principle (OCP)

## Definition

> Software entities should be open for extension but closed for modification.

The goal is to allow new behavior without repeatedly changing stable existing code.

## Problem

```cpp
class PaymentProcessor
{
public:
    void process(const std::string& type)
    {
        if (type == "CARD")
        {
            // card payment
        }
        else if (type == "UPI")
        {
            // UPI payment
        }
    }
};
```

Every new payment type requires modifying `PaymentProcessor`.

## Better Design

Use an abstraction:

```cpp
class PaymentMethod
{
public:
    virtual void pay() = 0;
    virtual ~PaymentMethod() = default;
};

class CardPayment : public PaymentMethod
{
public:
    void pay() override
    {
        // card payment
    }
};

class UpiPayment : public PaymentMethod
{
public:
    void pay() override
    {
        // UPI payment
    }
};
```

The processor can work with the abstraction:

```cpp
class PaymentProcessor
{
public:
    void process(PaymentMethod& method)
    {
        method.pay();
    }
};
```

A new payment type can be added by creating another implementation.

## Common Techniques

OCP is commonly supported by:

- Polymorphism
- Composition
- Strategy Pattern
- Factory Pattern
- Dependency Injection

## Benefits

- Easier extension
- Reduced risk of breaking existing code
- Better separation of responsibilities

## Caution

Do not create abstractions for every possible future change. Apply OCP where variation is likely and meaningful.

## Interview Question

**Q: How does polymorphism help achieve OCP?**

Code can depend on a stable abstraction while new behavior is provided through new implementations.
