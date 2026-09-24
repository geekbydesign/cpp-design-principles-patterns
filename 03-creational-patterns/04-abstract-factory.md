# Abstract Factory Pattern

## 1. Intent

> Provide an interface for creating families of related objects without specifying their concrete classes.

The key word is **family**.

## 2. Example

Imagine a UI framework supporting multiple themes.

Each theme needs related components:

```text
Dark Theme
 ├── DarkButton
 └── DarkCheckbox

Light Theme
 ├── LightButton
 └── LightCheckbox
```

The application should not accidentally mix components from different families.

## 3. Product Interfaces

```cpp
class Button
{
public:
    virtual void render() = 0;
    virtual ~Button() = default;
};

class Checkbox
{
public:
    virtual void render() = 0;
    virtual ~Checkbox() = default;
};
```

## 4. Concrete Products

```cpp
class DarkButton : public Button
{
public:
    void render() override {}
};

class DarkCheckbox : public Checkbox
{
public:
    void render() override {}
};
```

## 5. Abstract Factory

```cpp
class UIFactory
{
public:
    virtual std::unique_ptr<Button> createButton() = 0;
    virtual std::unique_ptr<Checkbox> createCheckbox() = 0;

    virtual ~UIFactory() = default;
};
```

Concrete factory:

```cpp
class DarkUIFactory : public UIFactory
{
public:
    std::unique_ptr<Button> createButton() override
    {
        return std::make_unique<DarkButton>();
    }

    std::unique_ptr<Checkbox> createCheckbox() override
    {
        return std::make_unique<DarkCheckbox>();
    }
};
```

## 6. Why Use Abstract Factory?

The client works with:

```cpp
UIFactory
```

rather than:

```cpp
DarkButton
DarkCheckbox
```

This keeps the client independent of concrete product classes.

## 7. Factory Method vs Abstract Factory

| Factory Method | Abstract Factory |
|---|---|
| Usually creates one product | Creates a family of products |
| Often uses inheritance | Often groups multiple creation methods |
| Focuses on one product hierarchy | Focuses on related product families |

## 8. When to Use

Use Abstract Factory when:

- Multiple related products must be created together
- Products must remain compatible
- The concrete product family can vary

## 9. Interview Question

**Q: What is the main difference between Factory Method and Abstract Factory?**

Factory Method focuses on creating a product through a creation method. Abstract Factory provides an interface for creating a family of related products.
