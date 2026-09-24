# Medical Device Example — Design Patterns in a Real System

## 1. Purpose

This example demonstrates how SOLID principles and design patterns can appear in a safety-critical C++ medical-device component.

The example is intentionally simplified.

It is **not a medical or regulatory implementation**.

## 2. Example System

Consider a monitoring component that receives sensor data and performs processing.

```text
Sensor
  ↓
Acquisition
  ↓
Signal Processing
  ↓
Validation
  ↓
Alarm / Display / Logging
```

## 3. Requirements

Potential requirements:

- Multiple sensor implementations
- Signal-processing algorithms
- Validation rules
- Alarm notification
- Logging
- Testability
- Deterministic behavior
- Clear ownership
- Hardware abstraction

## 4. Dependency Inversion

Avoid making business logic directly depend on hardware:

```cpp
class Sensor
{
public:
    virtual SensorData read() = 0;
    virtual ~Sensor() = default;
};
```

Hardware implementation:

```cpp
class HardwareSensor : public Sensor
{
public:
    SensorData read() override
    {
        // hardware interaction
    }
};
```

The processing layer depends on `Sensor`, not the hardware implementation.

## 5. Strategy

Signal processing may vary:

```text
SignalProcessor
   ├── FilterA
   ├── FilterB
   └── CalibrationProcessor
```

```cpp
class SignalProcessingStrategy
{
public:
    virtual ProcessedData process(
        const SensorData& data) = 0;

    virtual ~SignalProcessingStrategy() = default;
};
```

This makes algorithms independently testable.

## 6. Observer

Processed data may notify several components:

```text
Signal Processor
      ↓
 ┌────┼─────┐
Display Alarm Logger
```

The processing component should not need to know the internal implementation of each consumer.

## 7. Adapter

A hardware vendor API may have a different interface:

```cpp
class VendorSensorAPI
{
public:
    VendorData acquire();
};
```

An adapter can convert it to the internal abstraction:

```cpp
class SensorAdapter : public Sensor
{
    VendorSensorAPI& api;

public:
    explicit SensorAdapter(VendorSensorAPI& api)
        : api(api)
    {
    }

    SensorData read() override
    {
        auto data = api.acquire();

        // convert VendorData to SensorData
        return {};
    }
};
```

## 8. RAII

Hardware resources should have clear lifetime management.

For example:

```cpp
class DeviceHandle
{
public:
    DeviceHandle()
    {
        // acquire resource
    }

    ~DeviceHandle()
    {
        // release resource
    }
};
```

In production systems, established RAII wrappers should be preferred where available.

## 9. PImpl

PImpl can be useful for hiding platform-specific or vendor-specific implementation details:

```text
Public API
    ↓
PImpl
    ↓
Hardware/Vendor implementation
```

This can also reduce compile-time dependencies.

## 10. SOLID Application

### SRP

Separate:

- Sensor acquisition
- Processing
- Validation
- Alarm handling
- Logging

### OCP

Add new processing strategies without modifying stable processing infrastructure.

### LSP

Sensor implementations must obey the behavioral contract defined by the `Sensor` abstraction.

### ISP

Keep hardware interfaces focused.

### DIP

High-level processing should depend on abstractions.

## 11. Important Safety Considerations

In real medical-device software, design decisions are also constrained by:

- System requirements
- Risk management
- Traceability
- Verification and validation
- Coding standards
- Timing requirements
- Resource constraints
- Hardware behavior
- Fault handling
- Regulatory requirements

A design pattern does not automatically make a system safe.

Correct requirements, architecture, implementation, verification, and validation are essential.

## 12. Interview Discussion

Useful questions include:

- How would you abstract hardware from business logic?
- How would you test sensor processing without hardware?
- How would you handle sensor failure?
- How would you handle timing constraints?
- How would you make dependencies explicit?
- Where would RAII be useful?
- Where would Observer be dangerous or difficult to reason about?
- Would you use Singleton for a device service? Why or why not?

## 13. Key Lesson

For safety-critical C++ systems, patterns should support:

```text
Clear ownership
+
Low coupling
+
Deterministic behavior
+
Testability
+
Traceability
+
Explicit failure handling
```

The design should be driven by system requirements and safety constraints, not by the desire to use as many patterns as possible.
