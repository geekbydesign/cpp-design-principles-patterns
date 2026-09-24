# Chain of Responsibility Pattern

## 1. Intent

> Pass a request along a chain of handlers until one of them handles it.

The sender does not need to know which handler will process the request.

## 2. Example

Imagine a support system:

```text
Level 1 Support
      ↓
Level 2 Support
      ↓
Manager
```

Each handler decides whether it can handle the request.

## 3. Handler Interface

```cpp
class Handler
{
protected:
    Handler* next = nullptr;

public:
    virtual void handle(int level) = 0;

    void setNext(Handler* handler)
    {
        next = handler;
    }

    virtual ~Handler() = default;
};
```

Concrete handler:

```cpp
class Level1Support : public Handler
{
public:
    void handle(int level) override
    {
        if (level <= 1)
        {
            // handle request
        }
        else if (next)
        {
            next->handle(level);
        }
    }
};
```

## 4. Structure

```text
Client
  ↓
Handler 1
  ↓
Handler 2
  ↓
Handler 3
```

The request can stop at any handler or reach the end without being handled.

## 5. Modern C++ Ownership

If handlers own the next handler, `std::unique_ptr` can express ownership:

```cpp
std::unique_ptr<Handler> next;
```

If the chain does not own the next object, a reference or non-owning pointer may be appropriate.

## 6. When to Use

Useful for:

- Request processing pipelines
- Logging levels
- Authentication/authorization checks
- Validation
- Event processing
- Support escalation

## 7. Advantages

- Sender is decoupled from receiver
- Handlers can be reordered
- New handlers can be added
- Each handler has a focused responsibility

## 8. Drawbacks

- Request may not be handled
- Debugging the chain can be harder
- Long chains can make behavior difficult to trace

## 9. Interview Question

**Q: Does every handler have to process the request?**

No. A handler can process it, pass it to the next handler, or terminate the chain.
