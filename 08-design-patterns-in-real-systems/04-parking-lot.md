# Parking Lot — Design Patterns in a Real System

## 1. Problem

Design a parking lot system supporting:

- Multiple floors
- Multiple parking spot types
- Different vehicle types
- Entry and exit
- Ticket generation
- Parking fee calculation

## 2. Core Entities

```text
ParkingLot
Floor
ParkingSpot
Vehicle
Ticket
Payment
```

## 3. Vehicle Hierarchy

```cpp
class Vehicle
{
public:
    virtual VehicleType type() const = 0;
    virtual ~Vehicle() = default;
};
```

Concrete types:

```text
Car
Motorcycle
Truck
```

## 4. Strategy for Spot Selection

Different strategies may select parking spots differently:

```text
NearestSpotStrategy
FirstAvailableStrategy
LargeVehicleStrategy
```

```cpp
class SpotSelectionStrategy
{
public:
    virtual ParkingSpot* findSpot(
        const Vehicle& vehicle) = 0;

    virtual ~SpotSelectionStrategy() = default;
};
```

## 5. Strategy for Pricing

Pricing can vary:

```text
HourlyPricing
WeekendPricing
PremiumPricing
```

```cpp
class PricingStrategy
{
public:
    virtual double calculate(double duration) = 0;
    virtual ~PricingStrategy() = default;
};
```

## 6. Factory

A factory can create vehicle objects:

```cpp
std::unique_ptr<Vehicle>
createVehicle(VehicleType type);
```

## 7. State

A parking spot can have states:

```text
Available
Occupied
Reserved
OutOfService
```

Instead of large conditional blocks, State can encapsulate state-dependent behavior if the rules become complex.

## 8. Design

```text
ParkingLot
   ↓
ParkingFloor
   ↓
ParkingSpot
   ↓
Vehicle

ParkingLot
   ├── SpotSelectionStrategy
   └── PricingStrategy
```

## 9. Important Design Questions

- Who owns parking spots?
- How is a spot selected?
- How is vehicle-to-spot compatibility determined?
- How is pricing calculated?
- How are concurrent entry requests handled?
- How is a ticket invalidated after payment?

## 10. Interview Focus

Do not immediately create classes for every noun.

First identify:

```text
Responsibilities
Dependencies
Ownership
Changing behavior
Concurrency requirements
```

Then choose appropriate abstractions and patterns.
