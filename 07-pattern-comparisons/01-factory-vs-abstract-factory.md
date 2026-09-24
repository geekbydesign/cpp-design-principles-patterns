# Factory Method vs Abstract Factory

## 1. Overview

Both patterns are creational patterns, but they solve different problems.

## 2. Factory Method

Factory Method focuses on creating a product through a creation method.

```text
Creator
   |
   +── Factory Method
           |
           ↓
       Product
```

Example:

```cpp
class Notification
{
public:
    virtual void send() = 0;
    virtual ~Notification() = default;
};

class NotificationService
{
public:
    virtual std::unique_ptr<Notification> create() = 0;

    void send()
    {
        auto notification = create();
        notification->send();
    }

    virtual ~NotificationService() = default;
};
```

The concrete creator decides which product to create.

## 3. Abstract Factory

Abstract Factory creates a **family of related products**.

```text
UIFactory
   ├── createButton()
   └── createCheckbox()
```

Example:

```cpp
class UIFactory
{
public:
    virtual std::unique_ptr<Button> createButton() = 0;
    virtual std::unique_ptr<Checkbox> createCheckbox() = 0;
    virtual ~UIFactory() = default;
};
```

A concrete factory creates compatible products from one family.

## 4. Comparison

| Feature | Factory Method | Abstract Factory |
|---|---|---|
| Main focus | One product creation mechanism | Product family |
| Typical structure | Creator hierarchy | Factory with multiple creation methods |
| Products | Usually one product hierarchy | Multiple related product hierarchies |
| Goal | Vary product creation | Maintain compatible product families |

## 5. Example

### Factory Method

```text
NotificationService
        ↓
   Notification
```

### Abstract Factory

```text
UIFactory
   ├── Button
   └── Checkbox
```

## 6. When to Choose

Use **Factory Method** when the main variation is which implementation of one product should be created.

Use **Abstract Factory** when multiple related products must be created together and remain compatible.

## 7. Interview Question

**Q: Can Abstract Factory use Factory Methods internally?**

Yes. Each creation operation in an Abstract Factory can be implemented using factory-method-like mechanisms.
