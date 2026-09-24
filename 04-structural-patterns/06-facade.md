# Facade Pattern

## 1. Intent

> Provide a simplified interface to a complex subsystem.

Facade hides unnecessary subsystem complexity from clients.

## 2. Problem

Suppose starting a computer requires:

```cpp
cpu.start();
memory.load();
disk.read();
display.initialize();
```

A client should not necessarily manage all these details.

## 3. Subsystems

```cpp
class CPU
{
public:
    void start() {}
};

class Memory
{
public:
    void load() {}
};

class Disk
{
public:
    void read() {}
};
```

## 4. Facade

```cpp
class ComputerFacade
{
    CPU cpu;
    Memory memory;
    Disk disk;

public:
    void startComputer()
    {
        cpu.start();
        memory.load();
        disk.read();
    }
};
```

Client:

```cpp
ComputerFacade computer;
computer.startComputer();
```

## 5. Benefits

- Simplifies client code
- Reduces coupling to subsystem classes
- Provides a clean entry point
- Encapsulates common workflows

## 6. Facade Does Not Replace the Subsystem

The underlying classes can still exist and be used directly when advanced functionality is required.

The facade provides a convenient high-level interface.

## 7. Facade vs Adapter

```text
Adapter
    Makes an incompatible interface compatible.

Facade
    Makes a complex subsystem easier to use.
```

## 8. When to Use

Use Facade when:

- A subsystem has many classes
- Clients repeatedly perform the same workflow
- You want to hide unnecessary implementation details

## 9. Interview Question

**Q: Does Facade add new functionality?**

Usually its main purpose is not to add new business functionality, but to provide a simpler interface over existing subsystem functionality.
