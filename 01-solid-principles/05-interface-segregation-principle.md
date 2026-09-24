# Interface Segregation Principle (ISP)

## Definition

> Clients should not be forced to depend on methods they do not use.

The main idea is to prefer focused interfaces over large interfaces containing unrelated operations.

## Problem

```cpp
class Machine
{
public:
    virtual void print() = 0;
    virtual void scan() = 0;
    virtual void fax() = 0;
};
```

A simple printer may only need `print()` but is forced to implement the other operations.

## Better Design

Split the interface:

```cpp
class Printer
{
public:
    virtual void print() = 0;
    virtual ~Printer() = default;
};

class Scanner
{
public:
    virtual void scan() = 0;
    virtual ~Scanner() = default;
};

class Fax
{
public:
    virtual void fax() = 0;
    virtual ~Fax() = default;
};
```

A multifunction device can implement all three:

```cpp
class MultiFunctionPrinter : public Printer,
                             public Scanner,
                             public Fax
{
public:
    void print() override {}
    void scan() override {}
    void fax() override {}
};
```

A simple printer only implements what it needs.

## Benefits

- Smaller interfaces
- Lower coupling
- Easier testing
- Less unnecessary implementation
- More flexible designs

## Warning Signs

- Large interfaces
- Empty method implementations
- Methods throwing "not supported"
- Classes implementing methods they never use

## Interview Question

**Q: How is ISP different from SRP?**

SRP focuses on the responsibilities of a class.

ISP focuses on keeping interfaces small so clients are not forced to depend on operations they do not need.
