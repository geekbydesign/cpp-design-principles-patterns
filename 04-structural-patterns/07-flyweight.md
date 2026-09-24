# Flyweight Pattern

## 1. Intent

> Use sharing to support large numbers of fine-grained objects efficiently.

Flyweight is mainly useful when many objects contain repeated, immutable or shared data.

## 2. Intrinsic vs Extrinsic State

### Intrinsic State

Data that can be shared.

Example:

```text
Character type = 'A'
Font = "Arial"
Font size = 12
```

### Extrinsic State

Data specific to a particular use.

Example:

```text
Position = (100, 200)
```

## 3. Example

Instead of storing the same font data in every character object:

```cpp
class Font
{
public:
    std::string name;
    int size;
};
```

Many text characters can reference the same font object.

```cpp
class Character
{
    char value;
    std::shared_ptr<const Font> font;

public:
    Character(char value, std::shared_ptr<const Font> font)
        : value(value), font(std::move(font))
    {
    }
};
```

## 4. Flyweight Factory

A factory can cache shared objects:

```cpp
class FontFactory
{
    std::unordered_map<std::string, std::shared_ptr<const Font>> fonts;

public:
    std::shared_ptr<const Font> getFont(const std::string& name, int size)
    {
        std::string key = name + std::to_string(size);

        auto it = fonts.find(key);

        if (it != fonts.end())
            return it->second;

        auto font = std::make_shared<const Font>(Font{name, size});
        fonts[key] = font;

        return font;
    }
};
```

## 5. Benefits

- Reduced memory usage
- Shared immutable state
- Useful for large numbers of similar objects

## 6. Costs

Flyweight can introduce:

- Caching complexity
- Lookup overhead
- Lifetime management concerns
- More complicated code

## 7. When to Use

Use Flyweight when:

- There are very many similar objects
- A significant portion of their state can be shared
- Memory usage is a real concern

## 8. Interview Question

**Q: What is the key idea behind Flyweight?**

Separate shared intrinsic state from unique extrinsic state and reuse the shared part across many objects.
