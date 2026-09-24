# Dependency Inversion Principle (DIP)

## Definition

The Dependency Inversion Principle states:

1. High-level modules should not depend directly on low-level modules. Both should depend on abstractions.
2. Abstractions should not depend on details. Details should depend on abstractions.

## Problem

```cpp
class MySQLDatabase
{
public:
    void save()
    {
        // save to MySQL
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

`UserService` is tightly coupled to `MySQLDatabase`.

Changing the database technology requires modifying `UserService`.

## Better Design

Introduce an abstraction:

```cpp
class Database
{
public:
    virtual void save() = 0;
    virtual ~Database() = default;
};
```

Implement it:

```cpp
class MySQLDatabase : public Database
{
public:
    void save() override
    {
        // save to MySQL
    }
};
```

Depend on the abstraction:

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

Now the service does not need to know which database implementation is being used.

## Dependency Injection

Passing the dependency from outside is called dependency injection.

```cpp
MySQLDatabase database;
UserService service(database);
```

The dependency is injected into `UserService`.

## Benefits

- Lower coupling
- Easier unit testing
- Easier replacement of implementations
- Better extensibility
- Clearer dependencies

## DIP vs Dependency Injection

These terms are related but not identical.

**DIP** is a design principle.

**Dependency Injection** is a technique commonly used to implement the principle.

## Interview Question

**Q: Why is DIP useful for testing?**

A class can depend on an abstraction, allowing a test double or mock implementation to be supplied instead of a real external dependency.
