//: Playground - noun: a place where people can play
var numbers = [20, 19, 7, 12]

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

let maximumNumberOfLoginAttemps = 10
var currentLoginAttemp = 0
var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue:Double

let 😈 = "hahh"
let 哈哈哈 = "hahaha"
let fd = "tuji"

//反引号
let `let` = "let"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "CPP"  //error

print(friendlyWelcome)
print(friendlyWelcome, terminator: "")
print(friendlyWelcome)

print("The current value of friendlyWelcome is \(friendlyWelcome)")

/* 这是第一个多行注释的开头
 /* 这是第二个被嵌套的多行注释 */
 这是第一个多行注释的结尾 */

let cat = "🐱"; print(cat)

let minValue = UInt8.min
let maxValue = UInt8.max

let meaningOfLife = 42
let pi = 3 + 0.1415

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1


let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
//SomeType(ofInitialValue) 是调用 Swift 构造器并传入一个初始值的默认方法
//注意，你并不能传入任意类型的值，只能传入 UInt16 内部有对应构造器的值。不过你可以扩展现有的类型来让它可以接收其他类型的值
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
//let pi2 = three + pointOneFourOneFiveNine
let pi2 = Double(three) + pointOneFourOneFiveNine
let pi3 = 3 + 0.14159


//当用这种方式来初始化一个新的整数值时，浮点值会被截断。也就是说 4.75 会变成 4，-3.9 会变成 -3
let integerPi = Int(pi2)

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible")
}

let i = 1
//if i {}

if i == 1 {}


let http404Error = (404,"Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The Status code is\(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (status: 200, description: "OK")
print("The status code is \(http200Status.status)")
print("The status message is \(http200Status.description)")


let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

var serverResponseCode: Int? = 404
serverResponseCode = nil

//如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil
var surveyAnswer: String?
//注意： 
//Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}
//你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber)")
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
}else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
if let first = Int("4") {
    if let second = Int("42") {
        if first < second && second < 100 {
            print("\(first) < \(second) < 100")
        }
    }
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString//不需要感叹号

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}

let age = -2
//assert(age >= 0, "A person's age connot be less than zero")



