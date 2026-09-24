# Visitor Pattern

## 1. Intent

> Represent an operation to be performed on elements of an object structure without changing the classes of those elements.

Visitor is useful when the object structure is stable but new operations are added frequently.

## 2. Example

Suppose we have different document elements:

```cpp
class Text;
class Image;
```

Visitor:

```cpp
class DocumentVisitor
{
public:
    virtual void visit(Text& text) = 0;
    virtual void visit(Image& image) = 0;
    virtual ~DocumentVisitor() = default;
};
```

Elements:

```cpp
class DocumentElement
{
public:
    virtual void accept(DocumentVisitor& visitor) = 0;
    virtual ~DocumentElement() = default;
};
```

Concrete element:

```cpp
class Text : public DocumentElement
{
public:
    void accept(DocumentVisitor& visitor) override
    {
        visitor.visit(*this);
    }
};
```

## 3. Double Dispatch

The important idea is that:

```cpp
visitor.visit(*this);
```

selects the correct overload based on the concrete element type.

This is commonly called **double dispatch**.

## 4. Why Visitor?

Suppose the document element hierarchy is stable:

```text
Text
Image
Table
```

but you need many operations:

```text
Render
Export
SpellCheck
Analytics
```

Without Visitor, adding every operation may require modifying each element class.

With Visitor, operations can be represented as separate visitor classes.

## 5. Benefits

- Adds new operations without modifying every element
- Keeps operations separate
- Useful for stable object structures
- Can be useful in compilers and AST processing

## 6. Drawbacks

Visitor makes adding a **new element type** harder because every visitor may need a new overload.

Therefore Visitor is most useful when:

```text
Element types → relatively stable
Operations    → frequently changing
```

## 7. Visitor vs Strategy

```text
Strategy
    Encapsulates one interchangeable algorithm.

Visitor
    Adds operations across a heterogeneous object structure.
```

## 8. Common Uses

- Compiler ASTs
- Expression trees
- Document processing
- Static analysis
- Serialization operations

## 9. Interview Question

**Q: What is the main trade-off of Visitor?**

It makes adding new operations easier, but adding new element types harder because visitors must be updated.
