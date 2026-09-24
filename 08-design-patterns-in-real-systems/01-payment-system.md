# Payment System — Design Patterns in a Real System

## 1. Problem

Design a payment system that supports multiple payment methods:

- Credit/Debit Card
- UPI
- Wallet
- Future payment methods

The design should be extensible without modifying the main payment workflow every time a new payment method is added.

## 2. Requirements

### Functional

- Process a payment
- Support multiple payment methods
- Validate payment requests
- Record payment results
- Notify interested components
- Allow new payment methods to be added

### Non-functional

- Low coupling
- Testability
- Extensibility
- Clear ownership
- Error handling

## 3. Candidate Patterns

```text
Strategy
Factory
Dependency Injection
Observer
```

## 4. Strategy

Payment algorithms vary by payment method.

```cpp
class PaymentStrategy
{
public:
    virtual bool pay(double amount) = 0;
    virtual ~PaymentStrategy() = default;
};
```

Concrete strategies:

```cpp
class CardPayment : public PaymentStrategy
{
public:
    bool pay(double amount) override
    {
        // process card payment
        return true;
    }
};

class UpiPayment : public PaymentStrategy
{
public:
    bool pay(double amount) override
    {
        // process UPI payment
        return true;
    }
};
```

## 5. Dependency Injection

```cpp
class PaymentService
{
    PaymentStrategy& strategy;

public:
    explicit PaymentService(PaymentStrategy& strategy)
        : strategy(strategy)
    {
    }

    bool process(double amount)
    {
        return strategy.pay(amount);
    }
};
```

The service does not create the payment implementation.

## 6. Factory

If the payment strategy must be selected dynamically:

```cpp
std::unique_ptr<PaymentStrategy>
createPaymentStrategy(PaymentType type)
{
    switch (type)
    {
        case PaymentType::Card:
            return std::make_unique<CardPayment>();

        case PaymentType::UPI:
            return std::make_unique<UpiPayment>();
    }

    throw std::invalid_argument("Unsupported payment type");
}
```

## 7. Observer

Payment completion can notify:

```text
PaymentService
     ↓
PaymentCompleted
   /    |    \
Email  Audit  Analytics
```

## 8. SOLID Principles

### SRP

Separate payment processing, validation, persistence, and notification.

### OCP

New payment strategies can be added without modifying the core payment workflow.

### DIP

PaymentService depends on `PaymentStrategy`, not concrete payment implementations.

## 9. Design

```text
Client
  ↓
PaymentService
  ↓
PaymentStrategy
  ├── CardPayment
  ├── UpiPayment
  └── WalletPayment

PaymentService
  ↓
Payment Events
  ├── Audit
  ├── Notification
  └── Analytics
```

## 10. Interview Discussion

A good interview answer should explain why each abstraction exists instead of simply naming patterns.

Ask:

- How would you add a new payment method?
- How would you test payment processing?
- How would you handle retries?
- How would you make payment processing idempotent?
- Where would transaction state be stored?

The patterns are tools; the requirements drive the design.
