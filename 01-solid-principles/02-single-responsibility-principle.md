# Single Responsibility Principle (SRP)

## Definition

> A class should have one reason to change.

SRP is about **responsibility**, not simply having one function or one task.

A class should have a focused set of responsibilities that belong together.

## Problem

Consider a class that handles employee data, calculates salary, and generates reports:

```cpp
class Employee
{
public:
    void calculateSalary();
    void saveToDatabase();
    void generateReport();
};
```

This class has multiple unrelated responsibilities.

A change to database storage, salary calculation, or reporting can require modifying the same class.

## Better Design

Separate responsibilities:

```cpp
class Employee
{
public:
    void calculateSalary();
};

class EmployeeRepository
{
public:
    void save(const Employee& employee);
};

class EmployeeReport
{
public:
    void generate(const Employee& employee);
};
```

Now each class has a more focused responsibility.

## Benefits

- Easier maintenance
- Easier testing
- Lower coupling
- Smaller classes
- Changes are more localized

## Important Point

SRP does **not** mean:

> Every class should contain only one function.

It means that the responsibilities of a class should be cohesive and have a single reason to change.

## Interview Question

**Q: What is SRP?**

A class should have one responsibility or, more precisely, one reason to change.
