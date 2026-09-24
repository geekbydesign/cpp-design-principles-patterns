# Template Method Pattern

## 1. Intent

> Define the skeleton of an algorithm in a base class while allowing subclasses to redefine certain steps.

## 2. Example

Suppose several data processors follow the same workflow:

```text
Read data
   ↓
Process data
   ↓
Save data
```

The overall algorithm is fixed, but processing may vary.

## 3. Implementation

```cpp
class DataProcessor
{
public:
    void process()
    {
        read();
        transform();
        save();
    }

    virtual ~DataProcessor() = default;

protected:
    virtual void read() = 0;
    virtual void transform() = 0;
    virtual void save() = 0;
};
```

Concrete implementation:

```cpp
class CsvProcessor : public DataProcessor
{
protected:
    void read() override {}
    void transform() override {}
    void save() override {}
};
```

The public algorithm is fixed:

```cpp
process()
```

while individual steps vary.

## 4. Benefits

- Reuses common algorithm structure
- Prevents subclasses from changing the overall workflow
- Centralizes invariant steps
- Allows controlled customization

## 5. Template Method vs Strategy

```text
Template Method
    Uses inheritance.
    Algorithm skeleton is defined in a base class.

Strategy
    Uses composition.
    Entire algorithm can be replaced.
```

## 6. When to Use

Use Template Method when:

- The overall algorithm is stable
- Specific steps need customization
- Subclasses are a natural fit

## 7. C++ Consideration

The Template Method function should generally not be virtual if the base class must control the algorithm sequence.

The customizable steps can be virtual.

## 8. Interview Question

**Q: Why is Template Method different from Strategy?**

Template Method fixes the overall algorithm structure and lets subclasses customize steps. Strategy replaces the algorithm through composition.
