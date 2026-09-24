# State Pattern

## 1. Intent

> Allow an object to alter its behavior when its internal state changes.

The object appears to change its class from the perspective of the client.

## 2. Problem

A large state-based implementation often becomes:

```cpp
if (state == LOCKED)
{
    // ...
}
else if (state == UNLOCKED)
{
    // ...
}
else if (state == OUT_OF_ORDER)
{
    // ...
}
```

As states increase, the class becomes difficult to maintain.

## 3. State Interface

```cpp
class State
{
public:
    virtual void handle() = 0;
    virtual ~State() = default;
};
```

Concrete states:

```cpp
class LockedState : public State
{
public:
    void handle() override
    {
        // locked behavior
    }
};

class UnlockedState : public State
{
public:
    void handle() override
    {
        // unlocked behavior
    }
};
```

Context:

```cpp
class Door
{
    std::unique_ptr<State> state;

public:
    void setState(std::unique_ptr<State> newState)
    {
        state = std::move(newState);
    }

    void handle()
    {
        state->handle();
    }
};
```

## 4. When to Use

Useful when:

- Behavior varies significantly by state
- There are many state-dependent conditions
- State transitions are important
- State logic is growing inside one class

## 5. State vs Strategy

The structures can look similar.

```text
Strategy
    Client usually chooses the algorithm.

State
    Context changes behavior as its internal state changes.
```

State often includes transitions between states.

## 6. Benefits

- Removes large conditional blocks
- Encapsulates state-specific behavior
- Makes transitions explicit
- Easier to add new states

## 7. Interview Question

**Q: What is the main difference between State and Strategy?**

Strategy represents interchangeable algorithms chosen by a client or configuration. State represents behavior that changes because the object's internal state changes.
