# Type Erasure

## 1. Definition

Type erasure allows code to work with objects through a common interface without exposing their concrete types.

It is useful when different concrete types provide compatible behavior but do not share a common inheritance hierarchy.

## 2. Example With `std::function`

Consider:

```cpp
void execute(std::function<int(int)> operation)
{
    std::cout << operation(10);
}
```

The caller can provide:

```cpp
execute([](int x)
{
    return x * 2;
});
```

or:

```cpp
struct Square
{
    int operator()(int x) const
    {
        return x * x;
    }
};

execute(Square{});
```

The implementation does not need to know the concrete callable type.

## 3. Type Erasure Concept

Conceptually:

```text
Different concrete types
       ↓
   Type Erasure
       ↓
Common operations
```

## 4. Common C++ Examples

C++ already uses type erasure in:

- `std::function`
- `std::any`
- `std::shared_ptr` deleters
- Some uses of `std::variant` and polymorphic wrappers

## 5. Manual Type Erasure

A common technique uses:

```text
Public wrapper
     ↓
Abstract concept
     ↓
Concrete model<T>
```

For example:

```cpp
class Drawable
{
    struct Concept
    {
        virtual void draw() const = 0;
        virtual ~Concept() = default;
    };

    template<typename T>
    struct Model : Concept
    {
        T object;

        explicit Model(T object)
            : object(std::move(object))
        {
        }

        void draw() const override
        {
            object.draw();
        }
    };

    std::unique_ptr<Concept> self;

public:
    template<typename T>
    Drawable(T object)
        : self(std::make_unique<Model<T>>(std::move(object)))
    {
    }

    void draw() const
    {
        self->draw();
    }
};
```

## 6. Type Erasure vs Inheritance

Inheritance:

```text
Concrete types must follow a common class hierarchy.
```

Type erasure:

```text
Unrelated types can be wrapped behind a common interface.
```

## 7. Benefits

- Decouples interfaces from concrete types
- Can combine compile-time and runtime polymorphism
- Useful for library APIs
- Can avoid exposing template implementation details

## 8. Costs

Depending on the implementation:

- Indirection
- Dynamic allocation
- Runtime dispatch
- More complex implementation

## 9. Interview Question

**Q: What is type erasure?**

It is a technique that hides the concrete type of an object while exposing only the operations required by the client.
