import Foundation

// Lesson 1.
// Physics.  Binary.  Integers.

// It's all physics.
// Physics is hard, but we need to know it exists.  Sort of.
// Further reading: https://en.wikipedia.org/wiki/Semiconductor_memory

// The TL;DR of physics related to computers:
// Geniuses worked out physics and wrote the equations.  Thanks Maxwell!
// Really smart people discovered how to store electricity in really small components.
// More smart people organized those components and integrated into circuits.
// Other smart people wrote controlling software to save/retrieve/manipulate the charges in those components.
// All so the rest of us mere mortals can manupulate billions of transistors in our devices and don't need to think too hard.

let zero = 0b0000_0000
let one  = 0b0000_0001
let two  = 0b0000_0010
let four = 0b0000_0100

// there are 10 types of people in this world.  Those who understand binary, and those who don't.
// #nerdHumor

// the above is a one to one representation of a byte on disk/ram.  8 discrete bits that either have electrical charge (1) or do not (0).
// and by the magic of a 2 based number system 10 == 2 and 100 == 4 and so on.
// 🤯 how high can you count using your fingers? It's not 0-10.  It's 0 - 2^10. 🤯

print(zero)
print(one)
print(two)
print(four)

// Writing stuff in 1s and 0s is annoying.
// So yet another group of smart people wrote programming languages to use 10 based decimal number system.

let intFour: Int = 4
print(four == intFour)

// Int (Integer) is a Type.  A basic building block in Swift that makes our life easier by abstracting out the hard stuff.
// Cool.  So 4 is still 100 stored as electrical charges on disk/ram but we **usually** don't have to think about that.
// For the times we do need to think about that... intFour is not actually 100 on disk.  I lied.  It's 0b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0100 on disk.  Because Int is by default 64 bits on a modern mac machine.

let intSizeBytes = MemoryLayout.size(ofValue: intFour)
print("Int memory size on disk: \(intSizeBytes) bytes.  \(intSizeBytes * 8) bits.") // 1 byte = 8 bits.

// If you have one or two Ints at 64bits (8 bytes) each in memory, then who cares.  Your RAM has Gigabytes of spare memory.
// Sometimes you do care though - and you'll want to use a data Type with less space..  Think of Images:

struct DataHogPixel { // we'll cover `structs` later, but for now just understand this one is a container for three integers.
    let red, green, blue: Int
}

// 💡
// `let` is the keyword to set a variable that does not change (Immutable).
// `var` is the keyword to set a variable that is expected to change (Mutable).
// 💡
let dataHogPixel = DataHogPixel(red: 255, green: 255, blue: 255)
var pixelMemorySize = MemoryLayout.size(ofValue: dataHogPixel)
print("data hog pixel bytes: \(pixelMemorySize)")

var image = pixelMemorySize * 1024 * 1024
var iphoneCameraImage = pixelMemorySize * 4032 * 3024
print("1024 x 1024 image memory size: \(image) bytes")
print("iPhone Camera image memory size: \(iphoneCameraImage) bytes")

// 390mb for a single image on your phone.
let twoFiftySixGBDrive = 256_000_000_000 // bytes
print("pictures I can hold on my drive with poorly chosen data types: \(twoFiftySixGBDrive / iphoneCameraImage) .. And nothing else.")


// Let's find a better suited data Type.  Pixel rgb values are 0-255.
print(Int.max) // <--- 😳 that's waaaaaay more than 255
// try this one:
print(UInt8.max) // <--- 😀👍
// 'U' is for 'Unsigned' meaning it doesn't go negative.  8 is for bits.  There's also Int32 & Int16 both signed and unsigned.
print("signed max/min: \(Int8.max)/\(Int8.min)")
print("unsigned max/min: \(UInt8.max)/\(UInt8.min)")
// UInt8 is the clear Type choice for 0-255 rgb values in a pixel.

struct SmartPixel {
    let red, green, blue: UInt8
}

// 🪓🧨
// Have some fun breaking things by assigning a number greater than 255 in the values below.  Even computers can run out of "fingers" and "toes" when counting things.
// 🪓🧨
let smartPixel = SmartPixel(red: 255, green: 255, blue: 255)
pixelMemorySize = MemoryLayout.size(ofValue: smartPixel)
print("smart pixel bytes: \(pixelMemorySize)")
image = pixelMemorySize * 1024 * 1024
iphoneCameraImage = pixelMemorySize * 4032 * 3024
print("1024 x 1024 image memory size: \(image) bytes")
print("iPhone Camera image memory size: \(iphoneCameraImage) bytes")

print("pictures I can hold on my drive with better chosen data types: \(twoFiftySixGBDrive / iphoneCameraImage) .. And nothing else.")
// Okay.. so we still need to do a lot of compression to match the iphone's image format performance.
// Compression algorithms are out of the scope of this lesson.  (or my knowledge)


// REVIEW:
// everything computer is based on binary electrical charges.
// modern languages abstract out the hard stuff and give us easy to use Types, like Int.  so we can type 255 instead of 0b1111_1111
// Types have size on disk which we **sometimes** need to give some thought to.

// further fun: Google search and play with bitwise operators.

// NOTES:
// 0b is shorthand for binary.
// 0x is shorthand for hexidecimal.  0xff == 0b1111_1111 == 255
// _ underscores in numbers are ignored by the compiler.  they're just there for our ease of reading.

