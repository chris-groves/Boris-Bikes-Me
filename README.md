# Boris Bikes
A Ruby based programme to support the operating of London's 'Boris Bikes'. This is a system whereby members of the public can pick up pedal bikes to use from various locations around the city.

The goal is to refine my programming skills in the following areas:

* working with User Stories
* domain modeling
* test driving the development of a programme
* debugging
* adhering to object orientated principles such as encapsulation

The project originates from the Makers Academy coding bootcamp - further details can be found here:

https://github.com/makersacademy/course/blob/master/boris_bikes/0_challenge_map.md

# User Stories

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```

# Domain Models

| Objects         | Messages      |
| --------------- |:-------------:|
| Person          |               |
| Bike            | working       |  
| Docking Station | release       |   

Docking Station ---> release ---> Bike

Bike ---> working?
