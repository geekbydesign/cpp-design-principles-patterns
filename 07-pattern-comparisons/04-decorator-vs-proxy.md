# Decorator vs Proxy

## 1. Overview

Decorator and Proxy both wrap another object and often implement the same interface.

The difference is their primary intent.

## 2. Decorator

Decorator adds or modifies behavior.

```text
Client
  ↓
Decorator
  ↓
Component
```

Example:

```cpp
class Coffee
{
public:
    virtual double cost() const = 0;
    virtual ~Coffee() = default;
};
```

A milk decorator adds behavior:

```cpp
class MilkDecorator : public Coffee
{
    std::unique_ptr<Coffee> coffee;

public:
    MilkDecorator(std::unique_ptr<Coffee> coffee)
        : coffee(std::move(coffee))
    {
    }

    double cost() const override
    {
        return coffee->cost() + 10;
    }
};
```

## 3. Proxy

Proxy controls access to another object.

Examples:

- Lazy initialization
- Access control
- Remote access
- Caching
- Logging

```text
Client
  ↓
Proxy
  ↓
Real Object
```

## 4. Comparison

| Decorator | Proxy |
|---|---|
| Adds responsibilities | Controls access |
| Behavior enhancement | Access management |
| Often stackable | Usually represents one real object |
| Focuses on additional behavior | Focuses on controlling/mediating access |

## 5. Important

The distinction is based on **intent**, not just structure.

Both can contain a reference or pointer to another object and implement the same interface.

## 6. Easy Way to Remember

```text
Decorator → "Add something."

Proxy → "Control access."
```

## 7. Interview Question

**Q: Can a Proxy also add behavior?**

Yes. For example, a caching or logging proxy adds behavior around access. The primary intent is still controlling or mediating access to the real object.
