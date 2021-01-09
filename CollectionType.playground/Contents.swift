//: Playground - noun: a place where people can play
//Swift 中的数组、集合和字典必须明确其中保存的键和值类型，这样就可以避免插入一个错误数据类型的值。同理，对于获取到的值你也可以放心，其数据类型是确定的。
//数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(2)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles
var shoppingList:[String] = ["Eggs","Milk"]
var testArray = ["Eggs",2] as [Any]

print("The shopping list contains \(shoppingList.count) items.")
if shoppingList.isEmpty {
    print("The shopplist is empty")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)
shoppingList.insert("Maple syrup", at: 0)
print(shoppingList)
let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)
firstItem = shoppingList[0]
let apples = shoppingList.removeLast()
print(shoppingList)

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//集合用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")
letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock", "Classicla", "Hip hop"]
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
print("I have \(favoriteGenres.count) favorite music genres.")
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
}else {
    print("I have paticular music preferences")
}

favoriteGenres.insert("Jazz")

if let removesGenre = favoriteGenres.remove("Rock") {
    print("\(removesGenre)? I'm over it")
} else {
    print("I never much cared for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot")
} else {
    print("It's too funky in here")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
//字典是一种无序的集合，它存储的是键值对之间的关系，其所有键的值需要是相同的类型，所有值的类型也需要相同。每个值（value）都关联唯一的键（key），键作为字典中这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The dictionary of airports contains \(airports.count) items")
if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}
//可以在字典中使用下标语法来添加新的数据项
airports["LHR"] = "London"
print(airports)
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
}
airports["APL"] = "Apple Internation"
print(airports)
airports["APL"] = nil;
print(airports)

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB")
}


for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)





		
