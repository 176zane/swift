//: Playground - noun: a place where people can play

//import UIKit
//赋值符（=）不再有返回值，这样就消除了手误将判等运算符（==）写成赋值符导致代码错误的缺陷。算术运算符（+，-，*，/，% 等）的结果会被检测并禁止值溢出，以此来避免保存变量时由于变量大于或小于其类型所能承载的范围时导致的异常结果。
var str = "Hello, playground"

let b = 10
var a = 3
a = b

var (x, y) = (1, 2)

//if x = y {}//此句错误, 因为 x = y 并不返回任何值
"Hello, " + "World"

//a % b      a = (b * 倍数) + 余数
-9 % 4
//在对负数 b 求余时，b 的符号会被忽略。这意味着 a % b 和 a % -b 的结果是相同的

let three = 3
let minusThree = -three
let plusThree = -minusThree

let minusSix = -6
let alsoMinusSix = +minusSix

a += 2
//复合赋值运算没有返回值，let b = a += 2这类代码是错误。这不同于上面提到的自增和自减运算符。

1 == 1
2 != 1
2 > 1
1 < 1
1 >= 1
2 <= 1

let name = "World"
if name == "World" {
    print("Hello, World")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//空合运算符（a ?? b）将对可选类型 a 进行空判断，如果 a 包含一个值就进行解封，否则就返回一个默认值 b
//a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

let names = ["Anna", "Alex","Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("第\(i + 1) 个人叫 \(names[i])")
}

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword{
    print("Welcome")
} else {
    print("ACCESS DENIED")
}

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("ACCESS DENIED")
}
//注意： Swift 逻辑操作符 && 和 || 是左结合的，这意味着拥有多元逻辑操作符的复合表达式优先计算最左边的子表达式。

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("ACCESS DENIED")
}
