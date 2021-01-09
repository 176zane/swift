//: Playground - noun: a place where people can play

//全局函数是一个有名字但不会捕获任何值的闭包
//嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
//闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包

//闭包 Closure
//闭包可以捕获和存储其所在上下文中任意常量和变量的引用(!!!)

//闭包表达式 Closure Expressions

//sorted方法
let name = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = name.sorted(by: backward)
print(name)
print(reversedNames)

//闭包表达式语法 Closure Expression syntax
reversedNames = name.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(name)
print(reversedNames)

//根据上下文推断类型
//通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型
reversedNames = name.sorted(by: { s1, s2 in return s1 > s2})
print(name)
print(reversedNames)

//单表达式闭包隐式返回
//单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果
reversedNames = name.sorted(by: { s1, s2 in s1 > s2})
print(name)
print(reversedNames)

//参数名称缩写
//内联闭包有参数名称缩写功能 $0, $1按顺序调用。 如果在闭包表达式中使用参数名称缩写，可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略
reversedNames = name.sorted(by: { $0 > $1})
print(name)
print(reversedNames)

//运算符方法
//Swift的String类型定义了关于大于号（>)的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值
reversedNames = name.sorted(by: >)

//尾随闭包(不懂)
//尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用，在使用尾随闭包时， 你不用写出它的参数标签
func someFunctionThatTakesAClosure(closure: () -> Void) {
    //函数体部分
}
//以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    //闭包主体部分
})
//以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    //闭包主体部分
}
reversedNames = name.sorted() { $0 > $1}
//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，可以省略调()
reversedNames = name.sorted { $0 > $1}

//使用尾随闭包将Int类型数组[16, 58, 510] 转换为包含对应 String 类型的值的数组["OneSix", "FiveEight", "FiveOneZero"]
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
    return output
}
//strings常量被推断未字符串类型数组，[String]
print(strings)
/*Swift 的 Array 类型有一个 map(_:) 方法，这个方法获取一个闭包表达式作为其唯一参数。该闭包函数会为数组中的每一个元素调用一次，并返回该元素所映射的值。具体的映射方式和返回值类型由闭包来指定。
gfmap(_:) 为数组中每一个元素调用了一次闭包表达式。你不需要指定闭包的输入参数 number 的类型，因为可以通过要映射的数组类型进行推断。
在该例中，局部变量 number 的值由闭包中的 number 参数获得，因此可以在闭包函数体内对其进行修改，(闭包或者函数的参数总是常量)，闭包表达式指定了返回类型为 String，以表明存储映射值的新数组类型为 String。

闭包表达式在每次被调用的时候创建了一个叫做 output 的字符串并返回。其使用求余运算符（number % 10）计算最后一位数字并利用 digitNames 字典获取所映射的字符串。这个闭包能够用于创建任意正整数的字符串表示。

注意 字典 digitNames 下标后跟着一个叹号（!），因为字典下标返回一个可选值（optional value），表明该键不存在时会查找失败。在上例中，由于可以确定 number % 10 总是 digitNames 字典的有效下标，因此叹号可以用于强制解包 (force-unwrap) 存储在下标的可选类型的返回值中的String类型的值。*/


//值捕获
//闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和边连峰的原作用域已经不存在，闭包仍可以在闭包函数体内引用和修改这些值
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
//incrementer()函数并没有任何参数，但是在函数体内访问了runninglTotal和amount变量。这是因为它从外围函数捕获了runningTotal和amount变量的引用。捕获引用保证了runningTotal和amount变量在调用完makeIncrementer后不会消失
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
print(incrementByTen())

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

//如果你将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其他成员而捕获了该实例，你将在闭包和该实例之间创建一个循环强引用。Swift使用捕获列表来打破这种循环强引用。

//闭包是引用类型
//无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用
let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())

//逃逸闭包 Escaping Closure
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受作为参数的函数时，你可以在参数名之前标注@escaping,用来指明这个闭包是允许“逃逸”出这个函数的。

var completionHanders:[() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler:@escaping () ->Void) {
    completionHanders.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHanders.first?()
print(instance.x)


//自动闭包 Autoclosures
//自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种遍历语法让你能够省略闭包的花括号，用一个普通的表达式来代替显示的闭包

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())")
print(customersInLine.count)

print(customersInLine)
func serve(customer customerProvider: () ->String) {
    print("now serving \(customerProvider())")
}
serve(customer: { customersInLine.remove(at: 0)})

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())")
}
serve(customer: customersInLine.remove(at: 0))

print(customersInLine)
var customerProviders:[() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
print(customersInLine)
print("collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())")
}





