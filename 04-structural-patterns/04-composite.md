# Composite Pattern

## 1. Intent

> Compose objects into tree structures and allow clients to treat individual objects and compositions uniformly.

Composite is useful for **part-whole hierarchies**.

## 2. Example

A file system:

```text
Root
├── file.txt
├── document.pdf
└── Projects
    ├── app.cpp
    └── main.cpp
```

A file and directory should both be usable through a common abstraction.

## 3. Component

```cpp
class FileSystemItem
{
public:
    virtual void show() const = 0;
    virtual ~FileSystemItem() = default;
};
```

Leaf:

```cpp
class File : public FileSystemItem
{
public:
    void show() const override
    {
        // show file
    }
};
```

Composite:

```cpp
class Directory : public FileSystemItem
{
    std::vector<std::unique_ptr<FileSystemItem>> children;

public:
    void add(std::unique_ptr<FileSystemItem> item)
    {
        children.push_back(std::move(item));
    }

    void show() const override
    {
        for (const auto& child : children)
            child->show();
    }
};
```

## 4. Key Idea

Both:

```text
File
Directory
```

implement:

```text
FileSystemItem
```

Therefore the client can treat them uniformly.

## 5. Common Examples

- File systems
- GUI component trees
- Organization hierarchies
- Scene graphs
- Expression trees
- Menu/submenu structures

## 6. When to Use

Use Composite when:

- Data naturally forms a tree
- Leaves and groups should share an interface
- Recursive operations are common

## 7. C++ Consideration

`std::unique_ptr` is often appropriate for owning child objects because the composite commonly owns its children.

## 8. Interview Question

**Q: What is the defining characteristic of Composite?**

It allows clients to treat individual objects and groups of objects through the same interface.
