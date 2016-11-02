//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let someString = "Some string literal value"
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"


for character in "Dog!🐶".characters {
    print(character)
}
let execlamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "😼"]
let catString = String(catCharacters)
print(catString)

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2
let exclamationMark: Character = "!"
welcome.append(execlamationMark)

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparkLingHeart = "\u{1f496}"

let aAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

let unusualMenagerie = "Koala 🐨, Snail 🐽, Penguin 🐧, Dromedary 🐫"
print("unsualMenagerie has \(unusualMenagerie.characters.count) chatacters")

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy:7)
greeting[index]

//greeting[greeting.endIndex]
for index in greeting.characters.indices {
    print("\(greeting[index]) ",terminator: "")
}

welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome)

let quotation = "We're a lot alike, you and I."
let sameQuation = "We're a lot alike, you and I."
if quotation == sameQuation {
    print("These two strings are considered equal")
}

let eAcuteQueation = "Voulez-vous un caf\u{E9}?"
let combinedEcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQueation == combinedEcuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ",terminator:"")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

let s = "😀"
for ss in s.utf8 {
    print("\(ss) ", terminator: "")
}
print("")
for ss in s.utf16 {
    print("\(ss) ", terminator: "")
}










