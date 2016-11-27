//: Playground - noun: a place where people can play

import UIKit

//访问控制
//你可以明确地给单个类型（类、结构体、枚举）设置访问级别，也可以给这些类型的属性、方法、构造器、下标等设置访问级别。协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变量和函数。

//模块和源文件

//访问级别
/*
 Swift 为代码中的实体提供了五种不同的访问级别。这些访问级别不仅与源文件中定义的实体相关，同时也与源文件所属的模块相关。
 
    开放访问和公开访问可以访问同一模块源文件中的任何实体，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，框架中的某个接口可以被任何人使用时，你可以将其设置为开放或者公开访问。
    内部访问可以访问同一模块源文件中的任何实体，但是不能从模块外访问该模块源文件中的实体。通常情况下，某个接口只在应用程序或框架内部使用时，你可以将其设置为内部访问。
    文件私有访问限制实体只能被所定义的文件内部访问。当需要把这些细节被整个文件使用的时候，使用文件私有访问隐藏了一些特定功能的实现细节。
    私有访问限制实体只能在所定义的作用域内使用。需要把这些细节被整个作用域使用的时候，使用文件私有访问隐藏了一些特定功能的实现细节。
    开放访问为最高（限制最少）访问级别，私有访问为最低（限制最多）访问级别。
 
 开放访问只作用于类类型和类的成员，它和公开访问的区别如下：
 
    公开访问或者其他更严访问级别的类，只能在它们定义的模块内部被继承。
    公开访问或者其他更严访问级别的类成员，只能在它们定义的模块内部的子类中重写。
    开放访问的类，可以在它们定义的模块中被继承，也可以在引用它们的模块中被继承。
    开放访问的类成员，可以在它们定义的模块中子类中重写，也可以在引用它们的模块中的子类重写。
    把一个类标记为开放，显式地表明，你认为其他模块中的代码使用此类作为父类，然后你已经设计好了你的类的代码了。
 */

//访问级别基本原则
/*
 Swift 中的访问级别遵循一个基本原则：不可以在某个实体中定义访问级别更低（更严格）的实体。
 
 例如：
 
    一个公开访问级别的变量，其类型的访问级别不能是内部，文件私有或是私有类型的。因为无法保证变量的类型在使用变量的地方也具有访问权限。
    函数的访问级别不能高于它的参数类型和返回类型的访问级别。因为这样就会出现函数可以在任何地方被访问，但是它的参数类型和返回类型却不可以的情况
 */
//默认访问级别：  internal(特殊情况除外)

//访问控制语法
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVarible = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

//自定义类型
//一个类型的访问级别也会影响到类型成员（属性、方法、构造器、下标）的默认访问级别。如果你将类型指定为私有或者文件私有级别，那么该类型的所有成员的默认访问级别也会变成私有或者文件私有级别。如果你将类型指定为公开或者内部访问级别（或者不明确指定访问级别，而使用默认的内部访问级别），那么该类型的所有成员的默认访问级别将是内部访问。
//上面提到，一个公开类型的所有成员的访问级别默认为内部访问级别，而不是公开级别。如果你想将某个成员指定为公开访问级别，那么你必须显式指定。这样做的好处是，在你定义公共接口的时候，可以明确地选择哪些接口是需要公开的，哪些是内部使用的，避免不小心将内部使用的接口公开。

public class PublicClass {                      //显式公开类
    public var somePublicProperty = 0           //显式公开类成员
    var someInternalProperty = 0                //隐式内部类成员
    fileprivate func someFilePrivateMethod() {} //显式文件私有成员类
    private func somePrivateMethod() {}         //显式私有类成员
}
class InternalClass {                           //隐式内部类
    var someInternalProperty = 0                //隐式内部类成员
    fileprivate func someFilePrivareMethod() {} //显式文件私有类成员
    private func somePrivateMethod() {}         //显式私有类成员
}
fileprivate class FilePrivateClass {            //显式文件私有类
    func someFilePrivateMethod() {}             //隐式文件私有类成员
    private func somePrivateMethod() {}         //显式私有类成员
}
private class PrivateClass {                    //显式私有类
    func PrivateMethod() {}                     //隐式私有类成员
}

//元祖类型
//元祖的访问级别将由元祖中访问级别最严格的类型来决定。不同于类、结构体、枚举、函数那样有单独的定义。元祖的访问级别是在它被使用时自动推断出的，而无法明确指定

//函数类型
//函数的访问级别根据访问级别最严格的参数类型或返回类型的访问级别来决定。但是，如果这种访问级别不符合函数定义所在环境的默认访问级别，那么就需要明确地指定该函数的访问级别。

//枚举类型
//枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。
//枚举定义中的任何原始值或关联值的类型的访问级别至少不能低于枚举类型的访问级别。例如，你不能在一个 internal 访问级别的枚举中定义 private 级别的原始值类型。
public enum CompassPoint {
    case north
    case south
    case east
    case west
}

//嵌套类型
//如果在 private 级别的类型中定义嵌套类型，那么该嵌套类型就自动拥有 private 访问级别。如果在 public 或者 internal 级别的类型中定义嵌套类型，那么该嵌套类型自动拥有 internal 访问级别。如果想让嵌套类型拥有 public 访问级别，那么需要明确指定该嵌套类型的访问级别

//子类
//子类的访问级别不得高于父类的访问级别。例如，父类的访问级别是 internal，子类的访问级别就不能是 public。
//可以通过重写为继承来的类成员提供更高的访问级别
public class A {
    fileprivate func someMethod() {}
}
internal class B: A {
    override internal func someMethod() {}
}
//我们甚至可以在子类中，用子类成员去访问访问级别更低的父类成员，只要这一操作在相应访问级别的限制范围内
internal class C: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

//常量、变量、属性、下标
//常量、变量、属性不能拥有比它们的类型更高的访问级别

//Getter和Setter
//常量、变量、属性、下标的 Getters 和 Setters 的访问级别和它们所属类型的访问级别相同。
//Setter 的访问级别可以低于对应的 Getter 的访问级别，这样就可以控制变量、属性或下标的读写权限
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked"
stringToEdit.value += "This edit will increment numberOfEdits"
stringToEdit.value += "So wil this one"
print("The number of edits is \(stringToEdit.numberOfEdits)")

//你可以在必要时为 Getter 和 Setter 显式指定访问级别
public struct TrackedString2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}

//构造器
//自定义构造器的访问级别可以低于或等于其所属类型的访问级别。唯一的例外是必要构造器，它的访问级别必须和所属类型的访问级别相同。

//默认构造器
//默认构造器的访问级别与所属类型的访问级别相同，除非类型的访问级别是 public。如果一个类型被指定为 public 级别，那么默认构造器的访问级别将为 internal。如果你希望一个 public 级别的类型也能在其他模块中使用这种无参数的默认构造器，你只能自己提供一个 public 访问级别的无参数构造器。
//协议
//协议中的每一个要求都具有和该协议相同的访问级别。你不能将协议中的要求设置为其他访问级别。这样才能确保该协议的所有要求对于任意采纳者都将可用。
//协议继承
//如果定义了一个继承自其他协议的新协议，那么新协议拥有的访问级别最高也只能和被继承协议的访问级别相同
//协议一致性
//采纳了协议的类型的访问级别取它本身和所采纳协议两者间最低的访问级别。也就是说如果一个类型是 public 级别，采纳的协议是 internal 级别，那么采纳了这个协议后，该类型作为符合协议的类型时，其访问级别也是 internal。


//扩展
//你可以在访问级别允许的情况下对类、结构体、枚举进行扩展。扩展成员具有和原始类型成员一致的访问级别。
//或者，你可以明确指定扩展的访问级别（例如，private extension），从而给该扩展中的所有成员指定一个新的默认访问级别。这个新的默认访问级别仍然可以被单独指定的访问级别所覆盖。

//通过扩展添加协议一致性
//如果你通过扩展来采纳协议，那么你就不能显式指定该扩展的访问级别了。协议拥有相应的访问级别，并会为该扩展中所有协议要求的实现提供默认的访问级别。









