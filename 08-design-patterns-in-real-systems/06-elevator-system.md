# Elevator System — Design Patterns in a Real System

## 1. Problem

Design an elevator system supporting:

- Multiple elevators
- Floor requests
- Internal destination requests
- Scheduling
- Elevator states
- Door control

## 2. Core Components

```text
ElevatorSystem
Elevator
Request
Scheduler
Door
Motor
```

## 3. State

An elevator can have states:

```text
Idle
MovingUp
MovingDown
DoorOpening
DoorClosing
OutOfService
```

State can encapsulate behavior associated with each state.

## 4. Strategy

Elevator selection can use Strategy:

```text
ElevatorSelectionStrategy
   ├── NearestElevator
   ├── LeastLoaded
   └── DirectionAware
```

```cpp
class ElevatorSelectionStrategy
{
public:
    virtual Elevator& select(
        const std::vector<Elevator*>& elevators,
        const Request& request) = 0;

    virtual ~ElevatorSelectionStrategy() = default;
};
```

## 5. Command

A floor request can be represented as a command:

```cpp
class ElevatorCommand
{
public:
    virtual void execute() = 0;
    virtual ~ElevatorCommand() = default;
};
```

This can be useful when requests need to be queued or scheduled.

## 6. Observer

Elevator status changes can notify:

```text
Elevator
   ↓
Display
Monitoring
Logging
```

## 7. Design

```text
ElevatorSystem
      ↓
   Scheduler
      ↓
SelectionStrategy
      ↓
  Elevator
   /    Motor   Door
```

## 8. Concurrency

A real elevator system can have concurrent requests.

Important concerns include:

- Synchronizing shared state
- Request ordering
- Avoiding conflicting commands
- Thread-safe queues
- State transitions

## 9. Interview Questions

- How would you select the best elevator?
- How would you handle simultaneous requests?
- How would you avoid starvation?
- How would you model elevator state?
- How would you test the scheduler?

## 10. Key Lesson

Use Strategy for scheduling decisions and State for elevator behavior.

Do not force every possible GoF pattern into the design.
