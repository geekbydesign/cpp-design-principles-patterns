# Notification System — Design Patterns in a Real System

## 1. Problem

Design a notification system supporting:

- Email
- SMS
- Push notification
- Future notification channels

A user may have multiple notification channels.

## 2. Candidate Patterns

```text
Strategy
Factory
Observer
Adapter
Dependency Injection
```

## 3. Notification Interface

```cpp
class NotificationChannel
{
public:
    virtual void send(const std::string& message) = 0;
    virtual ~NotificationChannel() = default;
};
```

## 4. Concrete Channels

```cpp
class EmailChannel : public NotificationChannel
{
public:
    void send(const std::string& message) override
    {
        // send email
    }
};

class SmsChannel : public NotificationChannel
{
public:
    void send(const std::string& message) override
    {
        // send SMS
    }
};
```

## 5. Strategy

The notification service can use different channel implementations.

```cpp
class NotificationService
{
    NotificationChannel& channel;

public:
    explicit NotificationService(NotificationChannel& channel)
        : channel(channel)
    {
    }

    void notify(const std::string& message)
    {
        channel.send(message);
    }
};
```

## 6. Observer

An application event can trigger notifications:

```text
OrderPlaced
     ↓
Notification System
   /     |     \
Email   SMS   Push
```

The order service does not need to directly depend on every notification channel.

## 7. Adapter

Suppose a third-party SMS provider has:

```cpp
class ThirdPartySms
{
public:
    void sendMessage(const char* text);
};
```

An adapter can expose the application's interface:

```cpp
class SmsAdapter : public NotificationChannel
{
    ThirdPartySms& provider;

public:
    explicit SmsAdapter(ThirdPartySms& provider)
        : provider(provider)
    {
    }

    void send(const std::string& message) override
    {
        provider.sendMessage(message.c_str());
    }
};
```

## 8. Design

```text
Application Event
       ↓
Notification Service
       ↓
NotificationChannel
   /      |      \
Email    SMS    Push
```

## 9. SOLID

- SRP → separate channel implementations
- OCP → add new channels without changing core logic
- DIP → depend on `NotificationChannel`
- ISP → keep channel interfaces focused

## 10. Interview Questions

- How would you add WhatsApp notifications?
- How would you retry failed notifications?
- How would you support user preferences?
- How would you prevent duplicate notifications?
- How would you process notifications asynchronously?
