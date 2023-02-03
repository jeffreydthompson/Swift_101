import Foundation

// Value types, as explained in lesson 4, are copied and passed along to whatever consumes them.
// Once again the classroom analogy:
//      A reference type is like the white board - anyone getting information from the white board refers to the same instance.  Change it and it changes for everyone.
//      A value type is like the worksheets passed out to students - each one gets a copy that they can all write on, draw on, feed to their dog and claim it got lost and it does not affect any other students worksheet.

// A Struct is a value type.  It is, like a Class, a basic means of modeling things.  It to can "have things" and "do things" ie. have state and function.

struct Pixel {
    var r, g, b: UInt8
    
    var luminance: Double {
        Double(r) * 0.2126 +
        Double(g) * 0.7152 +
        Double(b) * 0.0722
    }
    
    mutating func invert() {
        r = 255 - r
        g = 255 - g
        b = 255 - b
    }
}

let red = Pixel(r: 255, g: 0, b: 0)
var copy = red
copy.b = 255
copy.r = 0

// notice the behavior difference between classes.  Copy is just a worksheet.  You can scribble whatever you want on it.  It doesn't change the original.
print(red)
print(copy)

print(red.luminance)
print(copy.luminance)

// uncomment below to see compiler error 🚨
//red.invert() // <-- red is a 'let' and therefor a constant.  when a func is notated as 'mutating' - it cannot be used by a constant
copy.invert() // <-- a 'var' is happy to be mutated
print(copy)


// notice above that structs get a free intializer, so an explicit init is not necessary, although can be implemented if desired or needed.

// Creating class for for comparison to the struct
class ClassPixel {
    var r, g, b: UInt8
    
    var description: String {
        "r: \(r), g: \(g), b: \(b)"
    }
    
    var luminance: Double {
        Double(r) * 0.2126 +
        Double(g) * 0.7152 +
        Double(b) * 0.0722
    }
    
    init(r: UInt8, g: UInt8, b: UInt8) {
        self.r = r
        self.g = g
        self.b = b
    }

    func invert() {
        r = 255 - r
        g = 255 - g
        b = 255 - b
    }
}

let classRed = ClassPixel(r: 255, g: 0, b: 0)
print(classRed.description) // <- unlike struct, simply printing the class will print the pointer to the class
classRed.invert() // <- Classes are happy to be mutated even if a 'let'
print(classRed.description)
var classBlue = classRed
classBlue.r = 0
classBlue.b = 255
classBlue.g = 0
print("red: \(classRed.description)")
print("blue: \(classBlue.description)")
