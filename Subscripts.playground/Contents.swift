//: Playground - noun: a place where people can play


//下标 （subscripts）可以定义在类（class）、结构体（structure）和枚举（enumeration）中，是访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。可以使用下标的索引，设置和获取值，而不需要再调用对应的存取方法举例来说，用下标访问一个Array实例中的元素可以写作someArray[index]，访问Dictionary实例中的元素可以写作someDictionary[key]。

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six time three is \(threeTimesTable[6])")


var numberOfLegs = ["spider": 8, "ant": 6, "cat":4]
numberOfLegs["bird"] = 2


struct Matrix {
    let rows: Int, columns: Int
    var grid : [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating:0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * column) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix)

//let someValue = matrix[2, 2]














