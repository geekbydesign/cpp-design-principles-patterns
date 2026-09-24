# Singleton Pattern

## 1. Intent

> Ensure a class has only one instance and provide a global point of access to it.

Typical examples include:

- Configuration objects
- Process-wide services
- Certain logging facilities

However, Singleton should be used carefully because it introduces shared global state.

## 2. Basic Implementation

```cpp
class Logger
{
public:
    static Logger& instance()
    {
        static Logger logger;
        return logger;
    }

    void log(const std::string& message)
    {
        // log message
    }

private:
    Logger() = default;

    Logger(const Logger&) = delete;
    Logger& operator=(const Logger&) = delete;
};
```

Usage:

```cpp
Logger::instance().log("Hello");
```

## 3. Why Function-Local Static?

```cpp
static Logger logger;
```

Since C++11, initialization of a function-local static is thread-safe.

The object is initialized the first time execution reaches the declaration.

## 4. Key Characteristics

- One instance per process/program context
- Controlled construction
- Global access point
- Copying disabled

## 5. Problems With Singleton

Singleton can create:

- Global state
- Hidden dependencies
- Difficult unit testing
- Tight coupling
- Lifetime dependencies
- Concurrency concerns for mutable state

For example:

```cpp
class PaymentService
{
public:
    void process()
    {
        Logger::instance().log("payment");
    }
};
```

The dependency on `Logger` is hidden.

Dependency injection makes the dependency explicit:

```cpp
class PaymentService
{
    Logger& logger;

public:
    PaymentService(Logger& logger)
        : logger(logger)
    {
    }
};
```

## 6. Thread Safety

The creation of a function-local static is thread-safe in modern C++:

```cpp
static Logger logger;
```

But that does **not** mean all operations on the Singleton are thread-safe.

If multiple threads modify shared state, synchronization may still be required.

## 7. Singleton vs Dependency Injection

Prefer dependency injection when:

- Testing is important
- Different implementations may be needed
- Dependencies should be explicit
- Multiple instances may be useful in different contexts

## 8. Interview Questions

### Q1. How do you implement a thread-safe Singleton in modern C++?

A function-local static is a common approach:

```cpp
static Singleton instance;
```

Its initialization is thread-safe since C++11.

### Q2. Is Singleton completely thread-safe?

No. Thread-safe initialization does not make all member operations thread-safe.

### Q3. Why is Singleton often criticized?

Because it behaves like global state and can introduce hidden dependencies and make testing harder.
