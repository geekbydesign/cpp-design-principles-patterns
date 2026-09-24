# Program to an Interface

## 1. Principle

> Depend on abstractions rather than concrete implementations.

An interface does not necessarily mean a language-level `interface` keyword. In C++, an abstract class is commonly used.

## 2. Concrete Dependency

```cpp
class MySQLDatabase
{
public:
    void save()
    {
    }
};

class UserService
{
    MySQLDatabase database;

public:
    void saveUser()
    {
        database.save();
    }
};
```

`UserService` is tied to one implementation.

## 3. Programming to an Abstraction

```cpp
class Database
{
public:
    virtual void save() = 0;
    virtual ~Database() = default;
};

class MySQLDatabase : public Database
{
public:
    void save() override
    {
    }
};

class PostgreSQLDatabase : public Database
{
public:
    void save() override
    {
    }
};
```

Now:

```cpp
class UserService
{
    Database& database;

public:
    UserService(Database& database)
        : database(database)
    {
    }

    void saveUser()
    {
        database.save();
    }
};
```

The service does not need to know which concrete database is being used.

## 4. Benefits

- Reduced coupling
- Easier testing
- Easier replacement of implementations
- Better extensibility
- Supports dependency injection

## 5. Important Distinction

Programming to an interface does **not** mean creating an interface for everything.

An abstraction should represent a meaningful variation or contract.

Over-abstraction can make simple code unnecessarily complicated.

## 6. Example

```text
UserService
     |
     v
 Database
   /     /     MySQL  PostgreSQL
```

The high-level code depends on `Database`, not on `MySQLDatabase`.

## 7. Interview Question

**Q: What does "program to an interface, not an implementation" mean?**

It means client code should depend on a stable abstraction or contract instead of being tightly coupled to a specific implementation.
