# Coupling and Cohesion

## 1. Coupling

Coupling describes how strongly one module or class depends on another.

### High Coupling

```cpp
class MySQLDatabase
{
public:
    void save();
};

class UserService
{
    MySQLDatabase database;
};
```

`UserService` is directly tied to `MySQLDatabase`.

Changing the database implementation may require changing `UserService`.

### Lower Coupling

```cpp
class Database
{
public:
    virtual void save() = 0;
    virtual ~Database() = default;
};

class UserService
{
    Database& database;

public:
    UserService(Database& database)
        : database(database)
    {
    }
};
```

Now `UserService` depends on an abstraction.

## 2. Cohesion

Cohesion describes how closely related the responsibilities inside a class or module are.

### Low Cohesion

```cpp
class Employee
{
public:
    void calculateSalary();
    void saveToDatabase();
    void sendEmail();
    void generateReport();
};
```

These responsibilities are not necessarily closely related.

### Higher Cohesion

```cpp
class SalaryCalculator
{
public:
    void calculateSalary();
};

class EmployeeRepository
{
public:
    void save();
};

class EmployeeReport
{
public:
    void generate();
};
```

Each class has a focused purpose.

## 3. Good Design

A common goal is:

```text
Low coupling
+
High cohesion
=
More maintainable design
```

## 4. Relationship to SOLID

- SRP encourages cohesive classes.
- DIP helps reduce coupling.
- ISP reduces unnecessary dependencies.
- OCP can reduce the need to modify existing code.

## 5. Interview Questions

### What is coupling?

The degree of dependency between components.

### What is cohesion?

The degree to which the responsibilities of a component belong together.

### Which is generally preferred?

Low coupling and high cohesion.
