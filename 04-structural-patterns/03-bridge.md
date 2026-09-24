# Bridge Pattern

## 1. Intent

> Separate an abstraction from its implementation so that the two can vary independently.

Bridge uses **composition** to connect an abstraction with an implementation.

## 2. Problem

Suppose we have different remote controls and different devices:

```text
Remote
 ├── TV
 └── Radio

AdvancedRemote
 ├── TV
 └── Radio
```

Inheritance can produce a growing number of combinations.

## 3. Implementation Interface

```cpp
class Device
{
public:
    virtual void on() = 0;
    virtual void off() = 0;
    virtual ~Device() = default;
};
```

Concrete implementation:

```cpp
class TV : public Device
{
public:
    void on() override {}
    void off() override {}
};
```

## 4. Abstraction

```cpp
class Remote
{
protected:
    Device& device;

public:
    Remote(Device& device)
        : device(device)
    {
    }

    virtual void powerOn()
    {
        device.on();
    }

    virtual void powerOff()
    {
        device.off();
    }

    virtual ~Remote() = default;
};
```

Now different remotes can work with different devices.

## 5. Structure

```text
Abstraction
    |
    +----> Implementation
```

For example:

```text
Remote ───────> Device
  |               |
BasicRemote      TV
AdvancedRemote  Radio
```

## 6. Why Bridge?

Without Bridge, independent dimensions can cause class explosion.

If there are:

```text
3 remote types
×
4 device types
=
12 combinations
```

Bridge can reduce this by separating the two dimensions.

## 7. Bridge vs Adapter

Adapter usually makes an existing interface compatible with another interface.

Bridge is normally designed up front to keep two independently varying dimensions separate.

## 8. Interview Question

**Q: What is the main idea of Bridge?**

Separate abstraction from implementation so both can evolve independently.
