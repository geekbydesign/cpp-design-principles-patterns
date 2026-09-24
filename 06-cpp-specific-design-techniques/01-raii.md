# RAII (Resource Acquisition Is Initialization)

## 1. Definition

RAII is a core C++ resource-management technique where:

> Resource ownership is tied to object lifetime.

A resource is acquired during object construction and released during destruction.

## 2. Basic Example

```cpp
class File
{
    FILE* file = nullptr;

public:
    explicit File(const char* name)
    {
        file = std::fopen(name, "r");
    }

    ~File()
    {
        if (file)
            std::fclose(file);
    }
};
```

When the `File` object leaves scope, its destructor releases the resource.

## 3. Why RAII Matters

RAII provides deterministic cleanup for:

- Memory
- Files
- Mutexes
- Sockets
- Database connections
- OS handles
- Locks

## 4. Modern C++

Prefer standard RAII types when available:

```cpp
auto ptr = std::make_unique<int>(42);
```

The memory is automatically released.

For mutexes:

```cpp
std::lock_guard<std::mutex> lock(mutex);
```

The mutex is released when `lock` leaves scope.

## 5. Exception Safety

RAII is especially important when exceptions occur.

```cpp
void process()
{
    auto resource = std::make_unique<Resource>();

    // If an exception occurs here,
    // resource is still destroyed automatically.
}
```

This prevents resource leaks during stack unwinding.

## 6. RAII and Rule of Five

A resource-owning class must define correct copy/move behavior or use an existing RAII type such as `std::unique_ptr`.

Prefer:

```cpp
std::unique_ptr<Resource>
```

over manually managing raw ownership where possible.

## 7. Key Principle

```text
Acquire resource
       ↓
Object owns resource
       ↓
Object leaves scope
       ↓
Destructor releases resource
```

## 8. Interview Question

**Q: Why is RAII one of the most important C++ techniques?**

Because it makes resource lifetime deterministic and allows cleanup to happen automatically, including during exception handling.
