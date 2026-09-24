# Builder Pattern

## 1. Intent

> Separate the construction of a complex object from its representation.

Builder is useful when an object has many construction options or when construction naturally involves multiple steps.

## 2. Problem

Consider:

```cpp
class Computer
{
public:
    Computer(
        const std::string& cpu,
        const std::string& gpu,
        int ram,
        int storage,
        bool wifi,
        bool bluetooth);
};
```

This constructor is difficult to read and easy to misuse.

## 3. Builder

```cpp
class Computer
{
public:
    std::string cpu;
    std::string gpu;
    int ram = 0;
    int storage = 0;
    bool wifi = false;
    bool bluetooth = false;
};
```

Builder:

```cpp
class ComputerBuilder
{
    Computer computer;

public:
    ComputerBuilder& cpu(const std::string& value)
    {
        computer.cpu = value;
        return *this;
    }

    ComputerBuilder& gpu(const std::string& value)
    {
        computer.gpu = value;
        return *this;
    }

    ComputerBuilder& ram(int value)
    {
        computer.ram = value;
        return *this;
    }

    ComputerBuilder& storage(int value)
    {
        computer.storage = value;
        return *this;
    }

    ComputerBuilder& wifi(bool value)
    {
        computer.wifi = value;
        return *this;
    }

    ComputerBuilder& bluetooth(bool value)
    {
        computer.bluetooth = value;
        return *this;
    }

    Computer build()
    {
        return computer;
    }
};
```

Usage:

```cpp
Computer computer =
    ComputerBuilder()
        .cpu("Intel")
        .gpu("NVIDIA")
        .ram(32)
        .storage(1000)
        .wifi(true)
        .bluetooth(true)
        .build();
```

## 4. Benefits

- Readable construction
- Handles optional parameters
- Avoids huge constructors
- Allows validation before returning the object
- Can make complex construction easier to understand

## 5. Validation

A builder can validate configuration:

```cpp
Computer build()
{
    if (computer.ram <= 0)
        throw std::invalid_argument("Invalid RAM");

    return computer;
}
```

## 6. When Not to Use

Do not use Builder for every class.

For a simple object:

```cpp
User user("Sachin", 30);
```

a builder may add unnecessary complexity.

## 7. Builder in Modern C++

C++ offers alternatives such as:

- Default member initializers
- Named helper functions
- Parameter objects
- Designated initialization for aggregates in C++20

For C++17 code, Builder remains useful when construction is genuinely complex.

## 8. Interview Questions

### Q1. When should Builder be used?

When an object has complex construction or many optional configuration parameters.

### Q2. Builder vs Factory?

Factory focuses primarily on **which object to create**.

Builder focuses on **how to construct a complex object step by step**.
