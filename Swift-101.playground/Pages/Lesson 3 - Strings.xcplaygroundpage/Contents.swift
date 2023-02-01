import Foundation

// Lesson 3
// Make words from transistors.

// We're now familiar with our base computer memory.
// Question arises - how do we turn 0b01101011 into something other than a number?
// I'm glad you ASCII'D .. 🤕 <- what I assume I would look like soon after saying that in public.
// https://www.asciitable.com/

// A = 1, B = 2, C = 3 is a pretty intuitive code.
// And that's **almost** what the ascii table is doing.  with the exception of the first 31 digits being non printable control characters.
// 32 - 64 are printable characters, some numbers, some symbols
// Alphabet in capital goes from 65 - 90, lowercase 97 - 122

if let scalar = UnicodeScalar(65) {
    print(scalar)
}
// the above is an 'Optional' value.  simply means maybe the Integer argument is way out of range and there might not be a valid value for that.  Instead of crashing the program - let's just say it's nil.  More on Optionals later.

let hw = [0x48, 0x65, 0x6C, 0x6C,
    0x6F, 0x20, 0x77, 0x6F,
    0x72, 0x6C, 0x64, 0x21
]

let filtered = hw.compactMap { UnicodeScalar($0) } // just a quick way to cast all the value optionals into Typed values and filter out the Nil values.

print(filtered.map { $0.description }.joined())

// that's.. a lot of code for a simple text, but that's also how things kind of used to be in programming.

let hwString: String = "Hello world!"
print(hwString)

// that's much less.
// under the hood all of the above is happening, but the language Abstracts that complication out for us.

//there's a few ways to swap around the types

var oneInt: Int = 1
// var oneStr: String = oneInt <--- Compiler error
var oneStr: String = String(oneInt) // <-- 👍
var oneStrTwo: String = "\(oneInt)" // <-- 👍

var twoStr = "2" // remember, Swift can (usually) infer the type.
print(oneStr + twoStr) // concatenate okay.
var longString = "A long string used for the purpose of demonstrating operations on long strings."

// longString[3] <-- compiler error. Unfortunately the Python way of doing it won't access the character at that index.. out of the box anyway.  We'll get to 'Extensions' later.

print(longString.replacingOccurrences(of: "s", with: "💰"))

print(longString.prefix(16))
print(longString.suffix(16))
print(longString.randomElement() ?? "No random character") // ?? followed by a value is "Nil coalescing.  More on that in Optionals

print(longString.uppercased())

let multiLineString = """
Strings with several lines
Lots of lines.
lots and lots of lines.
"""

for character in "Dog!🐶" {
    print(character) // note the type is Character, no longer String.
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
var catString = String(catCharacters)
print(catString)
// String can be built from Character array - but a Character cannot be concatenated to a String
catString += "a" // okay because a is of type String
// catString += catCharacters[0] <-- Error
catString.append(catCharacters.last!) // okay.  '!' the bang operator.  more on it's use in optionals.

// Further reading: https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html


