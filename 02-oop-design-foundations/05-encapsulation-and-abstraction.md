# Encapsulation and Abstraction

## 1. Encapsulation

Encapsulation means keeping an object's internal state and implementation details controlled behind a public interface.

```cpp
class BankAccount
{
private:
    double balance = 0.0;

public:
    void deposit(double amount)
    {
        if (amount > 0)
            balance += amount;
    }

    double getBalance() const
    {
        return balance;
    }
};
```

The caller cannot directly modify `balance`.

The class controls how the state changes.

## 2. Abstraction

Abstraction means exposing the essential behavior while hiding unnecessary implementation details.

```cpp
class PaymentProcessor
{
public:
    virtual void pay(double amount) = 0;
    virtual ~PaymentProcessor() = default;
};
```

A user of `PaymentProcessor` only needs to know that `pay()` is available.

The implementation can vary.

## 3. Difference

| Encapsulation | Abstraction |
|---|---|
| Controls access to state/implementation | Focuses on what the object exposes |
| Uses access control and class boundaries | Uses interfaces and simplified contracts |
| Protects invariants | Hides unnecessary complexity |

They often work together.

## 4. Example

```cpp
class CoffeeMachine
{
private:
    void heatWater()
    {
    }

    void grindBeans()
    {
    }

public:
    void makeCoffee()
    {
        grindBeans();
        heatWater();
    }
};
```

The user calls:

```cpp
machine.makeCoffee();
```

The internal steps are hidden.

This demonstrates both encapsulation and abstraction.

## 5. Benefits

- Protects object invariants
- Reduces complexity for users
- Reduces coupling
- Makes implementation changes easier
- Creates clearer APIs

## 6. Interview Question

### What is the difference between abstraction and encapsulation?

Abstraction focuses on exposing essential behavior while hiding unnecessary details. Encapsulation focuses on controlling access to state and implementation details.
