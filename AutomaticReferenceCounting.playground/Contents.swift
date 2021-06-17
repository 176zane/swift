//: Playground - noun: a place where people can play

//自动引用计数

class Person {
    let name: String
    init(name: String) {
        self.name = name
        //print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "John")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
reference3 = nil

//循环引用
class Person2 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person2?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person2?
var unit4A: Apartment?
john = Person2(name: "Beth")
unit4A = Apartment(unit: "2A")

john!.apartment = unit4A
unit4A!.tenant = john
john = nil
unit4A = nil
//循环引用，析构函数不会被调用


//当其他的实例有更短的生命周期时，使用弱引用，也就是说，当其他实例析构在先时。在上面公寓的例子中，很显然一个公寓在它的生命周期内会在某个时间段没有它的主人，所以一个弱引用就加在公寓类里面，避免循环引用。相比之下，当其他实例有相同的或者更长生命周期时，请使用无主引用。

//弱引用
class Person3 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment:Apartment3?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Apartment3 {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person3?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
print("+++")
var john3: Person3?
var unit4A3: Apartment3?
john3 = Person3(name: "Jhon3")
unit4A3 = Apartment3(unit: "3A")
john3?.apartment = unit4A3
unit4A3?.tenant = john3
john3 = nil
unit4A3 = nil
print("---")

//无主引用
//无主引用在其他实例有相同或者更长生命周期时使用。
//无主引用通常都被期望拥有值。不过 ARC 无法在实例被销毁后将无主引用设为nil，因为非可选类型的变量不允许被赋值为nil。
//使用无主引用，你必须确保引用始终指向一个未销毁的实例。如果你试图在实例被销毁后，访问该实例的无主引用，会触发运行时错误。
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}
var rose: Customer?
rose = Customer(name: "Rose")
rose!.card = CreditCard(number: 1234_5678_4594_1545, customer: rose!)
rose = nil

//无主引用以及隐式解析可选属性
//Person和Apartment的例子展示了两个属性的值都允许为nil，并会潜在的产生循环强引用。这种场景最适合用弱引用来解决。

//Customer和CreditCard的例子展示了一个属性的值允许为nil，而另一个属性的值不允许为nil，这也可能会产生循环强引用。这种场景最适合通过无主引用来解决。

//然而，存在着第三种场景，在这种场景中，两个属性都必须有值，并且初始化完成后永远不会为nil。在这种场景中，需要一个类使用无主属性，而另外一个类使用隐式解析可选属性。

class Country {
    let name: String
    var capitalCity: City!//隐式解析可选属性
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country//无主引用
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
//Country的构造函数调用了City的构造函数,只有Country的实例完全初始化后，Country的构造函数才能把self传给City的构造函数。在两段式构造过程中有具体描述
//为了满足这种需求，通过在类型结尾处加上感叹号（City!）的方式，将Country的capitalCity属性声明为隐式解析可选类型的属性。这意味着像其他可选类型一样，capitalCity属性的默认值为nil，但是不需要展开它的值就能访问它
//由于capitalCity默认值为nil，一旦Country的实例在构造函数中给name属性赋值后，整个初始化过程就完成了。这意味着一旦name属性被赋值后，Country的构造函数就能引用并传递隐式的self。Country的构造函数在赋值capitalCity时，就能将self作为参数传递给City的构造函数。
var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")



//闭包引起的循环强引用
//循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例时。这个闭包体中可能访问了实例的某个属性，例如self.someProperty，或者闭包中调用了实例的某个方法，例如self.someMethod()。这两种情况都导致了闭包“捕获”self，从而产生了循环强引用。
//Swift 提供了一种优雅的方法来解决这个问题，称之为闭包捕获列表（closure capture list
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        } else {
            return"<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)<\(heading.name)>"
}
print(heading.asHTML())
//asHTML声明为lazy属性，因为只有当元素确实需要被处理为 HTML 输出的字符串时，才需要使用asHTML。也就是说，在默认的闭包中可以使用self，因为只有当初始化完成以及self确实存在后，才能访问lazy属性

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello,world")
print(paragraph!.asHTML())
paragraph = nil
//该实例并没有销毁


//解决闭包引起的循环强引用
//在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用

//在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用。
//相反的，在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil。这使我们可以在闭包体内检查它们是否存在。
//如果被捕获的引用绝对不会变为nil，应该用无主引用，而不是弱引用

class HTMLElement2 {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        } else {
            return"<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being dinitialized")
    }
}
var paragraph2: HTMLElement2? = HTMLElement2(name: "p2", text: "hahahahah")
print(paragraph2!.asHTML())
paragraph2 = nil




