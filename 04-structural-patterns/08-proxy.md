# Proxy Pattern

## 1. Intent

> Provide a substitute or placeholder for another object to control access to it.

The proxy implements the same interface as the real object.

## 2. Common Types of Proxy

- Virtual Proxy — delays expensive object creation
- Protection Proxy — controls access
- Remote Proxy — represents an object in another process/system
- Caching Proxy — caches results
- Logging Proxy — records calls

## 3. Example

```cpp
class Image
{
public:
    virtual void display() = 0;
    virtual ~Image() = default;
};
```

Real object:

```cpp
class RealImage : public Image
{
public:
    RealImage()
    {
        // expensive loading
    }

    void display() override
    {
    }
};
```

Proxy:

```cpp
class ImageProxy : public Image
{
    std::unique_ptr<RealImage> image;

public:
    void display() override
    {
        if (!image)
            image = std::make_unique<RealImage>();

        image->display();
    }
};
```

The expensive object is created only when needed.

## 4. Key Idea

```text
Client
  ↓
Proxy
  ↓
Real Object
```

The client works through the same interface.

## 5. Common Uses

### Virtual Proxy

Delay expensive initialization.

### Protection Proxy

Check permissions before forwarding the request.

### Caching Proxy

Return cached data instead of repeatedly calling the real object.

### Logging Proxy

Record requests before forwarding them.

## 6. Proxy vs Decorator

Both can wrap objects.

### Proxy

Controls access to the underlying object.

### Decorator

Adds responsibilities or behavior to the underlying object.

The distinction can sometimes overlap in real systems.

## 7. When to Use

Use Proxy when you need:

- Lazy initialization
- Access control
- Remote access
- Caching
- Monitoring or logging around an object

## 8. Interview Question

**Q: What makes a Proxy different from a normal wrapper?**

A Proxy primarily controls or manages access to another object while presenting a compatible interface.
