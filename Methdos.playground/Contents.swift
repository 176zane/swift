//: Playground - noun: a place where people can play

//方法是与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法；实例方法为给定类型的实例封装了具体的任务与功能。类、结构体、枚举也可以定义类型方法；类型方法与类型本身相关联。类型方法与 Objective-C 中的类方法（class methods）相似。

//实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.incrementBy(by: 5)
print(counter.count)
counter.reset()
print(counter.count)

//self属性
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

//结构和枚举是值类型，默认情况下， 值类型的属性不能在它的实例方法中被修改
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

//注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性，
let fixedPoint = Point2(x: 3.0, y:3.0)
//fixedPoint.moveByX(x: 2.0, y: 3.0)

//Assigning to self Within a Mutating Method
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

//枚举的可变方法可以把self设置为同一枚举类型中不同的成员
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
print(ovenLight)




//Type Method
class SomeClass {
    class func someTypeMethod() {
        
    }
}
SomeClass.someTypeMethod()
//在类型方法的方法体（body）中，self指向这个类型本身，而不是类型的某个实例。这意味着你可以用self来消除类型属性和类型方法参数之间的歧义（类似于我们在前面处理实例属性和实例方法参数时做的那样）


struct levelTracker {
    static var highestUnlockedLever = 1
    var currentLevel = 1
    
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLever {
            highestUnlockedLever = level
        }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLever
    }
    
    @discardableResult
    mutating func advace(to level: Int) -> Bool {
        if levelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player {
    var tracker = levelTracker()
    let playerName: String
    func  complete(level: Int) {
        levelTracker.unlock(level + 1)
        tracker.advace(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(levelTracker.highestUnlockedLever)")
player = Player(name: "Beto")
if player.tracker.advace(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not ye been unlocked")
}




