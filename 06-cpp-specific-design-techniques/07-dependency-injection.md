# Dependency Injection

## 1. Definition

Dependency Injection (DI) means:

> An object's dependencies are supplied from outside instead of the object creating them internally.

DI is a technique commonly used to implement the Dependency Inversion Principle.

## 2. Problem

```cpp
class MySQLDatabase
{
public:
    void save() {}
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

`UserService` creates and owns a concrete dependency.

This creates tight coupling.

## 3. Constructor Injection

Define an abstraction:

```cpp
class Database
{
public:
    virtual void save() = 0;
    virtual ~Database() = default;
};
```

Inject it:

```cpp
class UserService
{
    Database& database;

public:
    explicit UserService(Database& database)
        : database(database)
    {
    }

    void saveUser()
    {
        database.save();
    }
};
```

Usage:

```cpp
MySQLDatabase database;
UserService service(database);
```

## 4. Types of Dependency Injection

### Constructor Injection

Dependencies are provided through the constructor.

Usually the clearest approach.

```cpp
Service(Database& database);
```

### Setter Injection

Dependency is provided through a setter.

```cpp
void setDatabase(Database& database);
```

Useful when the dependency is optional or replaceable after construction.

### Method Injection

Dependency is passed only to a particular operation.

```cpp
void process(Database& database);
```

Useful when the dependency is needed only for one operation.

## 5. Benefits

- Lower coupling
- Easier testing
- Explicit dependencies
- Easier replacement of implementations
- Better separation of responsibilities

## 6. Testing

A test implementation can be supplied:

```cpp
class FakeDatabase : public Database
{
public:
    void save() override
    {
        // test behavior
    }
};
```

Then:

```cpp
FakeDatabase database;
UserService service(database);
```

No real database is required.

## 7. DI vs Dependency Inversion Principle

They are related but different.

```text
DIP
    Design principle

Dependency Injection
    Implementation technique
```

DIP says high-level code should depend on abstractions.

DI is one way to provide those abstractions.

## 8. DI vs Service Locator

Service Locator hides dependencies:

```cpp
serviceLocator.getDatabase();
```

Dependency Injection makes dependencies explicit:

```cpp
UserService(Database& database);
```

Explicit dependencies are generally easier to understand and test.

## 9. C++ Considerations

C++ does not require a DI framework for most designs.

Simple constructor injection is often enough.

Avoid introducing a DI framework when a few constructor parameters solve the problem clearly.

## 10. Interview Questions

### Q1. What is Dependency Injection?

Supplying an object's dependencies from outside rather than constructing them internally.

### Q2. Which DI type is generally preferred?

Constructor injection is often preferred because required dependencies are explicit and the object can be constructed in a valid state.

### Q3. Is Dependency Injection the same as Dependency Inversion?

No. Dependency Inversion is a principle; Dependency Injection is a technique for supplying dependencies.
