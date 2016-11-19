//: Playground - noun: a place where people can play

//可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法
//如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。

//使用可选链式调用代替强制展开
/*
 通过在想调用的属性、方法、或下标的可选值后面放一个问号（?），可以定义一个可选链。这一点很像在可选值后面放一个叹号（!）来强制展开它的值。它们的主要区别在于当可选值为空时可选链式调用只会调用失败，然而强制展开将会触发运行时错误。
 
 为了反映可选链式调用可以在空值（nil）上调用的事实，不论这个调用的属性、方法及下标返回的值是不是可选值，它的返回结果都是一个可选值。你可以利用这个返回值来判断你的可选链式调用是否调用成功，如果调用有返回值则说明调用成功，返回nil则说明调用失败
 */

class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
let john = Person()
//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print(roomCount)//Int?通过可选绑定展开，并赋值给非可选类型的roomCount常量
    print("John's residence has \(roomCount) rooms")
} else {
    
    print("Unable to retrieve the number of rooms")
}
//因为访问numberOfRooms有可能失败，可选链式调用会返回Int?类型，或称为“可选的 Int”。如上例所示，当residence为nil的时候，可选的Int将会为nil，表明无法访问numberOfRooms。访问成功时，可选的Int值会通过可选绑定展开，并赋值给非可选类型的roomCount常量。

john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms")
} else {
    print("Unable to retrieve the number of rooms")
}





//为可选链式调用定义模型类
class Person2 {
    var residence: Residence2?
}
class Residence2 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get{
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingName != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
let john2 = Person2()
if let roomCount = john2.residence?.numberOfRooms {
    print("John2's residence has \(roomCount) rooms")
} else {
    print("Unable to retrieve the number of rooms")
}

let someAddress = Address()
someAddress.buildingNumber = "26"
someAddress.street = "Acacia Road"
john2.residence?.address = someAddress
//在这个例子中，通过john.residence来设定address属性也会失败，因为john.residence当前为nil

func creatAddress() -> Address {
    print("Function was called")
    let someAddress = Address()
    someAddress.buildingNumber = "26"
    someAddress.street = "Acacia Road"
    return someAddress
}
john2.residence?.address = creatAddress()


// printNumberOfRooms这个方法没有返回值。然而，没有返回值的方法具有隐式的返回类型Void，如无返回值函数中所述。这意味着没有返回值的方法也会返回()，或者说空的元组。

//如果在可选值上通过可选链式调用来调用这个方法，该方法的返回类型会是Void?，而不是Void，因为通过可选链式调用得到的返回值都是可选的。这样我们就可以使用if语句来判断能否成功调用printNumberOfRooms()方法，即使方法本身没有定义返回值
if john2.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms")
} else {
    print("It was not possible to print the number of rooms")
}
if (john2.residence?.address = someAddress) != nil {
    print("It was possible to set the address")
} else {
    print("It was not possble to set the address")
}


if let firstRoomName = john2.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name")
}
john2.residence?[0] = Room(name: "Bathroom")
//这次赋值同样会失败，因为residence目前是nil。

let johnsHouse = Residence2()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john2.residence = johnsHouse

if let firstRoomName = john2.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name ")
}

//访问可选类型的下标
var testScore = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScore["Dave"]?[0] = 91
testScore["Bev"]?[0] += 1
testScore["Briana"]?[0] = 72
print(testScore)


//连接多层可选链式调用
if let johnsStreet = john2.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john2.residence?.address = johnsAddress

if let johnsStreet = john2.residence?.address?.street {
    print("John2's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address")
}

if let buildingIdentifier = john2.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}
//如果要在该方法的返回值上进行可选链式调用，在方法的圆括号后面加上问号即可：

if let beginsWithThe = john2.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\"")
    } else {
        print("John's building identifier does not begin with \"The\"")
    }
}





