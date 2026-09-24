# Vending Machine — Design Patterns in a Real System

## 1. Problem

Design a vending machine supporting:

- Product selection
- Payment
- Change
- Inventory
- Multiple machine states

## 2. Key States

```text
Idle
ProductSelected
PaymentPending
Dispensing
OutOfStock
```

This is a strong candidate for the **State Pattern**.

## 3. State Interface

```cpp
class VendingState
{
public:
    virtual void selectProduct() = 0;
    virtual void insertMoney(double amount) = 0;
    virtual void dispense() = 0;

    virtual ~VendingState() = default;
};
```

Different states implement valid operations differently.

## 4. Strategy

Pricing or change calculation can use Strategy:

```text
ChangeCalculationStrategy
   ├── GreedyChange
   └── OptimizedChange
```

## 5. Factory

Products can be created or loaded using a factory:

```cpp
class ProductFactory
{
public:
    virtual std::unique_ptr<Product> create(
        ProductType type) = 0;

    virtual ~ProductFactory() = default;
};
```

## 6. Chain of Responsibility

Payment validation can be implemented as a pipeline:

```text
ValidateAmount
      ↓
CheckProduct
      ↓
CheckInventory
      ↓
AuthorizePayment
```

Each handler can reject the request or pass it forward.

## 7. Design

```text
VendingMachine
      ↓
Current State
  /    |     \
Idle Selected Dispensing

VendingMachine
      ↓
Inventory

VendingMachine
      ↓
Pricing / Change Strategy
```

## 8. Important State Transitions

```text
Idle
 ↓ select
ProductSelected
 ↓ payment
PaymentPending
 ↓ successful payment
Dispensing
 ↓ complete
Idle
```

## 9. Interview Questions

- How do you model state transitions?
- What happens if payment succeeds but dispensing fails?
- How do you prevent two users from buying the same item?
- How do you calculate change?
- How would you handle refunds?

The difficult part is usually not the pattern. It is defining correct state transitions and failure handling.
