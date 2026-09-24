# Strategy vs State

## 1. Overview

Strategy and State often have very similar class structures:

```text
Context
   ↓
Interface
  / \
A   B
```

The important difference is **why the behavior changes**.

## 2. Strategy

Strategy represents interchangeable algorithms.

Example:

```text
PaymentService
      ↓
PaymentStrategy
   /       \
Card      UPI
```

```cpp
class PaymentStrategy
{
public:
    virtual void pay(double amount) = 0;
    virtual ~PaymentStrategy() = default;
};
```

The client or configuration can select the strategy.

## 3. State

State represents behavior that changes according to the object's internal state.

Example:

```text
Door
 ↓
State
 /  \
Locked  Unlocked
```

The context changes state during its lifecycle.

## 4. Key Difference

| Strategy | State |
|---|---|
| Represents an algorithm | Represents an object state |
| Usually selected externally | Often changes internally |
| Strategies are interchangeable | States often transition |
| Focuses on how to perform an operation | Focuses on behavior based on current state |

## 5. Example

### Strategy

```cpp
PaymentService service(cardPayment);
service.process(100);
```

The selected algorithm is supplied to the service.

### State

```cpp
door.lock();
door.open();
```

The behavior of `open()` depends on the door's current state.

## 6. Common Confusion

Both patterns use composition and polymorphism.

The difference is mainly semantic:

```text
Strategy → "Which algorithm should I use?"

State → "What should I do because of my current state?"
```

## 7. Interview Question

**Q: Can Strategy and State have identical class diagrams?**

Yes. Their structure can be similar. The intent and responsibility distinguish them.
