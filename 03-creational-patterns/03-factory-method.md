# Factory Method Pattern

## 1. Intent

> Define an interface for creating an object, while allowing the implementation of the creation decision to vary.

Factory Method is useful when client code should work with an abstraction rather than directly constructing concrete objects.

## 2. Problem

Suppose a notification service directly creates concrete notifications:

```cpp
class NotificationService
{
public:
    void send(const std::string& type)
    {
        if (type == "EMAIL")
        {
            EmailNotification notification;
            notification.send();
        }
        else if (type == "SMS")
        {
            SmsNotification notification;
            notification.send();
        }
    }
};
```

As more notification types are added, the class becomes harder to maintain.

## 3. Product Interface

```cpp
class Notification
{
public:
    virtual void send() = 0;
    virtual ~Notification() = default;
};
```

Concrete products:

```cpp
class EmailNotification : public Notification
{
public:
    void send() override
    {
        // email
    }
};

class SmsNotification : public Notification
{
public:
    void send() override
    {
        // SMS
    }
};
```

## 4. Factory

A simple factory function can often solve the problem:

```cpp
std::unique_ptr<Notification>
createNotification(const std::string& type)
{
    if (type == "EMAIL")
        return std::make_unique<EmailNotification>();

    if (type == "SMS")
        return std::make_unique<SmsNotification>();

    return nullptr;
}
```

This is commonly called a **Simple Factory**, although it is not one of the original GoF patterns.

## 5. Factory Method

The GoF Factory Method typically uses an overridable creation method:

```cpp
class NotificationService
{
public:
    virtual std::unique_ptr<Notification> createNotification() = 0;

    void send()
    {
        auto notification = createNotification();
        notification->send();
    }

    virtual ~NotificationService() = default;
};
```

Concrete creator:

```cpp
class EmailNotificationService : public NotificationService
{
public:
    std::unique_ptr<Notification> createNotification() override
    {
        return std::make_unique<EmailNotification>();
    }
};
```

## 6. When to Use

Use Factory Method when:

- Creation varies between subclasses
- Client code should not depend on concrete product classes
- Creation logic belongs naturally to a creator hierarchy

## 7. Factory Method vs Simple Factory

```text
Simple Factory
    One function/class
    decides which object to create

Factory Method
    Subclasses can decide
    which product to create
```

## 8. Interview Questions

### Q1. What problem does Factory Method solve?

It separates object creation from object usage and allows subclasses to control which concrete product is created.

### Q2. Is a factory function always a Factory Method?

No. A standalone factory function is commonly called a Simple Factory or Factory Function. GoF Factory Method has a specific polymorphic creator structure.
