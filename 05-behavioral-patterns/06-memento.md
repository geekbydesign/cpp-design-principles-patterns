# Memento Pattern

## 1. Intent

> Capture and externalize an object's internal state so that it can be restored later without violating encapsulation.

Typical use cases include:

- Undo operations
- Save points
- Editor history
- Game checkpoints

## 2. Example

Originator:

```cpp
class Editor
{
    std::string text;

public:
    void setText(const std::string& value)
    {
        text = value;
    }

    std::string getText() const
    {
        return text;
    }
};
```

Memento:

```cpp
class EditorMemento
{
    std::string text;

public:
    explicit EditorMemento(std::string text)
        : text(std::move(text))
    {
    }

private:
    friend class Editor;

    const std::string& getText() const
    {
        return text;
    }
};
```

In a complete implementation, the editor can create and restore mementos while keeping the state details encapsulated.

## 3. Structure

```text
Originator
    ↓ creates
Memento
    ↓ stored by
Caretaker
```

The caretaker stores history but should not need to understand the internal state.

## 4. Benefits

- Supports undo/restore
- Preserves encapsulation
- Keeps history management separate

## 5. C++ Considerations

For small state objects, copying can be simple and efficient.

For large state, consider:

- Copy cost
- Move semantics
- Shared immutable state
- Copy-on-write where appropriate

## 6. Memento vs Command

```text
Command
    Stores an operation.

Memento
    Stores a snapshot of state.
```

They are often combined for undo systems.

## 7. Interview Question

**Q: What does the Caretaker do?**

The Caretaker stores and manages mementos but normally does not modify or interpret their internal state.
