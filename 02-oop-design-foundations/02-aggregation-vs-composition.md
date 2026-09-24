# Aggregation vs Composition

## 1. Overview

Both aggregation and composition represent **has-a** relationships, but they differ mainly in **ownership and lifetime**.

## 2. Composition

In composition, the contained object is strongly owned by the containing object.

```cpp
class Engine
{
};

class Car
{
    Engine engine;
};
```

The `Engine` belongs to the `Car`.

When the `Car` is destroyed, its `Engine` is destroyed as part of it.

### Relationship

```text
Car
 └── Engine
```

## 3. Aggregation

In aggregation, the containing object uses another object but does not necessarily own its lifetime.

```cpp
class Teacher
{
};

class Department
{
    Teacher* teacher;

public:
    Department(Teacher* t)
        : teacher(t)
    {
    }
};
```

The `Teacher` can exist independently of the `Department`.

### Relationship

```text
Department ──uses──> Teacher
```

## 4. Modern C++ and Ownership

Ownership should be made explicit where possible.

For example:

```cpp
class Department
{
    std::unique_ptr<Teacher> teacher;
};
```

This indicates ownership.

Where the object is not owned:

```cpp
class Department
{
    Teacher* teacher;
};
```

The raw pointer does not itself express ownership, so the lifetime contract must be clear.

## 5. Key Difference

| Feature | Composition | Aggregation |
|---|---|---|
| Relationship | Strong has-a | Weak has-a |
| Ownership | Usually owned | Usually not owned |
| Lifetime | Dependent | Independent |
| Example | Car → Engine | Department → Teacher |

## 6. Interview Question

**Q: What is the main difference between aggregation and composition?**

Composition represents stronger ownership where the contained object's lifetime is tied to the owner. Aggregation represents a looser relationship where the objects can exist independently.
