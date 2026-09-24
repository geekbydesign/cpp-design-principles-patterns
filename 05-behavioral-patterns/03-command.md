# Command Pattern

## 1. Intent

> Encapsulate a request as an object.

This allows actions to be stored, queued, logged, undone, or executed later.

## 2. Command Interface

```cpp
class Command
{
public:
    virtual void execute() = 0;
    virtual ~Command() = default;
};
```

Receiver:

```cpp
class Light
{
public:
    void turnOn()
    {
        // turn on
    }

    void turnOff()
    {
        // turn off
    }
};
```

Concrete command:

```cpp
class TurnOnCommand : public Command
{
    Light& light;

public:
    TurnOnCommand(Light& light)
        : light(light)
    {
    }

    void execute() override
    {
        light.turnOn();
    }
};
```

## 3. Invoker

```cpp
class Remote
{
    Command& command;

public:
    Remote(Command& command)
        : command(command)
    {
    }

    void pressButton()
    {
        command.execute();
    }
};
```

## 4. Why Command?

The invoker does not need to know how the operation is performed.

```text
Remote
   ↓
Command
   ↓
Light
```

## 5. Common Uses

- Undo/redo
- GUI actions
- Job queues
- Transaction systems
- Macro recording
- Task scheduling

## 6. Undo

A command can provide:

```cpp
virtual void undo() = 0;
```

For example:

```cpp
class TurnOnCommand : public Command
{
public:
    void execute() override
    {
        // turn on
    }

    void undo() override
    {
        // turn off
    }
};
```

## 7. Command vs Strategy

```text
Command
    Represents an action/request.

Strategy
    Represents an algorithm or way of performing a task.
```

## 8. Interview Question

**Q: Why is Command useful for queues?**

A command object contains the information needed to execute an action later, so it can be stored and processed asynchronously or at a later time.
