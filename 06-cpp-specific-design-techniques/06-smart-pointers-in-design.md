# Smart Pointers in Design

## 1. Overview

Smart pointers express ownership and lifetime in C++.

The main standard smart pointers are:

```text
std::unique_ptr
std::shared_ptr
std::weak_ptr
```

## 2. `unique_ptr`

Use when there is a single owner.

```cpp
std::unique_ptr<Resource> resource =
    std::make_unique<Resource>();
```

Ownership can be transferred:

```cpp
auto resource2 = std::move(resource);
```

After the move, `resource` no longer owns the object.

## 3. `shared_ptr`

Use when ownership is genuinely shared.

```cpp
auto resource = std::make_shared<Resource>();

auto anotherOwner = resource;
```

Both objects share ownership.

The resource is destroyed when the last owning `shared_ptr` is destroyed.

## 4. `weak_ptr`

Use for a non-owning reference to an object managed by `shared_ptr`.

```cpp
std::weak_ptr<Resource> observer = resource;
```

It does not increase the reference count.

## 5. Avoid Cycles

This can cause a leak:

```text
A shared_ptr → B
B shared_ptr → A
```

Use `weak_ptr` for one side when the relationship is non-owning.

## 6. Design Guidelines

### Prefer `unique_ptr`

When ownership is exclusive:

```cpp
class EngineOwner
{
    std::unique_ptr<Engine> engine;
};
```

### Use `shared_ptr` Carefully

Shared ownership should represent a real lifetime requirement.

Do not use `shared_ptr` simply because ownership is unclear.

### Use References for Non-Owning Dependencies

For example:

```cpp
class PaymentService
{
    PaymentProcessor& processor;
};
```

This clearly indicates that `PaymentService` does not own the processor.

## 7. Smart Pointers and Interfaces

Polymorphic ownership can use:

```cpp
std::unique_ptr<Base>
```

Example:

```cpp
std::unique_ptr<PaymentStrategy> strategy;
```

The base class should normally have a virtual destructor:

```cpp
virtual ~PaymentStrategy() = default;
```

## 8. Summary

```text
unique_ptr → exclusive ownership
shared_ptr → shared ownership
weak_ptr   → non-owning observation
reference  → non-owning dependency
```

## 9. Interview Question

**Q: Why should `shared_ptr` not be the default smart pointer?**

Because it introduces shared ownership and reference-counting overhead. Ownership should be as simple and explicit as the design allows.
