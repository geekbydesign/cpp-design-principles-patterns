# Mediator Pattern

## 1. Intent

> Define an object that encapsulates how a set of objects interact.

Instead of objects communicating directly with many other objects, they communicate through a mediator.

## 2. Problem

Suppose several components communicate directly:

```text
A ↔ B
A ↔ C
A ↔ D
B ↔ C
B ↔ D
C ↔ D
```

The number of dependencies can grow quickly.

## 3. Mediator

```text
        Mediator
       /   |   \
      A    B    C
```

Components communicate through the mediator.

## 4. Example

```cpp
class ChatMediator;

class User
{
protected:
    ChatMediator& mediator;

public:
    User(ChatMediator& mediator)
        : mediator(mediator)
    {
    }

    virtual void send(const std::string& message) = 0;
    virtual ~User() = default;
};
```

Mediator:

```cpp
class ChatMediator
{
public:
    virtual void send(User& sender,
                      const std::string& message) = 0;

    virtual ~ChatMediator() = default;
};
```

The mediator controls how messages are distributed.

## 5. Benefits

- Reduces direct dependencies
- Centralizes communication rules
- Makes individual components simpler
- Easier to modify communication behavior

## 6. Risk

The mediator can become a **God object** if too much logic is placed inside it.

Keep the mediator focused on coordination.

## 7. Mediator vs Observer

```text
Observer
    One object publishes changes to multiple observers.

Mediator
    Coordinates communication among multiple interacting objects.
```

## 8. Interview Question

**Q: What problem does Mediator solve?**

It reduces many-to-many dependencies by centralizing communication and coordination.
