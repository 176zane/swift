//: Playground - noun: a place where people can play
//Swift 还增加了可选（Optional）类型，用于处理值缺失的情况。可选表示 “那儿有一个值，并且它等于 x ” 或者 “那儿没有值” 。可选有点像在 Objective-C 中使用 nil ，但是它可以用在任何类型上，不仅仅是类
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
//尽量不要使用 UInt，除非你真的需要存储一个和当前平台原生字长相同的无符号整数。除了这种情况，最好使用 Int，即使你要存储的值已知是非负的。统一使用 Int 可以提高代码的可复用性，避免不同类型数字之间的转换，并且匹配数字的类型推断
//Double 精确度很高，至少有15位数字，而 Float 只有6位数字。选择哪个类型取决于你的代码需要处理的值的范围，在两种类型都匹配的情况下，将优先选择 Double。
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
//结合数字类常量和变量不同于结合数字类字面量。字面量 3 可以直接和字面量 0.14159 相加，因为数字字面量本身没有明确的类型。它们的类型只在编译器需要求值的时候被推测。

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

//C 和 Objective-C 中并没有可选类型这个概念。最接近的是 Objective-C 中的一个特性，一个方法要不返回一个对象要不返回 nil，nil 表示“缺少一个合法的对象”。然而，这只对对象起作用——对于结构体，基本的 C 类型或者枚举类型不起作用。对于这些类型，Objective-C 方法一般会返回一个特殊值（比如 NSNotFound）来暗示值缺失。这种方法假设方法的调用者知道并记得对特殊值进行判断。然而，Swift 的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值。
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

var serverResponseCode: Int? = 404
serverResponseCode = nil

//如果你声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil
var surveyAnswer: String?
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
//在 if 条件语句中使用常量和变量来创建一个可选绑定，仅在 if 语句的句中（body）中才能获取到值。相反，在 guard 语句中使用常量和变量来创建一个可选绑定，仅在 guard 语句外且在语句后才能获取到值
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
//当你使用一个隐式解析可选值时，Swift 首先会把它当作普通的可选值；如果它不能被当成可选类型使用，Swift 会强制解析可选值。在以上的代码中，可选值 assumedString 在把自己的值赋给 implicitString 之前会被强制解析，原因是 implicitString 本身的类型是非可选类型的 String。在下面的代码中，optionalString 并没有显式的数据类型。那么根据类型推断，它就是一个普通的可选类型。
let optionalString = assumedString
// optionalString 的类型是 "String?"，assumedString 也没有被强制解析。

if assumedString != nil {
    print(assumedString!)
}

if let definiteString = assumedString {
    print(definiteString)
}
//断言和先决条件的不同点是，他们什么时候进行状态检测：断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行。在生产环境中，断言的条件将不会进行评估。这个意味着你可以使用很多断言在你的开发阶段，但是这些断言在生产环境中不会产生任何影响。
let age = -2
//assert(age >= 0, "A person's age connot be less than zero")
// 在一个下标的实现里...
let index = -2
//precondition(index > 0, "Index must be greater than zero.")


