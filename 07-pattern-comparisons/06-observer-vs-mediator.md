# Observer vs Mediator

## 1. Overview

Observer and Mediator both deal with communication between objects, but they solve different communication problems.

## 2. Observer

Observer establishes a one-to-many notification relationship.

```text
       Subject
       /  |  \
      ↓   ↓   ↓
     A    B    C
```

When the subject changes, observers are notified.

```cpp
class Observer
{
public:
    virtual void update() = 0;
    virtual ~Observer() = default;
};
```

## 3. Mediator

Mediator centralizes communication between multiple objects.

```text
       Mediator
      /   |   \
     A    B    C
```

Instead of objects communicating directly with each other, they communicate through the mediator.

## 4. Comparison

| Observer | Mediator |
|---|---|
| Notification mechanism | Coordination mechanism |
| Usually one-to-many | Often many-to-many |
| Subject publishes changes | Mediator coordinates interactions |
| Observers react to events | Components collaborate through mediator |

## 5. Example

### Observer

```text
TemperatureSensor
       ↓
Display
Logger
Alarm
```

The sensor publishes temperature changes.

### Mediator

```text
       ChatRoom
      /   |   \
    User User User
```

The chat room coordinates messages between users.

## 6. Easy Way to Remember

```text
Observer → "Something changed; notify interested objects."

Mediator → "These objects need to coordinate; I'll manage the communication."
```

## 7. Risks

### Observer

Main concern:

- Observer lifetime
- Too many notifications
- Difficult event tracing

### Mediator

Main concern:

- Mediator becoming a God object
- Too much business logic centralized in one class

## 8. Interview Question

**Q: Can Mediator use Observer internally?**

Yes. Design patterns can be combined. A mediator may use event notification mechanisms internally while coordinating a larger interaction.
