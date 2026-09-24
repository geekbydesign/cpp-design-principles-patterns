# Adapter vs Facade

## 1. Overview

Both Adapter and Facade use composition to hide implementation details, but their goals are different.

## 2. Adapter

Adapter makes an incompatible interface usable through the interface expected by the client.

```text
Client
  ↓
Adapter
  ↓
Existing/Legacy Class
```

Example:

```cpp
class Target
{
public:
    virtual void process() = 0;
    virtual ~Target() = default;
};

class LegacyService
{
public:
    void oldProcess();
};

class Adapter : public Target
{
    LegacyService& service;

public:
    Adapter(LegacyService& service)
        : service(service)
    {
    }

    void process() override
    {
        service.oldProcess();
    }
};
```

## 3. Facade

Facade provides a simpler interface to a complex subsystem.

```text
Client
  ↓
Facade
  ↓
Subsystem
 ├── A
 ├── B
 └── C
```

Example:

```cpp
class ComputerFacade
{
    CPU cpu;
    Memory memory;
    Disk disk;

public:
    void start()
    {
        cpu.start();
        memory.load();
        disk.read();
    }
};
```

## 4. Comparison

| Adapter | Facade |
|---|---|
| Solves interface incompatibility | Solves subsystem complexity |
| Usually wraps one main adaptee | Often coordinates multiple classes |
| Converts one interface to another | Simplifies an existing interface |
| Client expects a target interface | Client uses a new simplified interface |

## 5. Easy Way to Remember

```text
Adapter → "Make this interface fit."

Facade  → "Make this subsystem easier to use."
```

## 6. Interview Question

**Q: Can a Facade also use an Adapter?**

Yes. Patterns can be combined. A facade may use adapters internally when subsystem components have incompatible interfaces.
