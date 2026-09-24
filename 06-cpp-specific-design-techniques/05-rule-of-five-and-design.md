# Rule of Five and Design

## 1. Overview

The Rule of Five concerns classes that manage resources and need custom copy/move behavior.

The five special member functions are:

```cpp
Destructor
Copy constructor
Copy assignment operator
Move constructor
Move assignment operator
```

## 2. Example Resource Owner

```cpp
class Buffer
{
    int* data;
    std::size_t size;

public:
    ~Buffer();
    Buffer(const Buffer&);
    Buffer& operator=(const Buffer&);
    Buffer(Buffer&&);
    Buffer& operator=(Buffer&&);
};
```

## 3. Why Does It Matter?

If a class owns a resource such as dynamically allocated memory, the default copy behavior may cause shallow copies.

```text
Object A ──> Resource
Object B ──> same Resource
```

Both objects may then attempt to release the same resource.

## 4. Rule of Zero

Modern C++ often allows a better approach:

> Prefer classes that do not manually manage resources.

For example:

```cpp
class Buffer
{
    std::vector<int> data;
};
```

`std::vector` already manages its memory correctly.

The compiler-generated special members are usually sufficient.

## 5. Rule of Five

If you genuinely need custom resource management, you may need to define:

```cpp
~Buffer();

Buffer(const Buffer&);
Buffer& operator=(const Buffer&);

Buffer(Buffer&&);
Buffer& operator=(Buffer&&);
```

## 6. Design Principle

Prefer:

```text
Rule of Zero
    ↓
Use RAII members
    ↓
Let standard types manage resources
```

rather than immediately implementing the Rule of Five manually.

## 7. Move Semantics

Move operations transfer resources instead of copying them.

Conceptually:

```text
Source
  ↓ owns resource

Move
  ↓

Destination owns resource
Source becomes valid but unspecified
```

## 8. Relationship With RAII

RAII manages resource lifetime.

Rule of Five ensures correct copy/move behavior when a class directly owns a resource.

## 9. Interview Questions

### Q1. What is Rule of Five?

If a class needs custom handling of one of the special member functions related to resource ownership, it may need to explicitly define the full set of copy/move/destructor operations.

### Q2. What is Rule of Zero?

Design classes so resource management is delegated to RAII types such as `std::vector`, `std::string`, and smart pointers, allowing the compiler-generated special members to work correctly.
