import Foundation

// Lesson 2
// Floating point. Types. Type safe.

// Okay so 0b0000_0010 equals 2 is now somewhat intuitive.
// What about 𝜋 3.14?
// 0b0000_0001_0011_1010.. ..0000_0010   <-- Sorta.  Some bits will be reserved for the decimal placement. 314 move the decimal 2 (10) places to the left and --> 3.14.  The point `Float`s around depending on those bits.  Floating point.

let float_𝜋 = Float.pi
print(float_𝜋)
print("Float size in memory: \(MemoryLayout<Float>.size) bytes")

// what more precision?  `Double` the memory footprint.

let 𝜋 = Double.pi
print(𝜋)
print("Double size in memory: \(MemoryLayout<Double>.size) bytes")

// So why do Ints exist? because they're fast to work with.
// Double an Int?
print(0b0000_0010 << 1)
// shift the digits one to the left.  10 becomes 100 (2 -> 4).  Quick and easy.
// halve something? inverse.
print(0b0000_0100 >> 1)

// Doubles don't have that kind of easy bit shifting tricks and take many more clock cycles to compute.

// Int division leads to technically incorrect (but sometimes still useful) math: so don't divide Ints when you need precision.
print(5/2)
print(5.0/2.0)

// Can I swap them around like Python or other languages?
// No.

// 📖📚 Type Safety 📖📚
// Like all safety systems.  Seatbelts, motorcycle helmets, chainsaw guards are all bothersome and restrictive until they save you.
// Bothersome and restrictive is ultimately good.

// Type is inferred by Swift.  Option + click on `a` and `b` to see Type
var a = 3 // inferred Int
var b = 3.14 // inferred Double
// uncomment the below for compiler error 🚨
//a = b

// hmm.. okay.. well Int can't handle the .14.. what about...??
b = 3.0
//a = b //🚨
// same deal

// is there anyway to assign value of one number type to another?
// yep. cast it.
a = Int(b)

// or cast only if there's no decimal precision
var c = Int(exactly: 4.0)
print(c ?? "Couldn't cast") // Nil and nil coallescing will be discussed later.
c = Int(exactly: 4.00001)
print(c ?? "Couldn't cast")

// even different Int types need to be casted.
var int8 = UInt8.max
var intmax = Int.max

// uncomment to see compiler error 🚨
//int8 = intmax
// the above makes sense because Int far exceeds the range of UInt8 and assigning their values to each other could cause crashes.

intmax = Int(int8) // this is okay
int8 = UInt8(intmax) // this is permissible. just note it cut out at UInt8's max range.


