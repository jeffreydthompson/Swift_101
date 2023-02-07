import Foundation

// Enums are extremely powerful in Swift
// generally they are used for similar reasons as in other languages
// a known set of discrete and related values - compass points on a map for example are best suited to an enum

enum Compass {
    case north, south, east, west
}

// Enums in Swift have far more capabilities than this however.  Enums can have an explicitly stated raw value

enum Planet: String {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

print(Planet.mercury.rawValue.capitalized)

// Enums can have an associated value given to them.

enum Suit: String {
    case hearts, diamonds, clubs, spades
}

enum Card {
    case ace(Suit)
    case king(Suit)
    case queen(Suit)
    case jack(Suit)
    case card(Int, Suit)

    // for a computed value, enum will switch through all cases and compute off of the cases.
    var description: String {
        switch self {
        case .ace(let suit):
            return "Ace of \(suit.rawValue.capitalized)"
        case .king(let suit):
            return "King of \(suit.rawValue.capitalized)"
        case .queen(let suit):
            return "Queen of \(suit.rawValue.capitalized)"
        case .jack(let suit):
            return "Jack of \(suit.rawValue.capitalized)"
        case .card(let value, let suit):
            return "\(value) of \(suit.rawValue.capitalized)"
        }
    }
    
    func enumsCanHaveFuncToo() {
        dump(self)
    }
}

print(Card.ace(.spades).description)
print(Card.jack(.hearts).description)
print(Card.card(8, .clubs).description)
Card.jack(.diamonds).enumsCanHaveFuncToo()

// The associated values are NOT accessible.  they cannot be changed.  The only way to change is to re-init the object.
var ace = Card.ace(.hearts)
//ace.suit <-- does not work
dump(ace)
ace = .ace(.diamonds)
dump(ace)
ace = .jack(.clubs) // the only type constraints is that it remains a Card

