import Foundation

// Classes are a basic means of building a model in Swift.  Generally a thing that you want to model is going to "have things" and "do things".  That is is will have some form of state and function.
// Classes are one of a few choices that you have to pick from.  Below is a brief introduction.

class Vehicle {
    var passengers: Int
    var position: Double
    
    init(passengers: Int) {
        self.passengers = passengers
        self.position = 0
    }
    
    func move(distance: Double) {
        position += distance
    }
}

let rocket = Vehicle(passengers: 4)
let motorcycle = Vehicle(passengers: 2)

rocket.move(distance: 1000000)
motorcycle.move(distance: 4)

print("rocket moved \(rocket.position) miles")
print("motorcycle moved \(motorcycle.position) miles")

// Classes can inherit from other classes - Google: Object Oriented Programming

// car will inherit position, passengers and move function
class Car: Vehicle {
    var doors: Int
    var make: String
    var model: String

    init(make: String, model: String, passengers: Int, doors: Int) {
        self.make = make
        self.model = model
        self.doors = doors
        super.init(passengers: passengers)
    }
    
    func drive(driveForward: Bool, distance: Double) {
        driveForward ? (position += distance) : (position -= distance)
    }
}

var sedan = Car(make: "Honda", model: "Accord", passengers: 4, doors: 4)
sedan.move(distance: 1) // inherited function
print("sedan position: \(sedan.position)")
sedan.drive(driveForward: false, distance: 10)
print("sedan position: \(sedan.position)")


// 🚨🚨🚨 Classes are *reference* types. 🚨🚨🚨
// This is in contrast to Structs and Enums to follow - which are *value* types.
// Ints, Doubles & Strings which we covered are all *value* types.

// Reference Type - lives on 'the heap'.  A reference "points" to the allocated memory.  Many references can point to the same memory.
// Value Type - lives on 'the stack'.  A copy is made and passed along to the consumer.

// Analogy
    //- the white board in the classroom is like a reference type - and all the students can reference the same location.  When the white board changes - it changes for everyone.
    //- the worksheets that the teacher copies and hands out are like value types.  Each student will write on it and will not affect any other student's worksheet.

var sedanTwo = sedan
print("sedanTwo.position: \(sedanTwo.position)")

sedan.drive(driveForward: true, distance: 50)
print("sedanTwo.position: \(sedanTwo.position)")

// sedan and sedanTwo are the same object.
sedanTwo.make = "Ferrari"
sedanTwo.model = "Prius"

print("Sedan is now a \(sedan.make) \(sedan.model) 😱")

// Notes for debugging.  When you want to know what a class is/ is doing and out put to the console:
print(sedan) // <-- not very descriptive.  just printing a pointer
dump(sedan) // <-- give you all the info
