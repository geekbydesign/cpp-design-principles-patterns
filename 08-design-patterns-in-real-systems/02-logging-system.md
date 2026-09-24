# Logging System — Design Patterns in a Real System

## 1. Problem

Design a reusable logging system supporting:

- Multiple log levels
- Console output
- File output
- Multiple destinations
- Runtime configuration
- Thread-safe usage

## 2. Candidate Patterns

```text
Singleton / shared service
Strategy
Chain of Responsibility
Observer
Facade
Dependency Injection
```

The correct choice depends on requirements.

## 3. Log Levels

```cpp
enum class LogLevel
{
    Debug,
    Info,
    Warning,
    Error
};
```

## 4. Sink Abstraction

```cpp
class LogSink
{
public:
    virtual void write(LogLevel level,
                       const std::string& message) = 0;

    virtual ~LogSink() = default;
};
```

Console sink:

```cpp
class ConsoleSink : public LogSink
{
public:
    void write(LogLevel level,
               const std::string& message) override
    {
        // write to console
    }
};
```

File sink:

```cpp
class FileSink : public LogSink
{
public:
    void write(LogLevel level,
               const std::string& message) override
    {
        // write to file
    }
};
```

## 5. Composite-Style Fan-Out

A logger can contain multiple sinks:

```cpp
class Logger
{
    std::vector<std::unique_ptr<LogSink>> sinks;

public:
    void addSink(std::unique_ptr<LogSink> sink)
    {
        sinks.push_back(std::move(sink));
    }

    void log(LogLevel level,
             const std::string& message)
    {
        for (auto& sink : sinks)
            sink->write(level, message);
    }
};
```

## 6. Facade

The logger itself can provide a simple interface:

```cpp
logger.info("Application started");
logger.error("Connection failed");
```

The caller does not need to know which sinks are involved.

## 7. Strategy

Formatting can be made configurable:

```text
Logger
  ↓
Formatter
 ├── PlainTextFormatter
 └── JsonFormatter
```

## 8. Thread Safety

A production logger may need:

- Mutex protection
- Thread-safe queues
- Background worker thread
- Bounded buffers
- Flush policy

A common architecture is:

```text
Application Threads
        ↓
   Thread-safe Queue
        ↓
   Logger Worker
        ↓
      Sinks
```

## 9. Singleton Consideration

A global logger is sometimes convenient, but Singleton creates hidden dependencies.

Dependency injection is often preferable for testability.

## 10. Interview Questions

- How would you make the logger thread-safe?
- How would you avoid blocking application threads?
- How would you support JSON logging?
- How would you rotate files?
- Would you use Singleton?

The important part is explaining the trade-offs.
