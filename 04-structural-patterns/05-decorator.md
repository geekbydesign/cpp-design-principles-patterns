# Decorator Pattern

## 1. Intent

> Attach additional responsibilities to an object dynamically.

Decorator provides an alternative to creating many subclasses for combinations of behavior.

## 2. Problem

Suppose a coffee can have optional features:

```text
Coffee
Coffee + Milk
Coffee + Sugar
Coffee + Milk + Sugar
Coffee + Milk + Whipped Cream
...
```

Creating a subclass for every combination becomes difficult.

## 3. Component

```cpp
class Coffee
{
public:
    virtual double cost() const = 0;
    virtual ~Coffee() = default;
};
```

Concrete component:

```cpp
class SimpleCoffee : public Coffee
{
public:
    double cost() const override
    {
        return 50.0;
    }
};
```

## 4. Decorator

```cpp
class CoffeeDecorator : public Coffee
{
protected:
    std::unique_ptr<Coffee> coffee;

public:
    CoffeeDecorator(std::unique_ptr<Coffee> coffee)
        : coffee(std::move(coffee))
    {
    }
};
```

Concrete decorator:

```cpp
class MilkDecorator : public CoffeeDecorator
{
public:
    using CoffeeDecorator::CoffeeDecorator;

    double cost() const override
    {
        return coffee->cost() + 10.0;
    }
};
```

Usage:

```cpp
std::unique_ptr<Coffee> coffee =
    std::make_unique<SimpleCoffee>();

coffee =
    std::make_unique<MilkDecorator>(std::move(coffee));
```

## 5. Key Idea

```text
Client
  ↓
Decorator
  ↓
Decorator
  ↓
Concrete Component
```

Decorators wrap other objects implementing the same interface.

## 6. Benefits

- Add behavior dynamically
- Avoid subclass explosion
- Combine multiple behaviors
- Follow Open/Closed Principle

## 7. Decorator vs Inheritance

Inheritance adds behavior at class-definition time.

Decorator allows behavior to be composed at runtime.

## 8. Decorator vs Proxy

Decorator usually adds or modifies responsibilities.

Proxy usually controls access to an existing object.

## 9. Interview Question

**Q: Why is Decorator useful?**

It allows behavior to be added dynamically without modifying the original class or creating a separate subclass for every combination.
