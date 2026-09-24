# SOLID Principles — Summary

## The Five Principles

| Principle | Core Idea |
|---|---|
| **SRP** | One responsibility / one reason to change |
| **OCP** | Open for extension, closed for modification |
| **LSP** | Subtypes should be safely substitutable |
| **ISP** | Prefer focused interfaces |
| **DIP** | Depend on abstractions, not concrete details |

## Quick Revision

### SRP

Ask:

> Does this class have multiple unrelated reasons to change?

If yes, consider separating responsibilities.

### OCP

Ask:

> Can new behavior be added without repeatedly modifying stable code?

Use abstractions and polymorphism where appropriate.

### LSP

Ask:

> Can the derived type really be used wherever the base type is expected?

If not, the abstraction or inheritance relationship may be wrong.

### ISP

Ask:

> Are clients forced to depend on operations they don't need?

If yes, consider smaller interfaces.

### DIP

Ask:

> Does high-level business logic depend directly on low-level implementation details?

If yes, introduce an appropriate abstraction.

## How They Work Together

A typical design can use several principles together:

```text
SRP
 ↓
Focused classes
 ↓
ISP
 ↓
Focused interfaces
 ↓
DIP
 ↓
High-level code depends on abstractions
 ↓
OCP
 ↓
New implementations can be added
 ↓
LSP
 ↓
Implementations remain safely substitutable
```

## SOLID Is Not a Checklist

Do not apply SOLID mechanically.

Good design requires balancing:

- Simplicity
- Coupling
- Cohesion
- Extensibility
- Testability
- Abstraction
- Complexity

Too little abstraction can make code rigid.

Too much abstraction can make simple code unnecessarily complicated.

## Interview Cheat Sheet

```text
SRP → One reason to change
OCP → Extend without modifying stable code
LSP → Derived types must preserve the base contract
ISP → Small, focused interfaces
DIP → Depend on abstractions
```

## Final Takeaway

SOLID principles are guidelines for creating maintainable object-oriented software.

They are most useful when applied to real design problems rather than memorized as definitions.
