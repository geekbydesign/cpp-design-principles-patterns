# Observer Pattern

## 1. Intent

> Define a one-to-many dependency so that when one object changes state, its dependents are notified.

## 2. Structure

```text
             Subject
            /   |   \
           ↓    ↓    ↓
      Observer Observer Observer
```

## 3. Observer Interface

```cpp
class Observer
{
public:
    virtual void update(int value) = 0;
    virtual ~Observer() = default;
};
```

Subject:

```cpp
class Subject
{
    std::vector<Observer*> observers;
    int value = 0;

public:
    void subscribe(Observer& observer)
    {
        observers.push_back(&observer);
    }

    void setValue(int newValue)
    {
        value = newValue;

        for (auto* observer : observers)
            observer->update(value);
    }
};
```

## 4. Example

```text
TemperatureSensor
       ↓
 ┌─────┼─────┐
 ↓     ↓     ↓
Display Logger Alarm
```

When the temperature changes, all interested components are notified.

## 5. Benefits

- Loose coupling
- Dynamic subscription
- Supports event-driven designs
- Easy to add new observers

## 6. Important C++ Issue: Lifetime

A subject storing raw observer pointers must ensure observers remain alive and are unsubscribed appropriately.

Alternative designs can use:

- `std::weak_ptr`
- Subscription tokens
- RAII-based connections

## 7. Observer vs Mediator

```text
Observer
    Notification relationship.

Mediator
    Coordination relationship.
```

## 8. Observer vs Event System

An event bus is often an implementation of observer-like notification, but it may add routing and filtering behavior.

## 9. Interview Question

**Q: What is the biggest practical concern with Observer in C++?**

Lifetime management. The subject must not notify destroyed observers.
