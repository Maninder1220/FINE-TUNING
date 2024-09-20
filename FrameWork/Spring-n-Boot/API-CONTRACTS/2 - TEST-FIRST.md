# Test Driven Development (TDD)
Writing tests before implementing the application code. 
This is called test driven development (TDD).

Designing the system based on what we want it to do, rather than what the system already does.

Benefit of “test-driving” the application code is that the tests guide you to write the minimum code needed to satisfy the implementation. When the tests pass, you have a working implementation (the application code), and a guard against introducing errors in the future (the tests).


# The Testing Pyramid
unit tests are critical for ensuring code correctness at the smallest level, promoting better software design, and speeding up the development process by catching bugs early.

- Small “Unit” of the System
  A unit refers to the smallest testable part of a software application, usually a method or function.

# 1 - EG - a function is a reusable block of code that can be called with specific arguments to perform a task.
def add_numbers(a, b):
  return a + b

result = add_numbers(3, 5)
print(result)  
~ Output: 8

# 2 - EG - In object-oriented programming, a method is a function that is associated with a specific object. #          It defines the behavior or actions that an object can perform
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  greet() {
    console.log("Hello, my name is " + this.name + ". I am " + this.age + " years old.");
  }
}

const person1 = new Person("Alice", 30);
person1.greet(); 
~ Output: Hello, my name is Alice. I am 30 years old.


Unit Tests: A Unit Test exercises a small “unit” of the system that's isolated from the rest of the system. They should be simple and speedy. You want a high ratio of Unit Tests in your testing pyramid, as they’re key to designing highly cohesive, loosely coupled software.

Integration Tests: Integration Tests exercise a subset of the system and may exercise groups of units in one test. They are more complicated to write and maintain, and run slower than unit tests.

End-to-End Tests: An End-to-End Test exercises the system using the same interface that a user would, such as a web browser. While extremely thorough, End-to-End Tests can be very slow and fragile because they use simulated user interactions in potentially complicated UIs. Implement the smallest number of these tests.

# The Red, Green, Refactor Loop
1. Red - Write a failing test for the desired functionality.
2. Green - Implement the simplest thing that can work to make the test pass.
3. Refactor - Look for opportunities to simplify, reduce duplication, or otherwise improve the code without changing any behavior—to refactor.
4. Repeat!


