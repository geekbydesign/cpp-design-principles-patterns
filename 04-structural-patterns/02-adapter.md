# Adapter Pattern

## 1. Intent

> Convert the interface of a class into another interface that clients expect.

Adapter allows otherwise incompatible classes to work together.

## 2. Problem

Suppose the application expects:

```cpp
class PaymentProcessor
{
public:
    virtual void pay(double amount) = 0;
    virtual ~PaymentProcessor() = default;
};
```

But an existing third-party library provides:

```cpp
class LegacyPayment
{
public:
    void makePayment(double amount)
    {
        // legacy implementation
    }
};
```

The interfaces do not match.

## 3. Adapter

```cpp
class LegacyPaymentAdapter : public PaymentProcessor
{
    LegacyPayment& legacy;

public:
    LegacyPaymentAdapter(LegacyPayment& legacy)
        : legacy(legacy)
    {
    }

    void pay(double amount) override
    {
        legacy.makePayment(amount);
    }
};
```

Usage:

```cpp
LegacyPayment legacy;
LegacyPaymentAdapter adapter(legacy);

PaymentProcessor& processor = adapter;
processor.pay(100.0);
```

## 4. Object Adapter

The example above uses **composition**. The adapter contains or references the adaptee.

This is generally flexible because the adapter does not need to inherit from the adaptee.

## 5. Class Adapter

A class adapter can use multiple inheritance when the language and design make it appropriate:

```cpp
class Adapter : public Target, private Adaptee
{
};
```

This is less common in modern C++ application design.

## 6. When to Use

Use Adapter when:

- Existing code cannot be changed
- Two interfaces are incompatible
- A third-party library must fit an existing abstraction
- You want to isolate legacy APIs

## 7. Adapter vs Facade

```text
Adapter
    Changes one interface into another compatible interface.

Facade
    Provides a simpler interface over a complex subsystem.
```

## 8. Interview Question

**Q: Does Adapter change the underlying class?**

No. The adapter translates calls between the client's expected interface and the existing implementation.
