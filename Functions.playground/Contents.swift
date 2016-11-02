//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greet(person: "Anna"))

func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

//func greet(person: String) {
//    print("Hello, \(person)!")
//}
//greet(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "Hello, world")
printWithoutCounting(string: "Hello, world")


//func minMax(array: [Int]) -> (min: Int, max: Int) {
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currentMin {
//            currentMin = value
//        }else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//let bounds = minMax(array: [8, -6, 2, 102, 3,65])
//printWithoutCounting(string: "min is \(bounds.min) and max is \(bounds.max)")


func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}


func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//可以在参数名称前指定它的参数标签，中间以空格分隔
func otherFunction(argumentLabel parameterName: Int) {
   
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}
print(greet(person: "Bill", from: "Cupertino"))

//如果你不希望为某个参数添加一个标签，可以使用一个下划线(_)来代替一个明确的参数标签。
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)

//将不带有默认值的参数放在函数参数列表的最前
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}
someFunction(parameterWithoutDefault: 5, parameterWithDefault: 8)
someFunction(parameterWithoutDefault: 4)


func arithmeticMean (_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8, 24.32)
//一个函数最多只能拥有一个可变参数


//函数参数默认是常量
//定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值
//你只能传递变量给输入输出参数
//输入输出参数不能有默认值，而且可变参数不能用 inout 标记

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3;
var anotherInt = 104
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//这两个函数的类型是 (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
//这个函数的类型是：() -> Void
func printHelloWorld() {
    print("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Tesult: \(mathFunction(2, 3))")

//类型推断
let anotherMathFunction = addTwoInts


func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)


//func stepFoward(_ input: Int) -> Int {
//    return input + 1
//}
//func stepBackward(_ input: Int) -> Int {
//    return input - 1
//}
//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    return backward ? stepBackward : stepFoward
//}
//
//var currentValue = 3
//let moveNearToZero = chooseStepFunction(backward: currentValue > 0)
//print("Counting to zero:")
//while currentValue != 0 {
//    print("\(currentValue)...")
//    currentValue = moveNearToZero(currentValue)
//}
//print("zero!")


func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1}
    func stepBackward(input: Int) -> Int { return input - 1}
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero")











