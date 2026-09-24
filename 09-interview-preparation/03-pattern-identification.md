# Pattern Identification

## 1. How to Identify a Pattern

Do not identify a pattern only from class names.

Look at:

```text
Intent
Structure
Relationships
Changing behavior
Ownership
Control flow
```

---

## 2. Quick Identification Table

| Problem | Likely Pattern |
|---|---|
| Incompatible interface | Adapter |
| Simplify complex subsystem | Facade |
| Add behavior dynamically | Decorator |
| Control access | Proxy |
| One-to-many notification | Observer |
| Encapsulate request | Command |
| Interchangeable algorithm | Strategy |
| Behavior changes with state | State |
| Create objects without exposing construction | Factory |
| Create product families | Abstract Factory |
| Complex step-by-step construction | Builder |
| Copy an existing object | Prototype |
| Global single instance | Singleton |
| Tree-like part-whole hierarchy | Composite |
| Separate abstraction from implementation | Bridge |
| Reduce object memory usage | Flyweight |
| Pass request through handlers | Chain of Responsibility |
| Coordinate many objects | Mediator |
| Save and restore state | Memento |
| Common algorithm skeleton | Template Method |
| Add operations to stable object structures | Visitor |
| Traverse collection without exposing representation | Iterator |

---

## 3. Adapter Clue

Look for:

```text
Existing class
        ↓
Different interface
        ↓
Adapter
```

Question to ask:

**Are we translating one interface into another?**

If yes, Adapter is a candidate.

---

## 4. Facade Clue

Look for:

```text
Many complex classes
        ↓
Simple API
```

Question:

**Does the client need a simpler entry point to a subsystem?**

If yes, Facade.

---

## 5. Strategy Clue

Look for:

```text
Same overall task
+
Different algorithms
```

Examples:

```text
Sorting strategy
Pricing strategy
Payment strategy
Compression strategy
```

---

## 6. State Clue

Look for:

```text
Current state affects behavior
```

Examples:

```text
Vending machine
Elevator
TCP connection
Media player
```

---

## 7. Observer Clue

Look for:

```text
One object changes
        ↓
Many interested objects react
```

Examples:

```text
GUI events
Stock updates
Sensor events
Application events
```

---

## 8. Command Clue

Look for:

```text
Request/action
     ↓
Object
```

Especially when requests must be:

- Stored
- Queued
- Undone
- Retried
- Logged

---

## 9. Factory Clue

Look for:

```text
Client
  ↓
Factory
  ↓
Concrete object
```

The important question is:

**Is object creation complex or varying independently from object usage?**

---

## 10. Decorator Clue

Look for multiple wrappers:

```text
Base Object
   ↓
Decorator
   ↓
Decorator
   ↓
Decorator
```

Behavior is accumulated dynamically.

---

## 11. Proxy Clue

Look for:

```text
Client
  ↓
Proxy
  ↓
Real Object
```

The proxy controls access.

Common examples:

- Caching
- Authorization
- Lazy initialization
- Remote access

---

## 12. Chain of Responsibility Clue

Look for:

```text
Handler A → Handler B → Handler C
```

Each handler can:

- Handle the request
- Reject it
- Pass it onward

---

## 13. Composite Clue

Look for tree structures:

```text
        Root
       /    \
    Leaf   Composite
             /  \
          Leaf  Leaf
```

Client treats individual objects and groups uniformly.

---

## 14. Bridge Clue

Look for two dimensions changing independently.

```text
Abstraction
    ↓
Implementation
```

Example:

```text
Shape
 ├── Circle
 └── Rectangle

Renderer
 ├── OpenGL
 └── DirectX
```

Bridge avoids creating every combination through inheritance.

---

## 15. Visitor Clue

Look for:

```text
Stable object structure
+
Many operations
```

Example:

```text
AST
 ├── Expression
 ├── Statement
 └── Declaration
```

Operations:

```text
CodeGenerator
PrettyPrinter
TypeChecker
```

---

## 16. Pattern Identification Rule

Ask these questions in order:

### Q1

Is the problem mainly about **creating objects**?

→ Creational pattern

### Q2

Is it mainly about **connecting/wrapping objects**?

→ Structural pattern

### Q3

Is it mainly about **behavior or communication**?

→ Behavioral pattern

Then identify the specific intent.

---

## 17. Important Warning

Do not force a pattern because the problem statement contains a familiar word.

For example:

> "There are multiple algorithms."

This suggests Strategy, but first ask whether the algorithms actually vary independently and need to be selected dynamically.

Pattern identification is about **design intent**, not keywords.
